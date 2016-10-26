-- Verwendete Packages
with Globals;

-- Package für Ausgabemodul
package Inputs is
   -- Typ anlegen
   type Input is tagged private;
   type Input_Type is access Input;

   -- Eingabewerte verarbeiten
   function create return Input_Type;
   procedure parse(This: Input_Type);

   -- Getter Funktionen
   function getParamCount(This: Input_Type) return Integer;
   function getDateString(This: Input_Type) return String;

private
   -- Objektvariablen
   type Input is tagged
      record
         param_count : Integer;
         date_string : String(1..10) := Globals.defaultDate;
      end record;

end Inputs;
