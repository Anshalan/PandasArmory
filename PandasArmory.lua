local PandasArmory, NS = ...

characterAchievementIDInOrder = {6,7,8,9,14782,14783,7382,7383,7384,7380,1176,1177,1178,1180,1181,5455,5456,6753,
                                891,889,890,5180,14796,14797,545,546}
questAchievementIDInOrder = {503,504,505,506,507,508,32,978,973,974,975,976,977,5751,7410,7411,4956,4957,941,1576,4958,
                            11126,11127,11128,11129,11130,11131,11132,31,1182,5752,7520,14222}
collectMounts = {246,292,521, 548, 477, 1167, 1191, 664}      
mainFrameCreate()

SLASH_PANDA1 = "/PANDA1"
local function pandasWindowHandler(msg)
    showMainFrame()
end

SlashCmdList["PANDA"] = pandasWindowHandler 
