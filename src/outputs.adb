-- Verwendete Packages
with Globals;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;

-- Package für Ausgabemodul
package body Outputs is
   -- Anzeigefunktion für Zahl
   procedure displayN(This: Output_Type; Number: Integer) is
   begin
      Put("Number: ");
      Put(Number);
      New_Line(1);
   end displayN;

   -- Anzeigefunktion für Zahlenarray
   procedure displayA(This: Output_Type; Arr: Globals.NumArr) is
   begin
      Put_Line("Numbers:");
      Array_Loop:
      for I in Arr'Range loop
         displayN(This, Arr(I));
      end loop Array_Loop;
   end displayA;

   -- Anzeigefunktion für Stringarray
   procedure display(strings: Globals.StrArr) is
   begin
      Array_Loop:
      for I in strings'Range loop
         -- Unbounded konvertieren um Anzeige zu ermöglichen
         Put_Line(Ada.Strings.Unbounded.To_String(strings(I)));
      end loop Array_Loop;
   end display;

end Outputs;
