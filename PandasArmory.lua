local PandasArmory, NS = ...

characterAchievementIDInOrder = {6,7,8,9,14782,14783,7382,7383,7384,7380,1176,1177,1178,1180,1181,5455,5456,6753,
                                891,889,890,5180,14796,14797,545,546}
questAchievementIDInOrder = {503,504,505,506,507,508,32,978,973,974,975,976,977,5751,7410,7411,4956,4957,941,1576,4958,
                            11126,11127,11128,11129,11130,11131,11132,31,1182,5752,7520,14222}
collectMounts = {246,292,521, 548, 477, 1167, 1191, 664}      
mainFrameCreate()

-- local frameHolder;
 
-- -- create the frame that will hold all other frames/objects:
-- self = CreateFrame("Frame", nil, UIParent);
-- self:SetWidth(500)
-- self:SetHeight(500)
-- self:SetPoint('CENTER',0,0) 

-- -- re-size this to whatever size you wish your ScrollFrame to be, at this point
-- self.texture = self:CreateTexture(nil,"BACKGROUND")
-- self.texture:SetTexture("Interface\\AddOns\\PandasArmory\\buttonCategoryFrame.tga")
-- self.texture:SetAllPoints(self)
-- self:Show()

-- -- now create the template Scroll Frame (this frame must be given a name so that it can be looked up via the _G function (you'll see why later on in the code)
-- self.scrollframe =CreateFrame("ScrollFrame", "ANewScrollFrame", self, "UIPanelScrollFrameTemplate");
 
-- -- create the standard frame which will eventually become the Scroll Frame's scrollchild
-- -- importantly, each Scroll Frame can have only ONE scrollchild
-- self.scrollchild =CreateFrame("Frame"); -- not sure what happens if you do, but to be safe, don't parent this yet (or do anything with it)
 
-- -- define the scrollframe's objects/elements:
-- local scrollbarName = self.scrollframe:GetName()
-- self.scrollbar = _G[scrollbarName.."ScrollBar"];
-- self.scrollupbutton = _G[scrollbarName.."ScrollBarScrollUpButton"];
-- self.scrolldownbutton = _G[scrollbarName.."ScrollBarScrollDownButton"];
 
-- -- all of these objects will need to be re-anchored (if not, they appear outside the frame and about 30 pixels too high)
-- self.scrollupbutton:ClearAllPoints();
-- self.scrollupbutton:SetPoint("TOPRIGHT", self.scrollframe, "TOPRIGHT", -2, -2);
 
-- self.scrolldownbutton:ClearAllPoints(); 
-- self.scrolldownbutton:SetPoint("BOTTOMRIGHT", self.scrollframe, "BOTTOMRIGHT", -2, 2);
 
-- self.scrollbar:ClearAllPoints();
-- self.scrollbar:SetPoint("TOP", self.scrollupbutton, "BOTTOM", 0, -2);
-- self.scrollbar:SetPoint("BOTTOM", self.scrolldownbutton, "TOP", 0, 2);
 
-- -- now officially set the scrollchild as your Scroll Frame's scrollchild (this also parents self.scrollchild to self.scrollframe)
-- -- IT IS IMPORTANT TO ENSURE THAT YOU SET THE SCROLLCHILD'S SIZE AFTER REGISTERING IT AS A SCROLLCHILD:
-- self.scrollframe:SetScrollChild(self.scrollchild);
 
-- -- set self.scrollframe points to the first frame that you created (in this case, self)
-- self.scrollframe:SetAllPoints(self);
 
-- -- now that SetScrollChild has been defined, you are safe to define your scrollchild's size. Would make sense to make it's height > scrollframe's height,
-- -- otherwise there's no point having a scrollframe!
-- -- note: you may need to define your scrollchild's height later on by calculating the combined height of the content that the scrollchild's child holds.
-- -- (see the bit below about showing content).
-- self.scrollchild:SetSize(self.scrollframe:GetWidth(), ( self.scrollframe:GetHeight() * 2 ));

 
-- -- THE SCROLLFRAME IS COMPLETE AT THIS POINT.  THE CODE BELOW DEMONSTRATES HOW TO SHOW DATA ON IT.
 
 
-- -- you need yet another frame which will be used to parent your widgets etc to.  This is the frame which will actually be seen within the Scroll Frame
-- -- It is parented to the scrollchild.  I like to think of scrollchild as a sort of 'pin-board' that you can 'pin' a piece of paper to (or take it back off)
-- self.moduleoptions = self.moduleoptions or CreateFrame("Frame", nil, self.scrollchild);
-- self.moduleoptions:SetAllPoints(self.scrollchild);


 
-- -- a good way to immediately demonstrate the new scrollframe in action is to do the following...
 
-- -- create a fontstring or a texture or something like that, then place it at the bottom of the frame that holds your info (in this case self.moduleoptions)

-- self.moduleoptions.tab2 = achievementCharacterFrame()
-- -- self.moduleoptions.fontstring = self.moduleoptions:CreateFontString(self.moduleoptions,"OVERLAY", UIParent)
-- -- self.moduleoptions.fontstring:SetFont("Fonts\\FRIZQT__.ttf", 12, "OUTLINE")
-- -- self.moduleoptions.fontstring:SetTextColor(0.9,0.9,0)
-- -- self.moduleoptions.fontstring:SetPoint("BOTTOMLEFT", self.moduleoptions, "BOTTOMLEFT", 20, 60);
-- -- self.moduleoptions.fontstring:SetText("This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.This is a test.");
-- -- self.moduleoptions
-- -- you should now need to scroll down to see the text "This is a test."



-- MyModData = {}

-- function MyMod_OnLoad()
--   for i=1,50 do
--     MyModData[i] = "Test "..math.random(100)
--   end
--   MyModScrollBar:Show()
-- end

-- function MyModScrollBar_Update()
--   local line; -- 1 through 5 of our window to scroll
--   local lineplusoffset; -- an index into our data calculated from the scroll offset
--   FauxScrollFrame_Update(MyModScrollBar,50,5,16);
--   for line=1,5 do
--     lineplusoffset = line + FauxScrollFrame_GetOffset(MyModScrollBar);
--     if lineplusoffset <= 50 then
--       getglobal("MyModEntry"..line):SetText(MyModData[lineplusoffset]);
--       getglobal("MyModEntry"..line):Show();
--     else
--       getglobal("MyModEntry"..line):Hide();
--     end
--   end
-- end




SLASH_PANDA1 = "/PANDA1"
local function pandasWindowHandler(msg)
    showMainFrame()
end

SlashCmdList["PANDA"] = pandasWindowHandler 
