-- Verwendete Packages
with Pictures;
with Ada.Strings.Unbounded;

-- Package für JpegPicture als Childpackage von Picture
package Pictures.JpegPictures is

   -- Typ anlegen
   type JpegPicture is new Pictures.Picture with private;

   -- Konstruktor
   not overriding function create(name: String; buffer: Ada.Strings.Unbounded.Unbounded_String) return access JpegPicture;

   -- Statische Buffercheckfunktion
   function isJpeg(buffer: Ada.Strings.Unbounded.Unbounded_String) return Boolean;

private
   -- Objektvariablen
   type JpegPicture is new Pictures.Picture with
      record
         null;
      end record;

end Pictures.JpegPictures;
