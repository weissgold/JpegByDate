-- Verwendete Packages
-- NONE

-- Package für Filtermodul
package body FileExtensionFilters is

   -- Konstruktor
   function create return access FileExtensionFilter is
   begin
      return new FileExtensionFilter;
   end create;

   -- private Funktionen
   overriding function applyThis(This: access FileExtensionFilter; str: String) return Boolean is
   begin
      return Boolean'(GNAT.Regpat.Match(compiledFiletypeRegex, str));
   end applyThis;

end FileExtensionFilters;
