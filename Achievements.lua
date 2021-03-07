local PandasArmory, NS = ...

categoryNames = {"Character", "Quest", "Exploration", "Player vs. Player", "Dungeons & Raids", "Professions", "Reputations",
                " World Events", "Pet Battles", "Collections", "Expansion Features", "Feast of Strength", "Legacy"}
categoryFrames = {"Character", "Quest", "Exploration", "Player vs. Player", "Dungeons & Raids", "Professions", "Reputations",
" World Events", "Pet Battles", "Collections", "Expansion Features", "Feast of Strength", "Legacy"}
function achievementTabFrame()
    achievementTabFrame = tabFrame()
    achievementTabFrame.categoryButtons = {}
    achievementTabFrame.categoryFrames = {}
    for k=0, 12, 1  do
        achievementTabFrame.categoryButtons[k] = categoryButton(achievementTabFrame,categoryNames[k+1],k, 12)
        achievementTabFrame.categoryFrames[k] = categoryFrame(achievementTabFrame)
    end

    --scrollframe

    --scorrlframe

    scrollFrame(achievementTabFrame)


    -- achievementCharacterFrame()
    -- achievementQuestFrame()

    -- for i=0, 12, 1  do
    --     achievementTabFrame.categoryFrames[i]:Hide()
    -- end 
    
    return achievementTabFrame
end

function achievementCharacterFrame()
    for i=0, 1,1 do
        for j=1,13,1 do --13
            achievFrameInit(characterAchievementIDInOrder[j+i*13],j*48,i*-48,self.moduleoptions)--achievementTabFrame.categoryFrames[0]])
        end
    end
end
function achievementQuestFrame()
    for k=1,3,1 do
        for i=0, 2,1 do
            for j=1,11,1 do --13
                achievFrameInit(questAchievementIDInOrder[j+i*11],j*48,(i+3*k)*-48,achievementTabFrame.categoryFrames[1])
            end
        end
    end 
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
    achievInfoFrame:SetPoint('TOPLEFT', x+100,  y-120)
    achievInfoFrame:SetSize(48,48)
    achievInfoFrame.achieveTex = achievInfoFrame:CreateTexture("ARTWORK")
    achievInfoFrame.achieveTex:SetAllPoints()
    achievInfoFrame.achieveTex:SetTexture(achievInfoFrame.repAchievInfo["Image"])
    if(achievInfoFrame.repAchievInfo["Completed"])
    then
    else
        achievInfoFrame.achieveTex:SetDesaturated(1)
    end
    achievInfoFrame:Show()
    
    achievInfoFrame:SetScript("OnEnter", function()
        local frameID = GetMouseFocus()
        achievCompletionInfo  = CreateFrame('Button', frameID , UIParent)
        achievCompletionInfo:SetFrameLevel(frameID:GetFrameLevel()+1)
        achievCompletionInfo:SetPoint("TOPLEFT", frameID ,"BOTTOMRIGHT",0, 0)
        local tex = achievCompletionInfo:CreateTexture("ARTWORK")
        tex:SetAllPoints()
        tex:SetColorTexture(0.1,0.1,0.1 ,0.7)
        local text1 = achievCompletionInfo:CreateFontString(nil,"ARTWORK")
        text1:SetFont("Fonts\\ARIALN.ttf", 16, "OUTLINE")
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
    return achievInfoFrame
end
NS.A.achievFrameInit = achievFrameInit