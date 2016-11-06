-- Verwendete Packages
with Globals;
with Ada.Command_Line;
with Ada.Strings.Fixed;
with Ada.Strings.Maps;
with GNAT.Regpat;

-- Package fuer Eingabemodul
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
            -- Pruefen ob naechster Parameter existiert
            if J <= Ada.Command_Line.Argument_Count then
               -- Regulaerer Ausdruck fuer ISO Date Pattern Matching
               -- Pruefen ob das eingegebene Datum einem Datum mit Wildcards der Form
               -- 2016-01-?? entspricht.
               if Boolean'(GNAT.Regpat.Match(Expression => Globals.regexPatternDateWithWildcards, Data => Ada.Command_Line.Argument(J))) then
                  -- Ersetze die Fragezeichen (CLI-Wildcards) mit Punkten (Regex-Wildcards) und Bindestriche durch Doppelpunkte (EXIF Trennzeichen)
                  -- und hinterlege dieses Pattern in Parameters
                  This.all.parameters.setDatePattern(Ada.Strings.Fixed.Translate(Ada.Strings.Fixed.Translate(Ada.Command_Line.Argument(J), Ada.Strings.Maps.To_Mapping(From => "?", To => ".")), Ada.Strings.Maps.To_Mapping(From => "-", To => ":")));
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
