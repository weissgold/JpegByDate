-- Verwendete Packages
with Ada.Unchecked_Deallocation;

-- Package für das Auflisten von Dateien
package body FilesystemListers is

   -- Konstruktor
   function create(path: String; filter: access Filters.Filter'Class) return access FilesystemLister is
      lister: access FilesystemLister := new FilesystemLister;
   begin
      lister.init(path, filter);
      return lister;
   end create;

   -- Destruktor
   procedure destroy(This: access FilesystemLister) is
      type type_access is access all FilesystemLister;
      procedure Free is new Ada.Unchecked_Deallocation(FilesystemLister, type_access);
      obj: type_access := type_access(This);
   begin
      -- Suche beenden
      Ada.Directories.End_Search(Search => This.all.FilesystemSearch);

      -- externe Variablen nicht löschen
      Free(obj);
   end;

   -- Auflisten der Dateien im Suchort
   function hasNext(This: access FilesystemLister) return Boolean is
   begin
      return This.all.hasNextMatch;
   end hasNext;

   -- Getterfunktionen
   function next(This: access FilesystemLister) return String is
      next_str: Ada.Strings.Unbounded.Unbounded_String;
   begin
      if This.all.hasNextMatch then
         -- Wenn es ein weiteres Element gibt, dieses zurück geben
         next_str := This.all.nextMatch;
         This.parseNext;
         return Ada.Strings.Unbounded.To_String(next_str);
      else
         -- Wenn kein Element mehr vorhanden ist nichts zurück geben
         return "";
      end if;
   end next;

   -- Initialisierungsfunktion
   procedure init(This: access FilesystemLister; path: String; filter: access Filters.Filter'Class) is
      dFilter: constant Ada.Directories.Filter_Type := (Ada.Directories.Ordinary_File => True,
                                                       Ada.Directories.Special_File  => False,
                                                       Ada.Directories.Directory     => False);
   begin
      -- Verzeichnis Durchsuchen initialisieren
      Ada.Directories.Start_Search(Search    => This.all.FilesystemSearch,
                                   Directory => path,
                                   Pattern   => "",
                                   Filter    => dFilter);
      This.all.filter := filter;
      This.parseNext;
   end init;

   -- Intene Suche nach nächster Datei
   procedure parseNext(This: access FilesystemLister) is
      EntryItem: Ada.Directories.Directory_Entry_Type;
   begin
      -- Nur durchführen, wenn beim letzten mal noch Matches gefunden wurden
      if This.all.hasNextMatch then
         -- Directory durchsuchen
         while Ada.Directories.More_Entries(Search => This.all.FilesystemSearch) loop
            -- Nächsten Eintrag auslesen
            Ada.Directories.Get_Next_Entry(Search => This.all.FilesystemSearch, Directory_Entry => EntryItem);
            --Ada.Text_IO.Put_Line(Ada.Directories.Full_Name(EntryItem));

            -- Filtern des Eintrages mit einer Regular-Expression
            if This.all.filter.apply(Ada.Directories.Full_Name(EntryItem)) then -- Non dispatching Call auf Filter -> Es wird zwangsläufig die Methode der abstrakten Klasse aufgerufen
               -- Wenn Dateiendung korrekt -> in Liste aufnehmen
               This.all.nextMatch := Ada.Strings.Unbounded.To_Unbounded_String(Ada.Directories.Full_Name(EntryItem));
               This.all.hasNextMatch := True;
               return; -- Abbrechen bei nächstem Match
            end if;
         end loop;

         -- Keinen weiteren Eintrag gefunden
         This.all.nextMatch := Ada.Strings.Unbounded.Null_Unbounded_String;
         This.all.hasNextMatch := False;
      end if;
   end parseNext;

end FilesystemListers;
