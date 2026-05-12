local debugMode = require 'config'.debug

function Debug(...)
   if not debugMode then return end
   lib.print.info(...)
end
