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
   procedure setDate(This: access Parameter; date: String) is
   begin
      This.all.date := date;
   end setDate;

   -- Werte abfragen
   function getPath(This: access Parameter) return String is
   begin
      return Ada.Strings.Unbounded.To_String(This.all.path);
   end getPath;
   function getDate(This: access Parameter) return String is
   begin
      return This.all.date;
   end getDate;

end Parameters;
