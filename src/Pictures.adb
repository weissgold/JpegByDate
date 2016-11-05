-- Verwendete Packages
with Pictures.JpegPictures;

-- Package für Picturemodul
package body Pictures is

   -- Bild erstellen
   function create(name: String; buffer: Ada.Strings.Unbounded.Unbounded_String) return access Picture'Class is
   begin

      -- SPEKULATIVE METHODE (Anlegen, bei Fehler Exception abfangen und nächsten Typ probieren)

      -- Jpeg Test
      declare
      begin
         return JpegPictures.create(name, buffer); -- indirekter Call auf isJpeg()
      exception
         when E: others =>
            null;
      end;

      -- Kein bekannter Typ
      raise Unknown_Format with "File does not match any supported picture format!";

      -- ALTERNATIVE METHODE (Erst Testen, dann anlegen)

--      -- Buffer nach Magic Number durchsuchen
--      if JpegPictures.isJpeg(buffer) then
--         -- Bild ist Jpeg-Datei
--         return JpegPictures.create(name, buffer); -- indirekt wird hierdurch isJpeg() zweimal aufgerufen
--      else
--         -- Bilddatei ist kein bekannter Typ
--         raise Unknown_Format with "File does not match any supported picture format!";
--      end if;

   end create;

   -- Name und Pfad des Bildes zurückgeben
   function getName(This: access Picture) return String is
   begin
      return Ada.Strings.Unbounded.To_String(This.all.name);
   end getName;

end Pictures;
