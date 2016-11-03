-- Verwendete Packages
--> NONE

-- Package für globale Konstanten
package Globals is

   -- Konstanten Definition
   regexPatternFiletype: constant String := ".*\.(jpg|jpeg|jpe|jfif)$";
   defaultDate: constant String := "yyyy-mm-dd";
   defaultPath: constant String := ".";

   package params is
      date : constant String := "-d";
   end params;

end Globals;
