-- Verwendete Packages
with Ada.Strings.Unbounded;

-- Package für Ausgabemodul
package Globals is

   -- Array Definition
   type NumArr is array (Positive range <>) of Integer;
   type StrArr is array (Positive range <>) of Ada.Strings.Unbounded.Unbounded_String;
   type StrArr_Type is access StrArr;

   -- Konstanten Definition
   regexPatternDate : constant String := "....-..-.."; -- ACHTUNG: Matched auch nicht Zahlen!
   regexPatternFiletype : constant String := ".*\.(jpg|jpeg|jpe|jfif)$";
   defaultDate : constant String := "yyyy-mm-dd";

   package params is
      date : constant String := "-d";
   end params;

end Globals;
