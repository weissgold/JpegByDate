-- Verwendete Packages
with Ada.Strings.Unbounded;

-- Picture Interface
package Pictures is

   -- Interfacedefinition
   type Picture is abstract tagged private;

   -- Interfacefunktionen
   function create(name: String; buffer: Ada.Strings.Unbounded.Unbounded_String) return access Picture'Class;

   -- Name und Pfad des Bildes zurückgeben
   -- DO NOT OVERLOAD!
   function getName(This: access Picture) return String;

   -- Exceptions
   Unknown_Format: exception; -- Bildformat unbekannt

private
   -- Objektvariablen
   type Picture is abstract tagged
      record
         name: Ada.Strings.Unbounded.Unbounded_String;
         binary: Ada.Strings.Unbounded.Unbounded_String;
      end record;

end Pictures;
