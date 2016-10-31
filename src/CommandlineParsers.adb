-- Verwendete Packages
with Globals;
with Ada.Command_Line;
with GNAT.Regexp;

-- Package für Eingabemodul
package body CommandlineParsers is

   -- Konstruktor
   function create return access CommandlineParser is
      input: access CommandlineParser := new CommandlineParser;
   begin
      input.all.parameters := Parameters.create;
      return input;
   end create;

   -- Kommandozeile verarbeiten
   procedure parse(This: access CommandlineParser) is
      I, J : Positive;
   begin
      -- Pfad bestimmen
      This.all.parameters.setPath(Globals.defaultPath);

      -- Datum einlesen
      I := 1;
      while I <= Ada.Command_Line.Argument_Count loop
         -- Datumsparamter finden
         if Ada.Command_Line.Argument(I) = Globals.params.date then
            J := I + 1;
            -- Prüfen ob nächster Parameter existiert
            if J <= Ada.Command_Line.Argument_Count then
               -- Regulärer Ausdruck für ISO Date Pattern Matching --> Überarbeiten zu GNAT.Regpat!
               if GNAT.Regexp.Match(Ada.Command_Line.Argument(J), GNAT.Regexp.Compile(Globals.regexPatternDate)) then
                  This.all.parameters.setDate(Ada.Command_Line.Argument(J));
               end if;
            end if;
         end if;
         I := I + 1;
      end loop;
   end parse;

   -- Getter Funktionen
   function getParams(This: access CommandlineParser) return access Parameters.Parameter is
   begin
      return This.all.parameters;
   end getParams;

end CommandlineParsers;
