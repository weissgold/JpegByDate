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

private
   -- Objektvariablen
   type Input is tagged
      record
         param_count : Integer;
      end record;

end Inputs;
