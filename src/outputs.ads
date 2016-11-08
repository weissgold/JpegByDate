-- Verwendete Packages
--> NONE

-- Ausgabe Interface
package Outputs is

   -- Interfacedefinition
   type Output is interface;

   -- Interfacefunktionen
   function create return access Output is abstract;
   procedure destroy(This: access Output) is abstract;
   procedure display(This: access Output; str: String) is abstract;

end Outputs;
