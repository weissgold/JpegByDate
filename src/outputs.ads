-- Verwendete Packages
with Globals;

-- Package für Ausgabemodul
package Outputs is
   -- Typ anlegen
   type Output is tagged null record;
   type Output_Type is access Output;

   -- Anzeigefunktion für String
   procedure display(str: String);

   -- Anzeigefunktion für Stringarray
   procedure display(strings: Globals.StrArr);

end Outputs;
