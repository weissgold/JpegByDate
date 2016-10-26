-- Verwendete Packages
with Globals;

-- Package für Ausgabemodul
package Output is
   -- Anzeigefunktion für Zahl
   procedure displayN(Number: Integer);

   -- Anzeigefunktion für Zahlenarray
   procedure displayA(Arr: Globals.NumArr);

   -- Anzeigefunktion für Stringarray
   procedure display(strings: Globals.StrArr);

end Output;
