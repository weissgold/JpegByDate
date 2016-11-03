-- Verwendete Packages
--> NONE

-- Package f�r globale Konstanten
package Globals is

   -- Konstanten Definition
   regexPatternDateWithWildcards: constant String := "[0-9?]{4}-[0-9?]{2}-[0-9?]{2}";
   regexPatternFiletype: constant String := ".*\.(jpg|jpeg|jpe|jfif)$";
   defaultDate: constant String := "????-??-??"; -- beliebiges Datum
   defaultPath: constant String := "."; -- aktuelles Ausfuehrungsverzeichnis

   package params is
      date : constant String := "-d";
   end params;

end Globals;
