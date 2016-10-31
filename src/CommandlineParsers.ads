-- Verwendete Packages
with Inputs;
with Parameters;

-- Package für Eingabemodul
package CommandlineParsers is

   -- Typ anlegen
   type CommandlineParser is new Inputs.Input with private;

   -- Konstruktor
   overriding function create return access CommandlineParser;

   -- Eingabewerte verarbeiten
   overriding procedure parse(This: access CommandlineParser);

   -- Getter Funktionen
   overriding function getParams(This: access CommandlineParser) return access Parameters.Parameter;

private
   -- Objektvariablen
   type CommandlineParser is new Inputs.Input with
      record
         parameters: access Parameters.Parameter;
      end record;

end CommandlineParsers;
