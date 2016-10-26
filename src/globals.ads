-- Verwendete Packages
with Ada.Strings.Unbounded;

-- Package für Ausgabemodul
package Globals is

   -- Array Definition
   type NumArr is array (Positive range <>) of Integer;
   type StrArr is array (Positive range <>) of Ada.Strings.Unbounded.Unbounded_String;

end Globals;
