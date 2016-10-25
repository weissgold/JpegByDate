-- Package für Ausgabemodul
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body Output is
   -- Anzeigefunktion
   procedure display(Number: Integer) is
   begin
      Put_Line("Number:");
      Put(Number);
      New_Line(1);
   end display;
end Output;
