-- Verwendete Packages
with Globals;
with Ada.Directories;
with Ada.Containers.Vectors;

---

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded;

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

--      package FileListVectors is new Ada.Containers.Vectors(Natural, Integer);
--      use FileListVectors;

--      FileListVector : FileListVectors.Vector;
--      FileListCursor : FileListVectors.Cursor;

   begin
      Ada.Directories.Start_Search (Search    => FilesystemSearch,
                                    Directory => path,
                                    Pattern   => "",
                                    Filter    => Filter);

      while Ada.Directories.More_Entries (Search => FilesystemSearch) loop
         Ada.Directories.Get_Next_Entry (Search => FilesystemSearch, Directory_Entry => EntryItem);

         -- Filtern der Liste mit einer Regular-Expression

         Put_Line(Ada.Directories.Full_Name(EntryItem));

--         FileListVectors.Append(FileListVector, Ada.Directories.Full_Name(EntryItem));
      end loop;

      Ada.Directories.End_Search (Search => FilesystemSearch);

--      FileListCursor := FileListVectors.First(FileListVector);
--      while FileListVectors.Has_Element(FileListCursor) loop
--         Put_Line(FileListVectors.Element(FileListCursor));
--         FileListVectors.Next(FileListCursor);
--      end loop;

   end listFiles;

   -- Getter Funktionen
   function getList(This: Filesystemlist_Type) return globals.StrArr is
   begin
      return This.all.list;
   end getList;

end Filesystemlists;
