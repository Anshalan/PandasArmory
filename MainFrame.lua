local PandasArmory, NS = ...

function mainFrameCreate()
    mainFrame = CreateFrame("Frame", nil, UIParent)
    mainFrame:RegisterEvent("PLAYER_LOGIN")
    
    function mainFrameInit()
        mainFrame:SetAlpha(0.95) 
        mainFrame:SetMovable(true)
        mainFrame:EnableMouse(true)
        mainFrame:RegisterForDrag("LeftButton")
        mainFrame:SetScript("OnDragStart", mainFrame.StartMoving)
        mainFrame:SetScript("OnDragStop", mainFrame.StopMovingOrSizing)
        mainFrame:SetWidth(1024) --1280
        mainFrame:SetHeight(512) --800
        mainFrame:SetPoint("CENTER", 0, 0)
        mainFrame.tex = mainFrame:CreateTexture("ARTWORK");
        mainFrame.tex:SetAllPoints()
        mainFrame.tex:SetTexture("Interface\\AddOns\\PandasArmory\\MainFrame.tga")
        mainFrame.headText = mainFrame:CreateFontString(nil,"ARTWORK")
        mainFrame.headText:SetFont("Fonts\\MORPHEUS.ttf", 16, "OUTLINE")
        mainFrame.headText:SetPoint("CENTER", 0, 246)
        mainFrame.headText:SetTextColor(1,1,1)
        mainFrame.headText:SetText("Pandas Armory")
        mainFrame.quitButton = quitButtonFrame(mainFrame)
        mainFrame.tabButton1 = tabButton(mainFrame, "Achievements", 1)
        mainFrame.tabButton2 = tabButton(mainFrame, "Mounts", 2)
        mainFrame.tabButton3 = tabButton(mainFrame, "Pets", 3)
        mainFrame.tabButton4 = tabButton(mainFrame, "???", 4)
        mainFrame.tabButton5 = tabButton(mainFrame, "Toys", 5)
        mainFrame.tab1 = achievementTabFrame()
        mainFrame.tab2 = mountTabFrame()
    end

    function showMainFrame()
        mainFrame:Show()
        mainFrame.quitButton:Show()
        mainFrame.tab1:Hide()
        mainFrame.tab2:Hide()
    end

    mainFrame:SetScript("OnEvent", function()
        mainFrame:SetMovable(true)
        mainFrame:EnableMouse(true)
        mainFrame:RegisterForDrag("LeftButton")
        mainFrame:SetScript("OnDragStart", mainFrame.StartMoving)
        mainFrame:SetScript("OnDragStop", mainFrame.StopMovingOrSizing)
        mainFrame:SetWidth(1024) --1280
        mainFrame:SetHeight(512) --800
        mainFrame:SetPoint("CENTER", 0, 0)
        mainFrame.tex = mainFrame:CreateTexture("ARTWORK");
        mainFrame.tex:SetAllPoints()
        mainFrame.tex:SetTexture("Interface\\AddOns\\PandasArmory\\MainFrame.tga")
        mainFrame.headText = mainFrame:CreateFontString(nil,"ARTWORK")
        mainFrame.headText:SetFont("Fonts\\MORPHEUS.ttf", 16, "OUTLINE")
        mainFrame.headText:SetPoint("CENTER", 0, 246)
        mainFrame.headText:SetTextColor(1,1,1)
        mainFrame.headText:SetText("Pandas Armory")
        mainFrame.quitButton = quitButtonFrame(mainFrame)
        mainFrame.tabButton1 = tabButton(mainFrame, "Achievements", 1)
        mainFrame.tabButton2 = tabButton(mainFrame, "Mounts", 2)
        mainFrame.tabButton3 = tabButton(mainFrame, "Pets", 3)
        mainFrame.tabButton4 = tabButton(mainFrame, "???", 4)
        mainFrame.tabButton5 = tabButton(mainFrame, "Toys", 5)
        mainFrame.tab1 = achievementTabFrame()
        mainFrame.tab2 = mountTabFrame()
        showMainFrame()
    end)
end
NS.A.mainFrameCreate = mainFrameCreate

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
        print("PandasArmory: type /panda1 to reopen the window")
        parentFrame:Hide()
        quitButton:Hide()
    end)
    quitButton:SetScript("OnEnter", function()
        quitButtonTexture:SetTexture("Interface\\AddOns\\PandasArmory\\x2.tga")
    end)
    quitButton:SetScript("OnLeave", function()
        quitButtonTexture:SetTexture("Interface\\AddOns\\PandasArmory\\x.tga")
    end)
    return quitButton
end
NS.A.quitButtonFrame = quitButtonFrame

