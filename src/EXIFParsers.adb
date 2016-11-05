-- Verwendete Packages
with Pictures;

-- Package für Parameter
package body EXIFParsers is

   -- Konstruktor
   function create(binary: String; little_endian: Boolean) return access EXIFParser is
      parser: access EXIFParser := new EXIFParser;
   begin
      -- Dateigröße überprüfen
      if (binary'Length mod 12) = 0 then
         parser.all.exif := new String'(binary);
         parser.all.little_endian := little_endian;
         return parser;
      end if;

      -- Falsches Datenformat
      raise Pictures.Illegal_Format with "EXIF data has illegal format!";
   end create;

end EXIFParsers;
