return function ()
    if slab.BeginMainMenuBar() then
        if slab.BeginMenu("Edit") then
            slab.EndMenu()
        end
    
        slab.EndMainMenuBar()
    end
end