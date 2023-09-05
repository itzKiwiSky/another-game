editorstate = {}

function editorstate:enter()
    uuid = require 'src.Components.UUID'
    menubar = require 'src.Components.Interface.Menubar'
    properties = require 'src.Components.Interface.PropertiesWindow'
    assetsExplorer = require 'src.Components.Interface.AssetExplorer'
end

function editorstate:draw()
    slab.Draw()
end

function editorstate:update(elapsed)
    slab.Update(elapsed)
    properties()
    assetsExplorer()
    menubar()
end

return editorstate