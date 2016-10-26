-- Verwendete Packages
with Globals;
with Inputs;
with Outputs;
with Ada.Strings.Unbounded;

-- Hauptfunktion
procedure Main is
   input_parser : Inputs.Input_Type := Inputs.create;
begin
   -- Eingabe verarbeiten
   Inputs.parse(input_parser);
   Outputs.display(Integer'Image(Inputs.getParamCount(input_parser)));

   -- Strings anzeigen
   declare
      Arr : Globals.StrArr(1..4);
   begin
      Arr(1) := Ada.Strings.Unbounded.To_Unbounded_String("Dies");
      Arr(2) := Ada.Strings.Unbounded.To_Unbounded_String("ist");
      Arr(3) := Ada.Strings.Unbounded.To_Unbounded_String("ein");
      Arr(4) := Ada.Strings.Unbounded.To_Unbounded_String("Test");
      Outputs.display(Arr);
   end;
end Main;
