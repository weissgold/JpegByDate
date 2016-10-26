-- Verwendete Packages
with Globals;
with Ada.Directories;
with Ada.Containers.Vectors;
with GNAT.Regpat;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded; -- Ohne use funktioniert die Vector-Erstellung nicht!


-- Package für das Auflisten von Dateien
package body Filesystemlists is

   -- Konstruktor
   function create return Filesystemlist_Type is
   begin
      return new Filesystemlist;
   end create;

   -- Verzeichnis nach Dateien durchsuchen und in eine Liste schreiben
   procedure listFiles(This: Filesystemlist_Type; path: String) is
      -- Vorbereitung der Verzeichnissuche
      FilesystemSearch : Ada.Directories.Search_Type;
      EntryItem : Ada.Directories.Directory_Entry_Type;
      Filter : constant Ada.Directories.Filter_Type := ( Ada.Directories.Ordinary_File => True,
                                                         Ada.Directories.Special_File  => False,
                                                         Ada.Directories.Directory     => False);
      -- Verzeichnisvektor vorbereiten
      package String_Vectors is new Ada.Containers.Vectors(Element_Type => Unbounded_String, Index_Type => Natural);
      subtype String_Vector is String_Vectors.Vector;
      subtype String_Cursor is String_Vectors.Cursor;
      FileListVector : String_Vector;
      FileListCursor : String_Cursor;
      -- temporaere Variablen
      I : Integer := 1;
      -- Regex vorbereiten fuer Dateiendungen
      compiledFiletypeRegex : constant GNAT.Regpat.Pattern_Matcher := GNAT.Regpat.Compile(Globals.regexPatternFiletype);

   begin
      -- Verzeichnis durchsuchen
      Ada.Directories.Start_Search (Search    => FilesystemSearch,
                                    Directory => path,
                                    Pattern   => "",
                                    Filter    => Filter);

      -- Directory durchsuchen
      while Ada.Directories.More_Entries (Search => FilesystemSearch) loop
         Ada.Directories.Get_Next_Entry (Search => FilesystemSearch, Directory_Entry => EntryItem);

         -- Filtern der Liste mit einer Regular-Expression
         if Boolean'(GNAT.Regpat.Match(compiledFiletypeRegex, Ada.Directories.Full_Name(EntryItem))) then
            -- Wenn Dateiendung korrekt -> in Liste aufnehmen
            FileListVector.Append(New_Item => To_Unbounded_String(Ada.Directories.Full_Name(EntryItem)));
         end if;
      end loop;
      Ada.Directories.End_Search (Search => FilesystemSearch);

      -- Vector zu Array kopieren
      This.all.list := new Globals.StrArr(1..Integer(FileListVector.Length));
      FileListCursor := FileListVector.First;
      while String_Vectors.Has_Element(FileListCursor) loop
         This.all.list(I) := String_Vectors.Element(FileListCursor);
         I := I + 1;
         String_Vectors.Next(FileListCursor);
      end loop;

   end listFiles;

   -- Getter Funktionen
   function getList(This: Filesystemlist_Type) return globals.StrArr_Type is
   begin
      return This.all.list;
   end getList;

end Filesystemlists;
