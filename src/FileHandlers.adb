-- Verwendete Packages
--> NONE

-- Package für FileHandler
package body FileHandlers is

   -- Konstruktor
   function create(files: access FileListers.FileLister'Class; params: access Parameters.Parameter) return access FileHandler is
      handler: access FileHandler := new FileHandler;
   begin
      handler.all.files := files;
      handler.all.params := params;
      return handler;
   end create;

   -- Dateien verarbeiten
   procedure exec(This: access FileHandler; output: access Outputs.Output'Class) is
   begin
      -- Ausgabe aller Dateien in der Liste
      while This.all.files.hasNext loop
         output.display(This.all.files.next);
      end loop;
   end exec;

end FileHandlers;
