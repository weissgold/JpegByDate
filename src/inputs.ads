-- Verwendete Packages
with Parameters;

-- Eingabe Interface
package Inputs is

   -- Interfacedefinition
   type Input is interface;

   -- Interfacefunktionen
   function create return access Input is abstract;
   procedure destroy(This: access Input) is abstract;
   procedure parse(This: access Input) is abstract;
   function getParams(This: access Input) return access Parameters.Parameter is abstract;

end Inputs;
