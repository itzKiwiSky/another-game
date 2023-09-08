return function()
    slab.BeginWindow('assetExplorer', { Title = "Assets Explorer", W = 220})
        slab.WindowToDock("Left")
        local files = love.filesystem.getDirectoryItems(projectROOT)
        slab.BeginListBox("assetExplorerList", {StretchW = true, StretchH = true})
            for f = 1, #files, 1 do
                local filedata = love.filesystem.getInfo(projectROOT .. "/" .. files[f])
                slab.BeginListBoxItem("assetExplorerListItem" .. f, {Selected = Selected == f, Clear = true})
                    if filedata.type == "directory" then
                        slab.Image("ListIcon" .. f, {
                            Image = iconsSheet,
                            SubX = iconsJsonData.frames[14].frame.x,
                            SubY = iconsJsonData.frames[14].frame.y,
                            SubW = iconsJsonData.frames[14].frame.w,
                            SubH = iconsJsonData.frames[14].frame.h,
                            W = 32,
                            H = 32,    
                        })
                    elseif filedata.type == "file" then
                        local extension = files[f]:match("^.+(%..+)$")
                        if extension == ".png" or extension == ".jpg" or extension == ".jpeg" then
                            slab.Image("asset_" .. files[f], 
                            {
                                Image = iconsSheet,
                                SubX = iconsJsonData.frames[16].frame.x,
                                SubY = iconsJsonData.frames[16].frame.y,
                                SubW = iconsJsonData.frames[16].frame.w,
                                SubH = iconsJsonData.frames[16].frame.h,
                                W = 32,
                                H = 32,
                            })
                        elseif extension == ".wav" or extension == ".mp3" or extension == ".ogg" then
                            slab.Image("asset_" .. files[f], 
                            {
                                Image = iconsSheet,
                                SubX = iconsJsonData.frames[19].frame.x,
                                SubY = iconsJsonData.frames[19].frame.y,
                                SubW = iconsJsonData.frames[19].frame.w,
                                SubH = iconsJsonData.frames[19].frame.h,
                                W = 32,
                                H = 32,
                            })
                        elseif extension == ".json" or extension == ".xml" or extension == ".ini" then
                            slab.Image("asset_" .. files[f], 
                            {
                                Image = iconsSheet,
                                SubX = iconsJsonData.frames[26].frame.x,
                                SubY = iconsJsonData.frames[26].frame.y,
                                SubW = iconsJsonData.frames[26].frame.w,
                                SubH = iconsJsonData.frames[26].frame.h,
                                W = 32,
                                H = 32,
                            })
                        elseif extension == ".ogv" then
                            slab.Image("asset_" .. files[f], 
                            {
                                Image = iconsSheet,
                                SubX = iconsJsonData.frames[13].frame.x,
                                SubY = iconsJsonData.frames[13].frame.y,
                                SubW = iconsJsonData.frames[13].frame.w,
                                SubH = iconsJsonData.frames[13].frame.h,
                                W = 32,
                                H = 32,
                            })
                        elseif extension == ".scn" then
                            slab.Image("asset_" .. files[f], 
                            {
                                Image = iconsSheet,
                                SubX = iconsJsonData.frames[23].frame.x,
                                SubY = iconsJsonData.frames[23].frame.y,
                                SubW = iconsJsonData.frames[23].frame.w,
                                SubH = iconsJsonData.frames[23].frame.h,
                                W = 32,
                                H = 32,
                            })
                        else
                            slab.Image("ListIcon" .. f, {
                                Image = iconsSheet,
                                SubX = iconsJsonData.frames[20].frame.x,
                                SubY = iconsJsonData.frames[20].frame.y,
                                SubW = iconsJsonData.frames[20].frame.w,
                                SubH = iconsJsonData.frames[20].frame.h,
                                W = 32,
                                H = 32,  
                            })
                        end
                    end
                    slab.SameLine()
                    slab.Text(files[f])
                    if slab.IsListBoxItemClicked() then
                        Selected = f
                    end
                slab.EndListBoxItem()
            end
        slab.EndListBox()
    slab.EndWindow()
end