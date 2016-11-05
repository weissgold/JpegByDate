-- Verwendete Packages
with Globals;

-- Package für TiffPicture  als Childpackage von Picture
package body Pictures.TiffPictures is

   -- Konstruktor
   function create(name: String; buffer: Ada.Strings.Unbounded.Unbounded_String) return access TiffPicture is
      picture: access TiffPicture := new TiffPicture;
      I: Integer;
      part_length: Integer;
      eos: Integer;
   begin
      if isTiff(buffer) then
         -- Buffer beinhaltet Tiff Datei
         picture.all.name := Ada.Strings.Unbounded.To_Unbounded_String(name);
         picture.all.binary := buffer;

         -- Endianness
         if Ada.Strings.Unbounded.Element(buffer, 3) = Character'Val(16#2A#) then
            picture.all.little_endian := True;
         else
            picture.all.little_endian := False;
         end if;

         -- Mindestgröße überprüfen
         if Ada.Strings.Unbounded.Length(buffer) < 8 then
            -- keine EXIF Daten in zu kleinem Bild
            return picture;
         end if;

         -- Offset für IFD0 aus Pointer erstellen
         I := picture.createInt(Ada.Strings.Unbounded.Element(buffer, 5), Ada.Strings.Unbounded.Element(buffer, 6), Ada.Strings.Unbounded.Element(buffer, 7), Ada.Strings.Unbounded.Element(buffer, 8)) + 1; -- 0-Index wäre schöner...
         if Ada.Strings.Unbounded.Length(buffer) <= I then
            -- Bilddatei zu klein...
            raise Illegal_Format with "EOF reached before begin of IFD0!";
         end if;

         -- Länge von IFD0 berechnen
         part_length := picture.createInt(Ada.Strings.Unbounded.Element(buffer, I+0), Ada.Strings.Unbounded.Element(buffer, I+1)) * 12 + 2 + 4;
         if Ada.Strings.Unbounded.Length(buffer) < I+part_length-1 then
            -- Bilddatei zu klein...
            raise Illegal_Format with "EOF reached before end of IFD0!";
         end if;

         -- Start am ersten Directory
         eos := I + part_length;
         I := I + 2;

         -- IFD0 durchsuchen
         while I < eos loop
            -- EXIF-Tag gefunden
            if picture.createInt(Ada.Strings.Unbounded.Element(buffer, I+0), Ada.Strings.Unbounded.Element(buffer, I+1)) = Globals.exif.tag and
              picture.createInt(Ada.Strings.Unbounded.Element(buffer, I+2), Ada.Strings.Unbounded.Element(buffer, I+3)) = Globals.exif.tag_Type and
              picture.createInt(Ada.Strings.Unbounded.Element(buffer, I+4), Ada.Strings.Unbounded.Element(buffer, I+5), Ada.Strings.Unbounded.Element(buffer, I+6), Ada.Strings.Unbounded.Element(buffer, I+7)) = Globals.exif.tag_Length then
               -- Neues Offset berechnen
               I := picture.createInt(Ada.Strings.Unbounded.Element(buffer, I+8), Ada.Strings.Unbounded.Element(buffer, I+9), Ada.Strings.Unbounded.Element(buffer, I+10), Ada.Strings.Unbounded.Element(buffer, I+11)) + 1; -- 0-Index wäre schöner...

               -- Länge überprüfen
               if Ada.Strings.Unbounded.Length(buffer) <= I then
                  -- Bilddatei zu klein...
                  raise Illegal_Format with "EOF reached before begin of EXIF SubIFD!";
               end if;

               -- Länge von EXIF SubIFD berechnen
               part_length := picture.createInt(Ada.Strings.Unbounded.Element(buffer, I+0), Ada.Strings.Unbounded.Element(buffer, I+1)) * 12 + 2;
               if Ada.Strings.Unbounded.Length(buffer) < I+part_length-1 then
                  -- Bilddatei zu klein...
                  raise Illegal_Format with "EOF reached before end of EXIF SubIFD!";
               end if;

               -- EXIF Parser anlegen
               declare
                  exif_tmp: access EXIFParsers.EXIFParser := null;
               begin
                  exif_tmp := EXIFParsers.create(Ada.Strings.Unbounded.Slice(buffer, I+2, I+part_length-1), picture);
                  picture.exif := exif_tmp;
               exception
                  -- Falls keine EXIF Informationen vorhanden
                  -- KEINE AKTION -> Bild wird ohne EXIF erstellt
                  when E: others =>
                     null;
               end;

               -- Neues Bild zurückgeben
               return picture;
            end if;

            -- Nächstes Directory
            I := I + 12;
         end loop;

         -- Neues Bild zurückgeben
         return picture;
      else
         -- Buffer beinhaltet Müll
         raise Unknown_Format with "File does not contain Tiff data!";
      end if;
   end create;

   -- Bild EXIF Informationen vorhanden
   function hasEXIF(This: access TiffPicture) return Boolean is
   begin
      if This.all.exif = null then
         return False;
      else
         return True;
      end if;
   end hasEXIF;

   -- Bild EXIF Informationen zurück geben
   function getEXIF(This: access TiffPicture) return access EXIFParsers.EXIFParser is
   begin
      return This.all.exif;
   end getEXIF;

   -- DWORD und WORD anhand Endianness erstellen
   function createInt(This: access TiffPicture; b0: Character; b1: Character) return Integer is
   begin
      if This.all.little_endian then
         return Character'Pos(b1) * 16#100# + Character'Pos(b0);
      else
         return Character'Pos(b0) * 16#100# + Character'Pos(b1);
      end if;
   end createInt;
   function createInt(This: access TiffPicture; b0: Character; b1: Character; b2: Character; b3: Character) return Integer is
   begin
      if This.all.little_endian then
         return Character'Pos(b3) * 16#1000000# + Character'Pos(b2) * 16#10000# + Character'Pos(b1) * 16#100# + Character'Pos(b0);
      else
         return Character'Pos(b0) * 16#1000000# + Character'Pos(b1) * 16#10000# + Character'Pos(b2) * 16#100# + Character'Pos(b3);
      end if;
   end createInt;

   -- Binärdaten lesen
   function readBinary(This: access TiffPicture; First: Integer; Last:Integer) return String is
   begin
      return Ada.Strings.Unbounded.Slice(This.all.binary, First, Last);
   end readBinary;

   -- Statische Buffercheckfunktion
   function isTiff(buffer: Ada.Strings.Unbounded.Unbounded_String) return Boolean is
      -- TIFF Magic Numbers:
      -- https://en.wikipedia.org/wiki/List_of_file_signatures
      -- https://www.media.mit.edu/pia/Research/deepview/exif.html
   begin
      if Ada.Strings.Unbounded.Length(buffer) < 4 then
         -- Dateigröße zu klein für TIFF Magic Number
         return False;
      elsif Ada.Strings.Unbounded.Element(buffer, 1) = Character'Val(16#49#) and
        Ada.Strings.Unbounded.Element(buffer, 2) = Character'Val(16#49#) and
        Ada.Strings.Unbounded.Element(buffer, 3) = Character'Val(16#2A#) and
        Ada.Strings.Unbounded.Element(buffer, 4) = Character'Val(16#00#) then
         -- Magic Number entspricht TIFF little endian
         return True;
      elsif Ada.Strings.Unbounded.Element(buffer, 1) = Character'Val(16#4D#) and
        Ada.Strings.Unbounded.Element(buffer, 2) = Character'Val(16#4D#) and
        Ada.Strings.Unbounded.Element(buffer, 3) = Character'Val(16#00#) and
        Ada.Strings.Unbounded.Element(buffer, 4) = Character'Val(16#2A#) then
         -- Magic Number entspricht TIFF big endian
         return True;
      else
         -- kein gültiges Format
         return False;
      end if;
   end isTiff;

end Pictures.TiffPictures;
