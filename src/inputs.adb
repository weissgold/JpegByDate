-- Verwendete Packages
with Globals;
with Ada.Command_Line;

-- Package für Ausgabemodul
package body Inputs is

   -- Konstruktor
   function create return Input_Type is
   begin
      return new Input;
   end create;

   -- Kommandozeile verarbeiten
   procedure parse(This: Input_Type) is
   begin
      This.all.param_count := Ada.Command_Line.Argument_Count;
   end parse;

   -- Getter Funktionen
   function getParamCount(This: Input_Type) return Integer is
   begin
      return This.all.param_count;
   end getParamCount;

end Inputs;
