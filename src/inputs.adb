-- Verwendete Packages
with Globals;
with Ada.Command_Line;
with GNAT.Regexp;

-- Package für Ausgabemodul
package body Inputs is

   -- Konstruktor
   function create return Input_Type is
   begin
      return new Input;
   end create;

   -- Kommandozeile verarbeiten
   procedure parse(This: Input_Type) is
      I, J : Positive;
   begin
      -- Anzahl Parameter speichern
      This.all.param_count := Ada.Command_Line.Argument_Count;

      -- Datum einlesen
      I := 1;
      While_Loop:
      while I <= This.all.param_count loop
         -- Datumsparamter finden
         if Ada.Command_Line.Argument(I) = Globals.params.date then
            J := I + 1;
            -- Prüfen ob nächster Parameter existiert
            if J <= This.all.param_count then
               -- Regulärer Ausdruck für ISO Date Pattern Matching
               if GNAT.Regexp.Match(Ada.Command_Line.Argument(J), GNAT.Regexp.Compile(Globals.regexPatternDate)) then
                  This.all.date_string := Ada.Command_Line.Argument(J);
               end if;
            end if;
         end if;
         I := I + 1;
      end loop While_Loop;
   end parse;

   -- Getter Funktionen
   function getParamCount(This: Input_Type) return Integer is
   begin
      return This.all.param_count;
   end getParamCount;

   function getDateString(This: Input_Type) return String is
   begin
      return This.all.date_string;
   end getDateString;

end Inputs;
