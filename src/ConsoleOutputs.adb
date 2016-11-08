-- Verwendete Packages
with Ada.Text_IO;
with Ada.Unchecked_Deallocation;

-- Package für Ausgabemodul
package body ConsoleOutputs is

   -- Konstruktor
   function create return access ConsoleOutput is
   begin
      return new ConsoleOutput;
   end create;

   -- Destruktor
   procedure destroy(This: access ConsoleOutput) is
      type type_access is access all ConsoleOutput;
      procedure Free is new Ada.Unchecked_Deallocation(ConsoleOutput, type_access);
      obj: type_access := type_access(This);
   begin
      Free(obj);
   end;

   -- Anzeigefunktion für String
   procedure display(This: access ConsoleOutput; str: String) is
   begin
      Ada.Text_IO.Put_Line(str);
   end display;

end ConsoleOutputs;
