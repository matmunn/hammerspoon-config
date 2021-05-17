hyper = {"cmd", "ctrl", "alt"}

hs.grid.ui.textSize = 50

mouseCircle = nil
mouseCircleTimer = nil

function matInsert(originalTable, newItem)
    newTable = {table.unpack(originalTable)}
    table.insert(newTable, newItem)
    return newTable
end

function mouseHighlight()
    -- Delete an existing highlight if it exists
    if mouseCircle then
        mouseCircle:delete()
        if mouseCircleTimer then
            mouseCircleTimer:stop()
        end
    end
    -- Get the current co-ordinates of the mouse pointer
    mousepoint = hs.mouse.getAbsolutePosition()
    -- Prepare a big red circle around the mouse pointer
    mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x-40, mousepoint.y-40, 80, 80))
    mouseCircle:setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=1})
    mouseCircle:setFill(false)
    mouseCircle:setStrokeWidth(5)
    mouseCircle:show()

    -- Set a timer to delete the circle after 3 seconds
    mouseCircleTimer = hs.timer.doAfter(3, function() mouseCircle:delete() end)
end

function moveTopLeft()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end

function moveTopRight()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end

function moveBottomLeft()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y + (max.h / 2)
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end

function moveBottomRight()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y + (max.h / 2)
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end

function moveLeftHalf()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end

function moveRightHalf()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end

function moveLeftThird()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w * 1/3
    f.h = max.h
    win:setFrame(f)
end

function moveMiddleThird()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w * 1/3)
    f.y = max.y
    f.w = max.w * 1/3
    f.h = max.h
    win:setFrame(f)
end

function moveRightThird()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w * 2/3)
    f.y = max.y
    f.w = max.w * 1/3
    f.h = max.h
    win:setFrame(f)
end

function moveRightTwoThirds()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w * 1/3)
    f.y = max.y
    f.w = max.w * 2/3
    f.h = max.h
    win:setFrame(f)
end

function moveRightThirdTopHalf()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w * 2/3)
    f.y = max.y
    f.w = max.w * 2/8
    f.h = max.h / 2
    win:setFrame(f)
end

function moveRightThirdBottomHalf()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + ((max.w * 3/8) * 2)
    f.y = max.y + (max.h / 2)
    f.w = max.w * 2/8
    f.h = max.h / 2
    win:setFrame(f)
end

function moveMiddleThirdTopHalf()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w * 3/8)
    f.y = max.y
    f.w = max.w * 3/8
    f.h = max.h / 2
    win:setFrame(f)
end

function moveMiddleThirdBottomHalf()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w * 3/8)
    f.y = max.h / 2
    f.w = max.w * 3/8
    f.h = max.h / 2
    win:setFrame(f)
end

function moveCentreScreen()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = (max.w - f.w) / 2
    f.y = (max.h - f.h) / 2
    win:setFrame(f)
end

function maximise()
    -- local win = hs.window.focusedWindow()
    -- local f = win:frame()
    -- local screen = win:screen()
    -- local max = screen:frame()

    -- f.x = max.x
    -- f.y = max.y
    -- f.w = max.w
    -- f.h = max.h
    -- win:setFrame(f)
    local win = hs.window.focusedWindow()

    win:maximize()
end

hs.hotkey.bind(matInsert(hyper, "Shift"), "D", mouseHighlight)

hs.hotkey.bind(hyper, "Left", function()
    moveLeftHalf()
end)
hs.hotkey.bind(hyper, "Right", function()
    moveRightHalf()
end)
hs.hotkey.bind(hyper, "Up", function()
    maximise()
end)
hs.hotkey.bind(hyper, "Q", function()
    moveTopLeft()
end)
hs.hotkey.bind(hyper, "Z", function()
    moveBottomLeft()
end)
hs.hotkey.bind(hyper, "E", function()
    moveTopRight()
end)
hs.hotkey.bind(hyper, "C", function()
    moveBottomRight()
end)
hs.hotkey.bind(hyper, "Pad7", function()
    moveTopLeft()
end)
hs.hotkey.bind(hyper, "Pad1", function()
    moveBottomLeft()
end)
hs.hotkey.bind(hyper, "Pad9", function()
    moveTopRight()
end)
hs.hotkey.bind(hyper, "Pad3", function()
    moveBottomRight()
end)
hs.hotkey.bind(hyper, "Pad2", function()
    moveMiddleThirdBottomHalf()
end)
hs.hotkey.bind(hyper, "Pad8", function()
    moveMiddleThirdTopHalf()
end)
hs.hotkey.bind(hyper, "G", function()
    moveLeftThird()
end)
hs.hotkey.bind(hyper, "H", function()
    moveMiddleThird()
end)
hs.hotkey.bind(hyper, "U", function()
    moveRightThirdTopHalf()
end)
hs.hotkey.bind(hyper, "J", function()
    moveRightThird()
end)
hs.hotkey.bind(hyper, "N", function()
    moveRightTwoThirds()
end)
hs.hotkey.bind(hyper, "Y", function()
    moveCentreScreen()
end)
hs.hotkey.bind(hyper, "Pad4", function()
    local win = hs.window.focusedWindow()
    win:moveOneScreenWest()
end)
hs.hotkey.bind(hyper, "A", function()
    local win = hs.window.focusedWindow()
    win:moveOneScreenWest()
end)
hs.hotkey.bind(hyper, "Pad6", function()
    local win = hs.window.focusedWindow()
    win:moveOneScreenEast()
end)
hs.hotkey.bind(hyper, "D", function()
    local win = hs.window.focusedWindow()
    win:moveOneScreenEast()
end)

hs.hotkey.bind(hyper, "Space", function()
    local grid = hs.geometry.size(8, 8)
    hs.grid.setGrid(grid)

    local margins = hs.geometry.size(0, 0)
    hs.grid.setMargins(margins)

    hs.grid.show()
end)

hs.hotkey.bind(hyper, "R", function()
  hs.reload()
end)
hs.hotkey.bind(hyper, "L", function()
    hs.caffeinate.lockScreen()
end)

hs.screen.watcher.new(function()
  hs.reload()
end):start()

-- hs.caffeinate.watcher.new(function(event)
--     if event == hs.caffeinate.screensDidWake or event == hs.caffeinate.screensDidUnlock then
--         hs.reload()
--     end
-- end)

hs.alert.show("Config loaded")
