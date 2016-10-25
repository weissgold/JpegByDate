-- Verwendete Packages
with Output; use Output;
with Ada.Strings.Unbounded;

-- Hauptfunktion
procedure Main is
begin
   -- Zahl anzeigen
   output.displayN(127);

   -- Zahlen anzeigen
   declare
      Arr : NumArr(1..9);
   begin
      Array_Loop:
      for I in Arr'Range loop
         Arr(I) := I;
      end loop Array_Loop;
      output.displayA(Arr);
   end;

   -- Strings anzeigen
   declare
      Arr : StrArr(1..4);
   begin
      Arr(1) := Ada.Strings.Unbounded.To_Unbounded_String("Dies");
      Arr(2) := Ada.Strings.Unbounded.To_Unbounded_String("ist");
      Arr(3) := Ada.Strings.Unbounded.To_Unbounded_String("ein");
      Arr(4) := Ada.Strings.Unbounded.To_Unbounded_String("Test");
      output.display(Arr);
   end;
end Main;
