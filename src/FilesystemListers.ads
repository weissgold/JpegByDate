-- Verwendete Packages
with Filters;
with FileListers;
with Ada.Directories;
with Ada.Strings.Unbounded;

-- Package für das Auflisten von Dateien
package FilesystemListers is

   -- Typ anlegen
   type FilesystemLister is new FileListers.FileLister with private;

   -- Konstruktor
   overriding function create(path: String; filter: access Filters.Filter'Class) return access FilesystemLister;

   -- Auflisten der Dateien im Suchort
   overriding function hasNext(This: access FilesystemLister) return Boolean;

   -- Getterfunktionen
   overriding function next(This: access FilesystemLister) return String;

private
   -- Objektvariablen
   type FilesystemLister is new FileListers.FileLister with
      record
         -- Interne Datenspeicherung
         hasNextMatch: Boolean := True; -- Muss True sein, da sonst init denkt es wären bereits alle Einträge durchsucht worden
         nextMatch: Ada.Strings.Unbounded.Unbounded_String;

         -- Vorbereitung der Verzeichnissuche
         FilesystemSearch: Ada.Directories.Search_Type;
         filter: access Filters.Filter;
      end record;

   -- Initialisierungsfunktion
   procedure init(This: access FilesystemLister; path: String; filter: access Filters.Filter'Class);

   -- Intene Suche nach nächster Datei
   procedure parseNext(This: access FilesystemLister);

end FilesystemListers;
