-- Verwendete Packages
with Ada.Unchecked_Deallocation;

-- Package für Filtermodul
package body Filters.FileExtensionFilters is

   -- Konstruktor
   function create return access FileExtensionFilter is
   begin
      return new FileExtensionFilter;
   end create;

   -- Destruktor
   procedure destroy(This: access FileExtensionFilter) is
      type type_access is access all FileExtensionFilter;
      procedure Free is new Ada.Unchecked_Deallocation(FileExtensionFilter, type_access);
      obj: type_access := type_access(This);
   begin
      -- externe Variablen in diesem Fall doch löschen
      if This.all.next /= null then
         This.all.next.destroy;
      end if;
      Free(obj);
   end;

   -- private Funktionen
   overriding function applyThis(This: access FileExtensionFilter; str: String) return Boolean is
   begin
      return Boolean'(GNAT.Regpat.Match(compiledFiletypeRegex, str));
   end applyThis;

end Filters.FileExtensionFilters;
