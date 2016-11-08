-- Verwendete Packages
with EXIFParsers;
with Ada.Strings.Unbounded;

-- Picture Interface
package Pictures is

   -- Interfacedefinition
   type Picture is abstract tagged private;

   -- Interfacefunktionen
   function create(name: String; buffer: Ada.Strings.Unbounded.Unbounded_String) return access Picture'Class;
   procedure destroy(This: access Picture) is abstract;

   -- Name und Pfad des Bildes zurückgeben
   -- DO NOT OVERLOAD!
   function getName(This: access Picture) return String;

   -- EXIF abfragen
   function hasEXIF(This: access Picture) return Boolean is abstract;
   function getEXIF(This: access Picture) return access EXIFParsers.EXIFParser is abstract;

   -- Exceptions
   Unknown_Format: exception; -- Bildformat unbekannt
   Illegal_Format: exception; -- Bildformat beinhaltet Fehler

private
   -- Objektvariablen
   type Picture is abstract tagged
      record
         name: Ada.Strings.Unbounded.Unbounded_String;
         binary: Ada.Strings.Unbounded.Unbounded_String;
      end record;

end Pictures;
