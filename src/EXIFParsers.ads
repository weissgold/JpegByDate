-- Verwendete Packages
--> NONE

-- Package für Parameter
package EXIFParsers is

   -- Typ anlegen
   type EXIFParser is tagged private;

   -- Konstruktor
   function create(binary: String; little_endian: Boolean) return access EXIFParser;

private
   -- Objektvariablen
   type EXIFParser is tagged
      record
         little_endian: Boolean;
         exif: access String;
      end record;

end EXIFParsers;
