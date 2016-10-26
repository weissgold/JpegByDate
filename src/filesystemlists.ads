-- Verwendete Packages
with Globals;

-- Package für das Auflisten von Dateien
package Filesystemlists is
   -- Typ anlegen
   type Filesystemlist is tagged private;
   type Filesystemlist_Type is access Filesystemlist;

   -- Konstruktor
   function create return Filesystemlist_Type;

   -- Auflisten der Dateien im Suchort
   procedure listFiles(This: Filesystemlist_Type; path: String);

   -- Getterfunktionen
   function getList(This: Filesystemlist_Type) return Globals.StrArr;

private
   -- Objektvariablen
   type Filesystemlist is tagged
      record
         list : Globals.StrArr(1..1);
      end record;

end Filesystemlists;
