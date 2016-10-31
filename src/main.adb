-- Verwendete Packages
with Inputs;
with CommandlineParsers;
with Filters;
with FileExtensionFilters;
with FileListers;
with FilesystemListers;
with Outputs;
with ConsoleOutputs;

-- Hauptfunktion
procedure Main is
   input: access Inputs.Input'Class := CommandlineParsers.create;
   filter: access Filters.Filter'Class := FileExtensionFilters.create;
   files: access FileListers.FileLister'Class;
   output: access Outputs.Output'Class := ConsoleOutputs.create;
begin
   -- Eingabe verarbeiten
   input.parse;
   output.display(input.getParams.getDate);

   -- Dateien auflisten und anzeigen
   files := FilesystemListers.create(input.getParams.getPath, filter);
   while files.hasNext loop
      output.display(files.next);
   end loop;
end Main;
