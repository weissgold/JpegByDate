-- Verwendete Packages
limited with Pictures.TiffPictures; -- limited um Circular Dependency zu unterbrechen

-- Package für EXIFParser
package EXIFParsers is

   -- Typ anlegen
   type EXIFParser is tagged private;

   -- Konstruktor (binary ist EXIF SubIFD Directory Entries)
   function create(binary: String; tiff_parent: access Pictures.TiffPictures.TiffPicture) return access EXIFParser;
   -- Destruktor
   procedure destroy(This: access EXIFParser);

   -- Getterfunktionen
   function getDateTimeOriginal(This: access EXIFParser) return String;

private
   -- Objektvariablen
   type EXIFParser is tagged
      record
         exif: access String := null; -- intern
         parent: access Pictures.TiffPictures.TiffPicture := null; -- extern
      end record;

end EXIFParsers;
