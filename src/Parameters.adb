-- Verwendete Packages
--> NONE

-- Package für Parameter
package body Parameters is

   -- Konstruktor
   function create return access Parameter is
   begin
      return new Parameter;
   end create;

   -- Werte setzen
   procedure setPath(This: access Parameter; path: String) is
   begin
      This.all.path := Ada.Strings.Unbounded.To_Unbounded_String(path);
   end setPath;
   procedure setDatePattern(This: access Parameter; datePattern: String) is
   begin
      This.all.datePattern := datePattern;
   end setDatePattern;

   -- Werte abfragen
   function getPath(This: access Parameter) return String is
   begin
      return Ada.Strings.Unbounded.To_String(This.all.path);
   end getPath;
   function getDatePattern(This: access Parameter) return String is
   begin
      return This.all.datePattern;
   end getDatePattern;

end Parameters;
