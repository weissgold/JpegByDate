-- Verwendete Packages
--> NONE

-- Package für JpegPicture  als Childpackage von Picture
package body Pictures.JpegPictures is

   -- Konstruktor
   function create(name: String; buffer: Ada.Strings.Unbounded.Unbounded_String) return access JpegPicture is
      -- JPEG Format
      -- https://www.media.mit.edu/pia/Research/deepview/exif.html

      picture: access JpegPicture := new JpegPicture;
   begin
      if isJpeg(buffer) then
         -- Buffer beinhaltet Jpeg Datei
         picture.all.name := Ada.Strings.Unbounded.To_Unbounded_String(name);
         picture.all.binary := buffer;

         -- EXIF Format suchen
         declare
            tiff: access TiffPictures.TiffPicture;
            I: Integer := 3; -- Start nach SOI
            part_length: Integer;
         begin
            -- EXIF/TIFF suchen
            picture.all.tiff_sublayer := null;
            while I+3 <= Ada.Strings.Unbounded.Length(buffer) loop
               -- Segmentlänge
               part_length := Character'Pos(Ada.Strings.Unbounded.Element(buffer, I+2)) * 16#100# + Character'Pos(Ada.Strings.Unbounded.Element(buffer, I+3));

               -- Segment überprüfen
               if I+2+part_length > Ada.Strings.Unbounded.Length(buffer) then
                  raise Illegal_Format with "JPEG tag size reaches over EOI!";
               end if;

               -- Segment-Tag abfragen
               if Ada.Strings.Unbounded.Element(buffer, I) = Character'Val(16#FF#) and
                 Ada.Strings.Unbounded.Element(buffer, I+1) = Character'Val(16#E1#) then
                  -- EXIF Header überprüfen
                  if part_length >= 8 and
                    Ada.Strings.Unbounded.Element(buffer, I+4) = Character'Val(16#45#) and
                    Ada.Strings.Unbounded.Element(buffer, I+5) = Character'Val(16#78#) and
                    Ada.Strings.Unbounded.Element(buffer, I+6) = Character'Val(16#69#) and
                    Ada.Strings.Unbounded.Element(buffer, I+7) = Character'Val(16#66#) and
                    Ada.Strings.Unbounded.Element(buffer, I+8) = Character'Val(16#00#) and
                    Ada.Strings.Unbounded.Element(buffer, I+9) = Character'Val(16#00#) then
                     -- Tiff Bild aus Unterbereich anlegen
                     tiff := TiffPictures.create(name, Ada.Strings.Unbounded.To_Unbounded_String(Ada.Strings.Unbounded.Slice(buffer, I+4+6, I+part_length+1)));
                     picture.all.tiff_sublayer := tiff;
                  end if;

                  -- Neues Bild zurückgeben
                  return picture;
               end if;

               -- nächstes Segment überprüfen
               I := I + part_length + 2;
            end loop;

         exception
            -- Falls JPEG kein EXIF/TIFF beinhaltet
            when E: others =>
               picture.all.tiff_sublayer := null;
         end;

         -- Neues Bild zurückgeben
         return picture;
      else
         -- Buffer beinhaltet Müll
         raise Unknown_Format with "File does not contain Jpeg data!";
      end if;
   end create;

   -- Bild EXIF Informationen vorhanden
   function hasEXIF(This: access JpegPicture) return Boolean is
   begin
      if This.all.tiff_sublayer = null then
         return False;
      else
         return This.all.tiff_sublayer.hasEXIF;
      end if;
   end hasEXIF;

   -- Bild EXIF Informationen zurück geben
   function getEXIF(This: access JpegPicture) return access EXIFParsers.EXIFParser is
   begin
      if This.all.tiff_sublayer = null then
         return null;
      else
         return This.all.tiff_sublayer.getEXIF;
      end if;
   end getEXIF;

   -- Statische Buffercheckfunktion
   function isJpeg(buffer: Ada.Strings.Unbounded.Unbounded_String) return Boolean is
      -- JFIF Magic Numbers:
      -- https://en.wikipedia.org/wiki/List_of_file_signatures
      -- http://parsys.informatik.uni-oldenburg.de/~stego/seminar/jpeg_SS_ewi_A.pdf
      -- ANMERKUNG: ADA ist eine Krankheit! In C wären die Binärarray Zugriffe kein Problem!
      -- Außerdem würde ich gerne mit dem sinnvollen 0-Index arbeiten und nicht mit dieser 1-er Krankheit.
   begin
      if Ada.Strings.Unbounded.Length(buffer) < 4 then
         -- Dateigröße zu klein für JFIF SOI und EOI
         return False;
      elsif Ada.Strings.Unbounded.Element(buffer, 1) /= Character'Val(16#FF#) or
        Ada.Strings.Unbounded.Element(buffer, 2) /= Character'Val(16#D8#) then
         -- Magic Number entspricht nicht JFIF SOI
         return False;
      elsif Ada.Strings.Unbounded.Element(buffer, Ada.Strings.Unbounded.Length(buffer) - 1) /= Character'Val(16#FF#) or
        Ada.Strings.Unbounded.Element(buffer, Ada.Strings.Unbounded.Length(buffer) - 0) /= Character'Val(16#D9#) then
         -- Dateiende entspricht nicht JFIF EOI
         return False;
      elsif Ada.Strings.Unbounded.Element(buffer, 3) = Character'Val(16#FF#) and
        Ada.Strings.Unbounded.Element(buffer, 4) = Character'Val(16#DB#) then
         -- JFIF RAW Format
         return True;
      elsif Ada.Strings.Unbounded.Length(buffer) < 14 then
         -- Dateigröße zu klein für JFIF SOI, EOI und APPx
         return False;
      elsif Ada.Strings.Unbounded.Element(buffer, 3) = Character'Val(16#FF#) and
        Ada.Strings.Unbounded.Element(buffer, 4) = Character'Val(16#E0#) and
        Ada.Strings.Unbounded.Element(buffer, 7) = Character'Val(16#4A#) and
        Ada.Strings.Unbounded.Element(buffer, 8) = Character'Val(16#46#) and
        Ada.Strings.Unbounded.Element(buffer, 9) = Character'Val(16#49#) and
        Ada.Strings.Unbounded.Element(buffer, 10) = Character'Val(16#46#) and
        Ada.Strings.Unbounded.Element(buffer, 11) = Character'Val(16#00#) and
        Ada.Strings.Unbounded.Element(buffer, 12) = Character'Val(16#01#) then
         -- JFIF APP0 -> 'JFIF'
         return True;
      elsif Ada.Strings.Unbounded.Element(buffer, 3) = Character'Val(16#FF#) and
        Ada.Strings.Unbounded.Element(buffer, 4) = Character'Val(16#E1#) and
        Ada.Strings.Unbounded.Element(buffer, 7) = Character'Val(16#45#) and
        Ada.Strings.Unbounded.Element(buffer, 8) = Character'Val(16#78#) and
        Ada.Strings.Unbounded.Element(buffer, 9) = Character'Val(16#69#) and
        Ada.Strings.Unbounded.Element(buffer, 10) = Character'Val(16#66#) and
        Ada.Strings.Unbounded.Element(buffer, 11) = Character'Val(16#00#) and
        Ada.Strings.Unbounded.Element(buffer, 12) = Character'Val(16#00#) then
         -- JFIF APP1 -> 'Exif'
         return True;
      else
         -- Kein gültiges Format
         return False;
      end if;
   end;

end Pictures.JpegPictures;
