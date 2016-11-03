-- Verwendete Packages
--> NONE

-- Package für globale Konstanten
package Globals is

   -- Konstanten Definition
   regexPatternDate: constant String := "....-..-.."; -- ACHTUNG: Zu rudimentaeres Regex!
   regexPatternFiletype: constant String := ".*\.(jpg|jpeg|jpe|jfif)$";
   defaultDate: constant String := "????-??-??"; -- beliebiges Datum
   defaultPath: constant String := "."; -- aktuelles Ausfuehrungsverzeichnis

   package params is
      date : constant String := "-d";
   end params;

end Globals;
