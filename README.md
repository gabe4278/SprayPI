<h1 align=center>
SprayPI
</h1>

<p align=center>
<img src="https://img.shields.io/github/last-commit/SimultaneousPing/SprayPI?style=plastic">
<img src="https://img.shields.io/github/stars/SimultaneousPing/SprayPI?style=social">
<img src="https://img.shields.io/github/forks/SimultaneousPing/SprayPI?style=social">
</p>

<p align=center>
An open sourced API for the Roblox game Spray Paint which allows you to design code for the game easier.
<p>&nbsp;</p>

## Integrating
Integrating SprayPI into your own project is easy as PI! With 1 line of code, you can import the API and use it fluently, without any other hassle such as bloatware.

To start, add this script at the top of your code:
```
local SprayPI = loadstring(game:HttpGet("https://raw.githubusercontent.com/SimultaneousPing/SprayPI/main/spraypi.lua"))()
```

And you are now done! Now you can use the API. Here is the API:
```
function Vote(bool) -- Votes on a currently running votekick.
function InitiateVotekick(Player, Reason) -- Creates a votekick for [player] with [reason].
function Spray(Color3) -- This activates the SprayEffect remote. It will not stop unless StopSpraying() is called.
function StopSpraying() -- This stops the SprayEffect remote and makes you not allowed to paint.
function SendPaintInfo(info) -- This is the most advanced function in the API. It allows you to parse paint data to the server without limitations. Check below to find out how to send paint info.
```

## Sending Paint Info
SendPaintInfo is a powerful function in the API which parses data to the server relating to spraying. This function is normally protected, but however SprayPI bypasses that protection automatically. To send paint info, organize your data inside of a table like this

```
local Data = {
	[1] = {
		["scale"] = 0.4,
		["cframe"] = CFrame.new(value),
		["color"] = Color3.new(1, 1, 1),
		["layer"] = 1
	}
}
```

Then execute your data by calling SendPaintInfo like this.
```
SprayPI.SendPaintInfo(Data)
```
That is how you send data. Easy as that!

Do you not want to consider using this API? Here is the pros of it!

## Pros with SprayPI.
- `InitiateVotekick` bypasses the internal text limit that Spray Paint has set on the votekick GUI.
- `SendPaintInfo` is normally protected in game, however this protection is cracked completely by SprayPI.
- With SprayPI, you can make GUIs for Spray Paint easier, without having to type out long and annoying remote event paths. SprayPI does all the work for you!
- With `SendPaintInfo`, you can create your own autodrawing scripts, or just mess around.
- SprayPI is updated constantly, and we also listen for issues and pull requests on the repo!

## Cons with SprayPI.
- As much as we would like to include the functions used in the mod panel in game, we cannot, due to the remotes in game only being able to be fired from the server.
- There are some features we do not support yet (such as Rainbow Paint and saving/clearing paint), but we are adding these features progressively!

## Todo

- [ ] Add more QoL features to the API.
