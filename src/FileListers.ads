-- Verwendete Packages
with Filters;

-- FileLister Interface
package FileListers is

   -- Interfacedefinition
   -- ACHTUNG! Ist kein Interface, sondern voll abstrakte Klasse.
   -- Dies ist notwendig, da 'limited' von Interface nicht auf Subklasse vererbt wird.
   -- Subklasse FilesystemLister muss aber 'limited' sein und eine nachträgliche Definition dazu ist nicht möglich.
   type FileLister is abstract tagged limited null record; -- quasi interface

   -- Interfacefunktionen
   function create(path: String; filter: access Filters.Filter'Class) return access FileLister is abstract;
   function hasNext(This: access FileLister) return Boolean is abstract;
   function next(This: access FileLister) return String is abstract;

end FileListers;
