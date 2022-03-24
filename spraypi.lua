--[[
    SprayPI is an API for the Roblox game "Spray Paint".
    This API will let you interact with the game.
]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SprayPI = {}
-- Spray Paint protects its remotes using a random value between 300K and 400K.
-- Using this value, we can bypass those protections and send info to the server.
local protBypass = tick() / 300

-- Vote() will vote on a current running votekick.
function SprayPI.Vote(val:boolean)
	ReplicatedStorage.VoteKick:FireServer("Vote", val)
end

-- InitiateVote() will create a votekick on a player with whatever text.
-- I think this also bypasses the char limit on votekicking.
function SprayPI.InitiateVotekick(player:Instance, text:string)
	ReplicatedStorage.VoteKick:FireServer("Initiate", player, text)
end

-- Spray() will start spraying whereever SendPaintInfo() requests.
function SprayPI.Spray(color:Color3)
	Players.LocalPlayer.Character:WaitForChild("SprayPaint"):FindFirstChild("SprayEffect"):FireServer(true, color)
end

-- StopSpraying() will stop Spray() from running. (Spray runs until StopSpraying() is called)
function SprayPI.StopSpraying()
	Players.LocalPlayer.Character:WaitForChild("SprayPaint"):FindFirstChild("SprayEffect"):FireServer(false)
end

--[[
    In order to use SendPaintInfo, you need to list 4 arguments in a table. They are:
    - Scale (this determines the spray size (from 0.2 to 2.2))
    - CFrame (determines the position of the spray.)
    - Color (takes a Color3 value for what color will be present)
    - Layer (determines the layer in which)
    
    Example:
    local ToDraw = {
    	[1] = {
    		["scale"] = 0.4,
			  ["cframe"] = CFrame.new(CFrame value here),
			  ["color"] = Color3.new(1, 1, 1),
			  ["layer"] = 1
    	}
    }
    
    library:SendPaintInfo(ToDraw)
]]
function SprayPI.SendPaintInfo(info)
	game:GetService("Players").LocalPlayer.Backpack:WaitForChild("SprayPaint"):FindFirstChild("SendPaintInfo"):InvokeServer(protBypass, info)
end

return SprayPI
