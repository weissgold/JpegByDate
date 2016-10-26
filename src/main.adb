-- Verwendete Packages
with Globals;
with Inputs;
with Filesystemlists;
with Outputs;

-- Hauptfunktion
procedure Main is
   input_parser : Inputs.Input_Type := Inputs.create;
   files_parser : Filesystemlists.Filesystemlist_Type := Filesystemlists.create;
begin
   -- Eingabe verarbeiten
   Inputs.parse(input_parser);
   Outputs.display(Integer'Image(Inputs.getParamCount(input_parser)));
   Outputs.display(Inputs.getDateString(input_parser));

   -- Dateien auflisten und anzeigen
   Filesystemlists.listFiles(files_parser, "."); -- "." = aktuelles Verzeichnis
   Outputs.display(Filesystemlists.getList(files_parser));

end Main;
