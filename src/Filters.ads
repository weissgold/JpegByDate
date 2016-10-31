-- Verwendete Packages
--> NONE

-- Filter Interface
package Filters is

   -- Interfacedefinition
   type Filter is abstract tagged private;

   -- Interfacefunktionen
   function create return access Filter is abstract;

   -- Filter anwenden
   -- DO NOT OVERLOAD!
   function apply(This: access Filter; str: String) return Boolean;

   -- Neuen Filter an Kette anfügen
   -- DO NOT OVERLOAD!
   procedure addNew(This: access Filter; newFilter: access Filter);

   -- private Funktionen
   -- DO NOT CALL EXTERNALLY! Außer es soll wirklich nur dieser Filter ausgeführt werden
   -- Sollte private sein, allerdings funktioniert dann die Vererbung nicht... (mit C++ hätte das funktioniert!) -> Wenn möglich Lösung suchen
   function applyThis(This: access Filter; str: String) return Boolean is abstract;

private
   -- Objektvariablen
   type Filter is abstract tagged
      record
         next: access Filter := null;
      end record;

end Filters;
