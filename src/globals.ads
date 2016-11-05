-- Verwendete Packages
--> NONE

-- Package für globale Konstanten
package Globals is

   -- Konstanten Definition
   regexPatternDateWithWildcards: constant String := "[0-9?]{4}-[0-9?]{2}-[0-9?]{2}";
   regexPatternFiletype: constant String := ".*\.(jpg|jpeg|jpe|jfif)$";
   defaultDate: constant String := "????-??-??"; -- beliebiges Datum
   defaultPath: constant String := "."; -- aktuelles Ausfuehrungsverzeichnis

   -- Kommandozeilenparameter
   package params is
      date: constant String := "-d";
   end params;

   -- EXIF-Tags
   package exif is
      tag: constant Integer := 16#8769#;
      tag_Type: constant Integer := 4;
      tag_Length: constant Integer := 1;
      DateTimeOriginal: constant Integer := 16#9003#;
      DateTimeOriginal_Type: constant Integer := 2;
      DateTimeOriginal_Length: constant Integer := 20;
   end exif;

end Globals;
