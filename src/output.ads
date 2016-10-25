-- Verwendete Packages
with Ada.Strings.Unbounded;

-- Package für Ausgabemodul
package Output is

   -- Array Definition
   type NumArr is array (Positive range <>) of Integer;
   type StrArr is array (Positive range <>) of Ada.Strings.Unbounded.Unbounded_String;

   -- Anzeigefunktion für Zahl
   procedure displayN(Number: Integer);

   -- Anzeigefunktion für Zahlenarray
   procedure displayA(Arr: NumArr);

   -- Anzeigefunktion für Stringarray
   procedure display(strings: StrArr);

end Output;
