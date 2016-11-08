-- Verwendete Packages
with FileListers;
with Parameters;
with Outputs;

-- Package für FileHandler
package FileHandlers is

   -- Typ anlegen
   type FileHandler is tagged private;

   -- Konstruktor
   function create(files: access FileListers.FileLister'Class; params: access Parameters.Parameter) return access FileHandler;
   -- Destruktor
   procedure destroy(This: access FileHandler);

   -- Dateien verarbeiten
   procedure exec(This: access FileHandler; output: access Outputs.Output'Class);

private
   -- Objektvariablen
   type FileHandler is tagged
      record
         files: access FileListers.FileLister'Class := null; -- extern
         params: access Parameters.Parameter := null; -- extern
      end record;

end FileHandlers;
