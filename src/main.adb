-- Verwendete Packages
with Globals;
with Outputs;
with Ada.Strings.Unbounded;

-- Hauptfunktion
procedure Main is
   outs : Outputs.Output_Type := new Outputs.Output;
begin
   -- Zahl anzeigen
   Outputs.displayN(outs, 127);

   -- Zahlen anzeigen
   declare
      Arr : Globals.NumArr(1..9);
   begin
      Array_Loop:
      for I in Arr'Range loop
         Arr(I) := I;
      end loop Array_Loop;
      Outputs.displayA(outs, Arr);
   end;

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