function tabButton(parentFrame, frameName, frameNumber)
    local tabButton = CreateFrame("Button", frameName, parentFrame)
    tabButton:SetMovable(true)
    tabButton:EnableMouse(true)
    tabButton:SetPoint('TOPLEFT', -120  + 125   *frameNumber,  -34)
    tabButton:SetSize(128,32)
    tabButton.tabButtonTexture = tabButton:CreateTexture("ARTWORK")
    tabButton.tabButtonTexture:SetAllPoints()
    tabButton.tabButtonTexture:SetTexture("Interface\\AddOns\\PandasArmory\\buttonTabFrame.tga")
    tabButton.buttonName = tabButton:CreateFontString(nil,"ARTWORK")
    tabButton.buttonName:SetFont("Fonts\\FRIZQT__.ttf", 14, "OUTLINE")
    tabButton.buttonName:SetPoint("CENTER", 0, 0)
    tabButton.buttonName:SetTextColor(0.9,0.9,0)
    tabButton.buttonName:SetText(frameName)
    
    tabButton:SetScript("OnClick", function()
        if(frameNumber == 1)
        then
            tabButton.tabButtonTexture:SetTexture("Interface\\AddOns\\PandasArmory\\buttonTabFrameHighlighted.tga")
            mainFrame.tabButton2.tabButtonTexture:SetTexture("Interface\\AddOns\\PandasArmory\\buttonTabFrame.tga")
            mainFrame.tab1:Show()
            mainFrame.tab2:Hide()
        elseif(frameNumber == 2)
        then
            tabButton.tabButtonTexture:SetTexture("Interface\\AddOns\\PandasArmory\\buttonTabFrameHighlighted.tga")
            mainFrame.tabButton1.tabButtonTexture:SetTexture("Interface\\AddOns\\PandasArmory\\buttonTabFrame.tga")
            mainFrame.tab1:Hide()
            mainFrame.tab2:Show()
        end
    end)
    return tabButton
end
NS.A.tabButton = tabButton

function tabFrame()
    local tabFrame = CreateFrame("Frame", nil, mainFrame)
    tabFrame:SetMovable(true)
    tabFrame:EnableMouse(true)
    tabFrame:RegisterForDrag("LeftButton")
    tabFrame:SetWidth(1024) --1280
    tabFrame:SetHeight(448) --800
        -- local tex = tabFrame:CreateTexture("ARTWORK");
    tabFrame:SetPoint("BOTTOMLEFT", 0, 0)
    -- tex:SetTexture("Interface\\AddOns\\PandasArmory\\test.tga")
    -- tex:SetAllPoints()
    return tabFrame
end
NS.A.tabFrame = tabFrame


function categoryButton(parentFrame, frameName, frameNumber, totalFrameNumber)
    local categoryButton = CreateFrame("Button", frameName, parentFrame)
    categoryButton:SetMovable(true)
    categoryButton:EnableMouse(true)
    categoryButton:SetPoint('TOPLEFT',0,  -2-34*frameNumber)
    categoryButton:SetSize(128,32)
    categoryButton.categoryButtonTexture = categoryButton:CreateTexture("ARTWORK")
    categoryButton.categoryButtonTexture:SetAllPoints()
    categoryButton.categoryButtonTexture:SetTexture("Interface\\AddOns\\PandasArmory\\buttonCategoryFrame.tga")
    categoryButton.buttonName = categoryButton:CreateFontString(nil,"ARTWORK")
    categoryButton.buttonName:SetFont("Fonts\\FRIZQT__.ttf", 12, "OUTLINE")
    categoryButton.buttonName:SetPoint("CENTER", 0, 0)
    categoryButton.buttonName:SetTextColor(0.9,0.9,0)
    categoryButton.buttonName:SetText(frameName)
    
    categoryButton:SetScript("OnClick", function() -- slow, fix working speed, use some variable to keep active frame/button
        for i=0, totalFrameNumber,1 do
            parentFrame.categoryButtons[i].categoryButtonTexture:SetTexture("Interface\\AddOns\\PandasArmory\\buttonCategoryFrame.tga")
            parentFrame.categoryFrames[i]:Hide()
        end
        parentFrame.categoryFrames[frameNumber]:Show()
        categoryButton.categoryButtonTexture:SetTexture("Interface\\AddOns\\PandasArmory\\buttonCategoryFrameHighlighted.tga")
    end)
    return categoryButton
end
NS.A.categoryButton = categoryButton

function categoryFrame(parentFrame)
    local categoryFrame = CreateFrame("Frame", nil, parentFrame)
    categoryFrame:SetMovable(true)
    categoryFrame:EnableMouse(true)
    categoryFrame:RegisterForDrag("LeftButton")
    categoryFrame:SetWidth(1024-128) --1280
    categoryFrame:SetHeight(448) --800
        -- local tex = tabFrame:CreateTexture("ARTWORK");
        categoryFrame:SetPoint("BOTTOMLEFT", 128, 0)
    -- tex:SetTexture("Interface\\AddOns\\PandasArmory\\test.tga")
    -- tex:SetAllPoints()
    return categoryFrame
end

