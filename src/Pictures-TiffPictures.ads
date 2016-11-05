-- Verwendete Packages
with Pictures;
with Ada.Strings.Unbounded;

-- Package f�r TiffPicture als Childpackage von Picture
package Pictures.TiffPictures is

   -- Typ anlegen
   type TiffPicture is new Pictures.Picture with private;

   -- Konstruktor
   not overriding function create(name: String; buffer: Ada.Strings.Unbounded.Unbounded_String) return access TiffPicture;

   -- EXIF abfragen
   overriding function hasEXIF(This: access TiffPicture) return Boolean;
   overriding function getEXIF(This: access TiffPicture) return access EXIFParsers.EXIFParser;

   -- Statische Buffercheckfunktion
   function isTiff(buffer: Ada.Strings.Unbounded.Unbounded_String) return Boolean;

private
   -- Bin�rdaten lesen
   function createInt(This: access TiffPicture; b0: Character; b1: Character) return Integer;
   function createInt(This: access TiffPicture; b0: Character; b1: Character; b2: Character; b3: Character) return Integer;

   -- Objektvariablen
   type TiffPicture is new Pictures.Picture with
      record
         exif: access EXIFParsers.EXIFParser := null;
         little_endian: Boolean := False;
      end record;

end Pictures.TiffPictures;
