function quitButtonFrame(parentFrame)
    quitButton  = CreateFrame('Button', "Quit", parentFrame)
    quitButton:SetMovable(true)
    quitButton:EnableMouse(true)
    quitButton:SetPoint('TOPRIGHT', -3,  -3)
    quitButton:SetSize(16,16)
    local quitButtonTexture = quitButton:CreateTexture("ARTWORK")
    quitButtonTexture:SetAllPoints()
    quitButtonTexture:SetTexture("Interface\\AddOns\\PandasArmory\\x.tga")
    quitButton:SetScript("OnClick", function()
        print("I'm in your buttonz")
        parentFrame:Hide()
        quitButton:Hide()
    end)
    quitButton:SetScript("OnEnter", function()
        quitButtonTexture:SetTexture("Interface\\AddOns\\PandasArmory\\x2.tga")
    end)
    quitButton:SetScript("OnLeave", function()
        quitButtonTexture:SetTexture("Interface\\AddOns\\PandasArmory\\x.tga")
    end)
end
characterAchievementIDInOrder = {6,7,8,9,14782,14783,7382,7383,7384,7380,1176,1177,1178,1180,1181,5455,5456,6753,
                                891,889,890,5180,14796,14797,545,6614}--546}
    
function mainFrameInit()
    pandasWindow = CreateFrame("Frame", nil, UIParent)
    pandasWindow:SetMovable(true)
    pandasWindow:EnableMouse(true)
    pandasWindow:RegisterForDrag("LeftButton")
    pandasWindow:SetScript("OnDragStart", pandasWindow.StartMoving)
    pandasWindow:SetScript("OnDragStop", pandasWindow.StopMovingOrSizing)
    pandasWindow:SetWidth(1024) --1280
    pandasWindow:SetHeight(512) --800
    pandasWindow:SetPoint("CENTER", 0, 0)
    local tex = pandasWindow:CreateTexture("ARTWORK");
    tex:SetAllPoints();
    tex:SetTexture("Interface\\AddOns\\PandasArmory\\MainFrame.tga")
    pandasWindow.text1 = pandasWindow:CreateFontString(nil,"ARTWORK")
    pandasWindow.text1:SetFont("Fonts\\ARIALN.ttf", 13, "OUTLINE")
    pandasWindow.text1:SetPoint("CENTER", 0, 0)
    local repAchievInfo = {} --[0] = IDNumber, [1] = Name, [2] = Points, [3] = Completed, [4] = Month, [5] = Day, [6] = Year, [7] = Description, [8] = Flags, [9] = Image, [10] = RewardText, [11] = isGuildAch
    repAchievInfo["IDNumber"],repAchievInfo["Name"],repAchievInfo["Points"],repAchievInfo["Completed"],repAchievInfo["Month"],repAchievInfo["Day"],repAchievInfo["Year"],repAchievInfo["Description"],repAchievInfo["Flags"],repAchievInfo["Image"],repAchievInfo["RewardText"],repAchievInfo["isGuildAch"] = GetAchievementInfo(222)
    --repAchievInfo[1] = 2321
    pandasWindow.text1:SetText(repAchievInfo["Image"])
    quitButtonFrame(pandasWindow)
    for i=0, 1,1 do
        for j=1,13,1 do --13
            achievFrameInit(characterAchievementIDInOrder[j+i*13],j*48,i*-48,pandasWindow)
        end
    end
    pandasWindow:SetAlpha(0.95)
    pandasWindow:Show()
end

function achievFrameInit(achievementID,x,y,parentFrame)
    achievInfoFrame = CreateFrame("FRAME", achievementName, parentFrame)
    achievInfoFrame:SetMovable(true)
    achievInfoFrame:EnableMouse(true)
    achievInfoFrame.repAchievInfo = {} --[0] = IDNumber, [1] = Name, [2] = Points, [3] = Completed, [4] = Month, [5] = Day, [6] = Year, [7] = Description, [8] = Flags, [9] = Image, [10] = RewardText, [11] = isGuildAch
    achievInfoFrame.repAchievInfo["IDNumber"],
        achievInfoFrame.repAchievInfo["Name"],
        achievInfoFrame.repAchievInfo["Points"],
        achievInfoFrame.repAchievInfo["Completed"],
        achievInfoFrame.repAchievInfo["Month"],
        achievInfoFrame.repAchievInfo["Day"],
        achievInfoFrame.repAchievInfo["Year"],
        achievInfoFrame.repAchievInfo["Description"],
        achievInfoFrame.repAchievInfo["Flags"],
        achievInfoFrame.repAchievInfo["Image"],
        achievInfoFrame.repAchievInfo["RewardText"],
        achievInfoFrame.repAchievInfo["isGuildAch"] = GetAchievementInfo(achievementID)
    achievInfoFrame:SetPoint('TOPLEFT', x+100,  y-220)
    achievInfoFrame:SetSize(48,48)
    achieveTex = achievInfoFrame:CreateTexture("ARTWORK")
    achieveTex:SetAllPoints();
    achieveTex:SetTexture(achievInfoFrame.repAchievInfo["Image"])--IDtoPath[achievInfoFrame.repAchievInfo["Image"]])

    if(achievInfoFrame.repAchievInfo["Completed"])
    then
    else
        achieveTex:SetDesaturated(1)
    end
    achievInfoFrame:Show()
    
    achievInfoFrame:SetScript("OnEnter", function()
        local frameID = GetMouseFocus()
        achievCompletionInfo  = CreateFrame('Button', frameID , UIParent)
        achievCompletionInfo:SetFrameLevel(frameID:GetFrameLevel()+1)
        achievCompletionInfo:SetPoint("TOPLEFT", frameID ,"BOTTOMRIGHT",0, 0)
        -- achievCompletionInfo:SetSize(280,28) 
        local tex = achievCompletionInfo:CreateTexture("ARTWORK");
        tex:SetAllPoints();
        tex:SetColorTexture(0.1,0.1,0.1 ,0.7)
        local text1 = achievCompletionInfo:CreateFontString(nil,"ARTWORK")
        text1:SetFont("Fonts\\ARIALN.ttf", 16    , "OUTLINE")
        text1:SetPoint("CENTER", 0, 0)
        if(frameID.repAchievInfo["Completed"])
        then
            achievMessage = frameID.repAchievInfo["Name"]..
                " obtained at "..frameID.repAchievInfo["Day"].."/"..
                 frameID.repAchievInfo["Month"].."/"..frameID.repAchievInfo["Year"]
            achievDesc = frameID.repAchievInfo["Description"]
            achievPrint = achievMessage .. "\n" .. achievDesc
            if (string.len(achievMessage) > string.len(achievDesc))
            then
                achievCompletionInfo:SetSize(string.len(achievMessage)*6 + 60,48) 
            else
                achievCompletionInfo:SetSize(string.len(achievDesc)*6 + 60,48) 
            end
            text1:SetTextColor(0,0.9,0,1)
        else
            achievMessage = frameID.repAchievInfo["Name"].." not obtained"
            achievPrint = achievMessage
            achievCompletionInfo:SetSize(string.len(achievMessage)*6 + 60,24) 
            text1:SetTextColor(0.6,0.6,0.6)
        end
        text1:SetText(achievPrint)
    end)
    achievInfoFrame:SetScript("OnLeave", function()
        achievCompletionInfo:Hide()
    end)
end

mainFrameInit()

SLASH_PANDA1 = "/PANDA1"
local function pandasWindowHandler(msg)
    pandasWindow:Show()
    quitButton:Show()
end

SlashCmdList["PANDA"] = pandasWindowHandler 
