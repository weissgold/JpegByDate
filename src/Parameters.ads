-- Verwendete Packages
with Globals;
with Ada.Strings.Unbounded;

-- Package für Parameter
package Parameters is

   -- Typ anlegen
   type Parameter is tagged private;

   -- Konstruktor
   function create return access Parameter;

   -- Werte setzen
   procedure setPath(This: access Parameter; path: String);
   procedure setDate(This: access Parameter; date: String);

   -- Werte abfragen
   function getPath(This: access Parameter) return String;
   function getDate(This: access Parameter) return String;

private
   -- Objektvariablen
   type Parameter is tagged
      record
         path: Ada.Strings.Unbounded.Unbounded_String;
         date: String(1..10) := Globals.defaultDate;
      end record;

end Parameters;
