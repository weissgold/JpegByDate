-- Verwendete Packages
with Inputs;
with CommandlineParsers;
with Filters;
with FileExtensionFilters;
with FileListers;
with FilesystemListers;
with FileHandlers;
with Outputs;
with ConsoleOutputs;

-- Hauptfunktion
procedure Main is
   input: access Inputs.Input'Class := CommandlineParsers.create;
   filter: access Filters.Filter'Class := FileExtensionFilters.create;
   files: access FileListers.FileLister'Class;
   handler: access FileHandlers.FileHandler;
   output: access Outputs.Output'Class := ConsoleOutputs.create;
begin
   -- Eingabe verarbeiten
   input.parse;
   output.display("DEBUG OUTPUT - DatePattern: " & input.getParams.getDatePattern);

   -- Dateien Auflisten und Filtern vorbereiten
   files := FilesystemListers.create(input.getParams.getPath, filter);

   -- Dateien verarbeiten und anzeigen
   handler := FileHandlers.create(files, input.getParams);
   handler.exec(output);

end Main;
