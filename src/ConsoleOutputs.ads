-- Verwendete Packages
with Outputs;

-- Package für Ausgabemodul
package ConsoleOutputs is

   -- Typ anlegen
   type ConsoleOutput is new Outputs.Output with null record;

   -- Konstruktor
   overriding function create return access ConsoleOutput;
   -- Destruktor
   overriding procedure destroy(This: access ConsoleOutput);

   -- Anzeigefunktion für String
   overriding procedure display(This: access ConsoleOutput; str: String);

end ConsoleOutputs;
