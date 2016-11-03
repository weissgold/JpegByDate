-- Verwendete Packages
with Ada.Directories;
with Ada.Direct_IO;
with Ada.Exceptions;
with Ada.Strings.Unbounded;

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

   -- Datei einlesen
   -- Rückgabe -1 bei fehlender oder leerer Datei
   function readFile(name: String; buffer: out Ada.Strings.Unbounded.Unbounded_String) return Integer is
   begin
      declare
         -- Dateigröße auslesen und Einlesen vorbereiten
         size: Ada.Directories.File_Size := Ada.Directories.Size(name);
         subtype File_String is String(1..Integer(size));
         package File_String_IO is new Ada.Direct_IO(File_String);
         file: File_String_IO.File_Type;
         buf: File_String;
      begin
         -- Datei einlesen
         File_String_IO.open(file, File_String_IO.In_File, name);
         File_String_IO.Read(file, buf);
         File_String_IO.Close(file);
         Ada.Strings.Unbounded.Append(buffer, buf);
         return Integer(size);
      end;

   exception
      -- Im Fehlerfall Dateigröße -1 zurückgeben
      when E: others =>
         return -1;
   end readFile;

   -- Dateien verarbeiten
   procedure exec(This: access FileHandler; output: access Outputs.Output'Class) is
      str: Ada.Strings.Unbounded.Unbounded_String;
      buffer: Ada.Strings.Unbounded.Unbounded_String;
      size: Integer;
   begin
      -- Ausgabe aller Dateien in der Liste
      while This.all.files.hasNext loop
         -- Datei einlesen
         str := Ada.Strings.Unbounded.Null_Unbounded_String;
         str := Ada.Strings.Unbounded.To_Unbounded_String(This.all.files.next);
         size := readFile(Ada.Strings.Unbounded.To_String(str), buffer);

         -- Dateiname & Größe ausgeben
         output.display(Ada.Strings.Unbounded.To_String(str));
         output.display(Integer'Image(size));
      end loop;
   end exec;

end FileHandlers;
