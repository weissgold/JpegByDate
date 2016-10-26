-- Verwendete Packages
with Globals;

-- Package für Ausgabemodul
package Outputs is
   -- Typ anlegen
   type Output is tagged null record;
   type Output_Type is access Output;

   -- Anzeigefunktion für Zahl
   procedure displayN(This: Output_Type; Number: Integer);
   -- Anzeigefunktion für Zahlenarray
   procedure displayA(This: Output_Type; Arr: Globals.NumArr);
   -- Anzeigefunktion für Stringarray
   procedure display(strings: Globals.StrArr);


end Outputs;
