local geekery = _asm._actions.geeklets
local screen  = require("hs.screen")
local stext   = require("hs.styledtext")
local fnutils = require("hs.fnutils")
local drawing = require("hs.drawing")

local monitorTopY   = screen.mainScreen():frame().y
local monitorBotY   = monitorTopY + screen.mainScreen():frame().h

geekery.registerLuaGeeklet("cpu", 5,  "geeklets/system.lua",
        { x = 22, y = monitorTopY + 22, h = 80, w = 350}, { color = { alpha = 1 }, skip = true },
        { drawing.rectangle{ x = 12, y = monitorTopY + 12, h = 100, w = 370 }
            :setFillColor{ alpha=.3, white = 0 }
            :setStrokeColor{ alpha=0 }
            :setFill(true)
            -- :setRoundedRectRadii(5,5)
        }):start()

geekery.registerShellGeeklet("wifi", 60,  "geeklets/wifi.sh",
        { x = 22, y = monitorTopY + 122, h = 60, w = 350}, {
            color = { alpha = 1, white=1 },
            paragraphStyle = { lineBreak = "clip" }
        }, { drawing.rectangle{ x = 12, y = monitorTopY + 112, h = 80, w = 370 }
            :setFillColor{ alpha=.3, white = 0 }
            :setStrokeColor{ alpha=0 }
            :setFill(true)
            -- :setRoundedRectRadii(5,5)
        }):start()

-- geekery.registerShellGeeklet("accountManagers", 3600,  "geeklets/account_managers.sh",
--         { x = 385, y = monitorTopY + 15, h = 948, w = 307}, {
--             color = { alpha = 1, white=1 },
--             font = { name = "Fira Code", size = 11 },
--             paragraphStyle = { lineBreak = "clip" }
--         }, { drawing.rectangle{ x = 382, y = monitorTopY + 12, h = 945, w = 310 }
--             :setFillColor{ alpha=.3, white = 0 }
--             :setStrokeColor{ alpha=0 }
--             :setFill(true)
--             -- :setRoundedRectRadii(5,5)
--         }):start()

-- geekery.registerShellGeeklet("phoneNumbers", 3600,  "geeklets/phone_numbers.sh",
--         { x = 15, y = monitorTopY + 189, h = 425, w = 307}, {
--             color = { alpha = 1, white=1 },
--             font = { name = "Fira Code", size = 11 },
--             paragraphStyle = { lineBreak = "clip" }
--         }, { drawing.rectangle{ x = 12, y = monitorTopY + 192, h = 427, w = 310 }
--             :setFillColor{ alpha=.3, white = 0 }
--             :setStrokeColor{ alpha=0 }
--             :setFill(true)
--             -- :setRoundedRectRadii(5,5)
--         }):start()

geekery.registerLuaGeeklet("diskSpace", 300,
    function()
        _asm._actions.diskSpace.updateDisplay()
        return nil                               -- no text handled by geeklets
    end,
    { },                                         -- no frame for the essentially empty object
    { skip = true },                             -- no style for text handled by geeklets
    { _asm._actions.diskSpace.geekletInterface } -- responds to geeklet requests
):start()

geekery.startUpdates()