function scrollFrame(parentFrame)
    self = CreateFrame("Frame", nil, parentFrame);
    self:SetWidth(parentFrame:GetWidth())
    self:SetHeight(parentFrame:GetHeight())
    self:SetPoint('BOTTOMRIGHT',0,0) 
    -- self = parentFrame
    -- re-size this to whatever size you wish your ScrollFrame to be, at this point
    -- self.texture = self:CreateTexture(nil,"BACKGROUND")
    -- self.texture:SetTexture("Interface\\AddOns\\PandasArmory\\buttonCategoryFrame.tga")
    -- self.texture:SetAllPoints(self)
    self:Show()

    -- now create the template Scroll Frame (this frame must be given a name so that it can be looked up via the _G function (you'll see why later on in the code)
    self.scrollframe =CreateFrame("ScrollFrame", "ANewScrollFrame", self, "UIPanelScrollFrameTemplate");
    
    -- create the standard frame which will eventually become the Scroll Frame's scrollchild
    -- importantly, each Scroll Frame can have only ONE scrollchild
    self.scrollchild =CreateFrame("Frame"); -- not sure what happens if you do, but to be safe, don't parent this yet (or do anything with it)
    
    -- define the scrollframe's objects/elements:
    local scrollbarName = self.scrollframe:GetName()
    self.scrollbar = _G[scrollbarName.."ScrollBar"];
    self.scrollupbutton = _G[scrollbarName.."ScrollBarScrollUpButton"];
    self.scrolldownbutton = _G[scrollbarName.."ScrollBarScrollDownButton"];
    
    -- all of these objects will need to be re-anchored (if not, they appear outside the frame and about 30 pixels too high)
    self.scrollupbutton:ClearAllPoints();
    self.scrollupbutton:SetPoint("TOPRIGHT", self.scrollframe, "TOPRIGHT", -2, -2);
    
    self.scrolldownbutton:ClearAllPoints(); 
    self.scrolldownbutton:SetPoint("BOTTOMRIGHT", self.scrollframe, "BOTTOMRIGHT", -2, 2);
    
    self.scrollbar:ClearAllPoints();
    self.scrollbar:SetPoint("TOP", self.scrollupbutton, "BOTTOM", 0, -2);
    self.scrollbar:SetPoint("BOTTOM", self.scrolldownbutton, "TOP", 0, 2);
    
    -- now officially set the scrollchild as your Scroll Frame's scrollchild (this also parents self.scrollchild to self.scrollframe)
    -- IT IS IMPORTANT TO ENSURE THAT YOU SET THE SCROLLCHILD'S SIZE AFTER REGISTERING IT AS A SCROLLCHILD:
    self.scrollframe:SetScrollChild(self.scrollchild);
    
    -- set self.scrollframe points to the first frame that you created (in this case, self)
    self.scrollframe:SetAllPoints(self);
    
    -- now that SetScrollChild has been defined, you are safe to define your scrollchild's size. Would make sense to make it's height > scrollframe's height,
    -- otherwise there's no point having a scrollframe!
    -- note: you may need to define your scrollchild's height later on by calculating the combined height of the content that the scrollchild's child holds.
    -- (see the bit below about showing content).
    self.scrollchild:SetSize(self.scrollframe:GetWidth(), ( self.scrollframe:GetHeight() * 2 ));

    
    -- THE SCROLLFRAME IS COMPLETE AT THIS POINT.  THE CODE BELOW DEMONSTRATES HOW TO SHOW DATA ON IT.
    
    
    -- you need yet another frame which will be used to parent your widgets etc to.  This is the frame which will actually be seen within the Scroll Frame
    -- It is parented to the scrollchild.  I like to think of scrollchild as a sort of 'pin-board' that you can 'pin' a piece of paper to (or take it back off)
    self.moduleoptions = self.moduleoptions or CreateFrame("Frame", nil, self.scrollchild);
    self.moduleoptions:SetAllPoints(self.scrollchild);


    
    -- a good way to immediately demonstrate the new scrollframe in action is to do the following...
    
    -- create a fontstring or a texture or something like that, then place it at the bottom of the frame that holds your info (in this case self.moduleoptions)

    self.moduleoptions.tab2 = achievementCharacterFrame()
    -- self.moduleoptions.fontstring = self.moduleoptions:CreateFontString(self.moduleoptions,"OVERLAY", UIParent)
    -- self.moduleoptions.fontstring:SetFont("Fonts\\FRIZQT__.ttf", 12, "OUTLINE")
    -- self.moduleoptions.fontstring:SetTextColor(0.9,0.9,0)
    -- self.moduleoptions.fontstring:SetPoint("BOTTOMLEFT", self.moduleoptions, "BOTTOMLEFT", 20, 60);
    -- self.moduleoptions.fontstring:SetText("This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.");
    -- self.moduleoptions
    -- you should now need to scroll down to see the text "This is a test."
end





NS.A.categoryFrame = categoryFrame
