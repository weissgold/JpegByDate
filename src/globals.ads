-- Verwendete Packages
--> NONE

-- Package für globale Konstanten
package Globals is

   -- Konstanten Definition
   regexPatternDateWithWildcards: constant String := "[0-9?]{4}-[0-9?]{2}-[0-9?]{2}";
   regexPatternFiletype: constant String := ".*\.(jpg|jpeg|jpe|jfif)$";
   defaultDate: constant String := "yyyy-mm-dd";
   defaultPath: constant String := ".";

   package params is
      date : constant String := "-d";
   end params;

end Globals;
