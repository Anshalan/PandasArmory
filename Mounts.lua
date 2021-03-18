local PandasArmory, NS = ...

mountsCategories = {"General","Shadowlands","Battle for Azeroth", "Legion","Warlords of Draenor","Mist of Pandaria",
                    "Cataclysm","Wrath of the Lich King","The Burning Crusade", "Classic", "Racial", "Professions","PVP",
                    "World Events", "Promotions", "Other"}  
function mountTabFrame()
    mountTabFrame = tabFrame()
    mountTabFrame.categoryButtons = {}
    mountTabFrame.categoryFrames = {}
    mountTabFrame.scrollFrames = {}
    for i = 0, 15, 1 do
        mountTabFrame.categoryButtons[i] = categoryButton(mountTabFrame,mountsCategories[i+1],i, 15)
        mountTabFrame.categoryFrames[i] = categoryFrame(mountTabFrame)
        mountTabFrame.scrollFrames[i] = scrollFrame(mountTabFrame.categoryFrames[i],"scrollframeMount"..i)
    end
    
    mountGeneralFrame(mountTabFrame.scrollFrames[0].moduleoptions)
    -- for i=0, 1,1 do
    --     for j=1,4,1 do --13
    --         mountFrameInit(collectMounts[j+i*4],j*48,i*-48,mountTabFrame)
    --     end
    -- end

    mountTabFrame.categoryFrames[0]:Hide()

    return mountTabFrame
end
function mountGeneralFrame(parentFrame) --rly this function name will need a change
    parentFrame.text1 = fontStringWithOffsets(parentFrame, 2, 0, "Character")
    for key,value in pairs(mounts["mountsGeneral"]) do
        mountFrameInit(mounts["mountsGeneral"][1][key],key*48,(-0*24)-16,parentFrame)
    end
    parentFrame.text1 = fontStringWithOffsets(parentFrame, 2, 3, "Reputations")
    -- for i=1,1,1 do 
    --     mountFrameInit(mountsGeneral[2][i],i*48,(-3*24)-16,parentFrame)
    -- end
    parentFrame.text1 = fontStringWithOffsets(parentFrame, 2, 6, "Toys")
    -- for i=1,1,1 do 
    --     mountFrameInit(mountsGeneral[3][i],i*48,(-6*24)-16,parentFrame)
    -- end
    parentFrame.text1 = fontStringWithOffsets(parentFrame, 2, 9, "Heirlooms")
    -- for i=1,1,1 do 
    --     mountFrameInit(mountsGeneral[4][i],i*48,(-9*24)-16,parentFrame)
    -- end
end

function mountFrameInit(mountID,x,y,parentFrame)
    mountInfoFrame = CreateFrame("FRAME", mountName, parentFrame)
    mountInfoFrame:SetMovable(true)
    mountInfoFrame:EnableMouse(true)
    mountInfoFrame.repMountInfo = {}
    mountInfoFrame.repMountInfo["name"],
        mountInfoFrame.repMountInfo["spellID"],
        mountInfoFrame.repMountInfo["icon"],
        mountInfoFrame.repMountInfo["isActive"],
        mountInfoFrame.repMountInfo["isUsable"],
        mountInfoFrame.repMountInfo["sourceType"],
        mountInfoFrame.repMountInfo["isFavorite"],
        mountInfoFrame.repMountInfo["isFactionSpecific"],
        mountInfoFrame.repMountInfo["faction"],
        mountInfoFrame.repMountInfo["shouldHideOnChar"],
        mountInfoFrame.repMountInfo["isCollected"],
        mountInfoFrame.repMountInfo["mountID"] = C_MountJournal.GetMountInfoByID(mountID)
        mountInfoFrame:SetPoint('TOPLEFT', x,  y)
        mountInfoFrame:SetSize(48,48)
    local MountTex = mountInfoFrame:CreateTexture("ARTWORK")
    MountTex:SetAllPoints()
    MountTex:SetTexture(mountInfoFrame.repMountInfo["icon"])--IDtoPath[achievInfoFrame.repAchievInfo["Image"]])

    if(mountInfoFrame.repMountInfo["isCollected"])
    then
    else
        MountTex:SetDesaturated(1)
    end
    mountInfoFrame:Show()
    
    mountInfoFrame:SetScript("OnEnter", function()
        local frameID = GetMouseFocus()
        mountCompletionInfo  = CreateFrame('Button', frameID , UIParent)
        mountCompletionInfo:SetFrameLevel(frameID:GetFrameLevel()+1)
        mountCompletionInfo:SetPoint("TOPLEFT", frameID ,"BOTTOMRIGHT",0, 0)
        local tex = mountCompletionInfo:CreateTexture("ARTWORK")
        tex:SetAllPoints()
        tex:SetColorTexture(0.1,0.1,0.1 ,0.7)
        local text1 = mountCompletionInfo:CreateFontString(nil,"ARTWORK")
        text1:SetFont("Fonts\\ARIALN.ttf", 16, "OUTLINE")
        text1:SetPoint("CENTER", 0, 0)
        if(frameID.repMountInfo["isCollected"])
        then
            mountMessage = frameID.repMountInfo["name"].." obtained"
            mountCompletionInfo:SetSize(string.len(mountMessage)*6 + 60,24) 
            text1:SetTextColor(0,0.9,0,1)
        else
            mountMessage = frameID.repMountInfo["name"].." not obtained"
            mountCompletionInfo:SetSize(string.len(mountMessage)*6 + 60,24) 
            text1:SetTextColor(0.6,0.6,0.6)
        end
        text1:SetText(mountMessage)
    end)
    mountInfoFrame:SetScript("OnLeave", function()
        mountCompletionInfo:Hide()
    end)
    return mountInfoFrame
end
NS.A.mountFrameInit = mountFrameInit
