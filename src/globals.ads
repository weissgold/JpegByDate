-- Verwendete Packages
--> NONE

-- Package für globale Konstanten
package Globals is

   -- Konstanten Definition
   regexPatternDate: constant String := "....-..-.."; -- ACHTUNG: Matched auch nicht Zahlen!
   regexPatternFiletype: constant String := ".*\.(jpg|jpeg|jpe|jfif)$";
   defaultDate: constant String := "yyyy-mm-dd";
   defaultPath: constant String := ".";

   package params is
      date : constant String := "-d";
   end params;

end Globals;
