local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local TweenService = game:GetService("TweenService")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local lastHitTime = {} 

local soundIds = {
	"rbxassetid://13064223399",
	"rbxassetid://13064223291",
	"rbxassetid://13064223483"
}

local colorCorrection = Instance.new("ColorCorrectionEffect")
colorCorrection.Parent = game.Lighting
colorCorrection.TintColor = Color3.new(1, 1, 1) 
colorCorrection.Brightness = 0






local redTintColor = Color3.new(1, 0, 0) 
local flashDuration = 0.5  
local recoveryDuration = 1  

local function flashRed()
	coroutine.wrap(function()
		local redFlashTween = TweenService:Create(
			colorCorrection, 
			TweenInfo.new(flashDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
			{ TintColor = redTintColor, Brightness = 0.2 }
		)

		local recoveryTween = TweenService:Create(
			colorCorrection, 
			TweenInfo.new(recoveryDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
			{ TintColor = Color3.new(1, 1, 1), Brightness = 0 }
		)

		-- Play the tweens
		redFlashTween:Play()
		redFlashTween.Completed:Wait()  
		recoveryTween:Play()
	end)()
end

workspace.Thrown.ChildAdded:Connect(function(child)
	task.defer(function()
		if child.Name == "Clone_Rig" then
			if child:FindFirstChild("Shirt") then
				if child.Shirt.ShirtTemplate == game.Players.LocalPlayer.Character.Shirt.ShirtTemplate then
					child:Destroy()
				end
			end
		end
	end)
end)

local function playRandomSound(targetCharacter)
	local randomIndex = math.random(1, #soundIds)
	local sound = Instance.new("Sound")
	sound.SoundId = soundIds[randomIndex]
	sound.Volume = 1
	sound.Parent = targetCharacter.HumanoidRootPart
	sound:Play()

	sound.Ended:Connect(function()
		sound:Destroy()
	end)
end

local lastHealth = {}

local function onHealthChanged(targetCharacter, humanoid)
	humanoid.HealthChanged:Connect(function(newHealth)
		local oldHealth = lastHealth[targetCharacter] or humanoid.MaxHealth 

		if newHealth < oldHealth then 
			if newHealth < humanoid.MaxHealth then
				if targetCharacter:GetAttribute("LastHit") == LocalPlayer.Name then
					local currentTime = tick()
					local lastTime = lastHitTime[targetCharacter] or 0
					if currentTime - lastTime >= 0.25 then
						local Module_Scripts = {}

						local StrongMone = Instance.new("Attachment")
						game.Debris:AddItem(StrongMone, 3)
						local Shockwaves2 = Instance.new("ParticleEmitter")
						local Shockwaves3 = Instance.new("ParticleEmitter")
						local DustShockwaves = Instance.new("ParticleEmitter")
						local RedDust2 = Instance.new("ParticleEmitter")
						local Push = Instance.new("ParticleEmitter")

						StrongMone.Name = [[StrongMone]]
						StrongMone.Parent = targetCharacter.HumanoidRootPart

						Shockwaves2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.466667,0.470588,0.470588),0),ColorSequenceKeypoint.new(0.495,Color3.new(0,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(0,0,0),0)})
						Shockwaves2.Drag = 5
						Shockwaves2.EmissionDirection = Enum.NormalId.Back
						Shockwaves2.Enabled = false
						Shockwaves2:Emit(15)
						Shockwaves2.FlipbookFramerate = NumberRange.new(18,20)
						Shockwaves2.Lifetime = NumberRange.new(1,3)
						Shockwaves2.LightEmission = 1
						Shockwaves2.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
						Shockwaves2.Rate = 40
						Shockwaves2.RotSpeed = NumberRange.new(100,400)
						Shockwaves2.Rotation = NumberRange.new(0,360)
						Shockwaves2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.1,5.11184,1.94737),NumberSequenceKeypoint.new(0.2,8.93842,3.89474),NumberSequenceKeypoint.new(0.3,11.1292,7.78947),NumberSequenceKeypoint.new(0.517,15.7153,11.6842),NumberSequenceKeypoint.new(1,20.4474,11.6842)})
						Shockwaves2.Speed = NumberRange.new(0.0146053,0.0146053)
						Shockwaves2.SpreadAngle = Vector2.new(2, 2)
						Shockwaves2.Texture = [[http://www.roblox.com/asset/?id=11703233149]]
						Shockwaves2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.8,0.2),NumberSequenceKeypoint.new(1,1,0)})
						Shockwaves2.Name = [[Shockwaves2]]
						Shockwaves2.Parent = StrongMone

						Shockwaves3.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.466667,0.470588,0.470588),0),ColorSequenceKeypoint.new(0.495,Color3.new(0,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(0,0,0),0)})
						Shockwaves3.Drag = 5
						Shockwaves3.EmissionDirection = Enum.NormalId.Back
						Shockwaves3.Enabled = false
						Shockwaves3.FlipbookFramerate = NumberRange.new(18,20)
						Shockwaves3.Lifetime = NumberRange.new(0.5,0.5)
						Shockwaves3.LightEmission = 1
						Shockwaves3.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
						Shockwaves3.Rate = 55
						Shockwaves3:Emit(15)

						Shockwaves3.RotSpeed = NumberRange.new(100,400)
						Shockwaves3.Rotation = NumberRange.new(0,360)
						Shockwaves3.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.1,10.2237,3.89474),NumberSequenceKeypoint.new(0.2,17.8768,7.78947),NumberSequenceKeypoint.new(0.3,22.2584,15.5789),NumberSequenceKeypoint.new(0.517,31.4305,23.3684),NumberSequenceKeypoint.new(1,40.8947,23.3684)})
						Shockwaves3.Speed = NumberRange.new(0.0146053,0.0146053)
						Shockwaves3.Texture = [[http://www.roblox.com/asset/?id=11703233149]]
						Shockwaves3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.8,0.2),NumberSequenceKeypoint.new(1,1,0)})
						Shockwaves3.Name = [[Shockwaves3]]
						Shockwaves3.Parent = StrongMone

						DustShockwaves.Brightness = 5
						DustShockwaves.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.988312,0.991241,1),0),ColorSequenceKeypoint.new(1,Color3.new(0,0,0),0)})
						DustShockwaves.Drag = 5
						DustShockwaves.EmissionDirection = Enum.NormalId.Back
						DustShockwaves.Enabled = false
						DustShockwaves.FlipbookFramerate = NumberRange.new(18,20)
						DustShockwaves.Lifetime = NumberRange.new(0.2,1.05)
						DustShockwaves.LightEmission = 1
						DustShockwaves.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
						DustShockwaves.Rate = 25

						DustShockwaves.Rotation = NumberRange.new(0,360)
						DustShockwaves.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,58.421,0)})
						DustShockwaves.Speed = NumberRange.new(0.0146053,0.0146053)
						DustShockwaves.SpreadAngle = Vector2.new(10, 10)
						DustShockwaves.Texture = [[http://www.roblox.com/asset/?id=11703216487]]
						DustShockwaves.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.96,0.04),NumberSequenceKeypoint.new(1,1,0)})
						DustShockwaves.Name = [[DustShockwaves]]
						DustShockwaves.Parent = StrongMone
						DustShockwaves:Emit(15)

						RedDust2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.988235,0.988235,0.988235),0),ColorSequenceKeypoint.new(1,Color3.new(0.988235,0.988235,0.988235),0)})
						RedDust2.Drag = 4
						RedDust2.EmissionDirection = Enum.NormalId.Back
						RedDust2.Enabled = false
						RedDust2.Lifetime = NumberRange.new(0.1,1)
						RedDust2.LightEmission = 0.800000011920929
						RedDust2.Orientation = Enum.ParticleOrientation.VelocityParallel
						RedDust2.Rate = 40
						RedDust2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.281,2.91889,2.74074),NumberSequenceKeypoint.new(1,7.30263,3.89474)})
						RedDust2.Speed = NumberRange.new(18.75,90)
						RedDust2.SpreadAngle = Vector2.new(25, 25)
						RedDust2.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0,-0.5,0.5),NumberSequenceKeypoint.new(1,-1,1)})
						RedDust2.Texture = [[rbxassetid://7216854921]]
						RedDust2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.339323,0,0),NumberSequenceKeypoint.new(0.80798,0.3625,0),NumberSequenceKeypoint.new(1,1,0)})
						RedDust2.Name = [[RedDust2]]
						RedDust2.Parent = StrongMone
						RedDust2:Emit(15)

						Push.Brightness = 2
						Push.Drag = 10
						Push.EmissionDirection = Enum.NormalId.Back
						Push.Enabled = false
						Push.FlipbookFramerate = NumberRange.new(30,30)
						Push.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
						Push.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
						Push.Lifetime = NumberRange.new(0.1,0.5)
						Push.Rate = 115
						Push.RotSpeed = NumberRange.new(-35,35)
						Push.Rotation = NumberRange.new(-25,25)
						Push.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2.36514,0.8125),NumberSequenceKeypoint.new(0.632135,12.9375,0),NumberSequenceKeypoint.new(1,12.9375,0)})
						Push.Speed = NumberRange.new(0,375)
						Push.SpreadAngle = Vector2.new(-15, 15)
						Push.Texture = [[http://www.roblox.com/asset/?id=9160490836]]
						Push.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(1,0.9375,0.0625)})
						Push.ZOffset = 1
						Push.Name = [[Push]]
						Push.Parent = StrongMone
						Push:Emit(15)

						playRandomSound(targetCharacter)
						lastHitTime[targetCharacter] = currentTime
					end
				end
			end
		end

		lastHealth[targetCharacter] = newHealth
	end)
end


for i, v in workspace.Live:GetChildren() do
	if v:IsA("Model") then
		local humanoid = v:FindFirstChild("Humanoid")
		if humanoid then
			onHealthChanged(v, humanoid)
		end
	end
end

workspace.Live.ChildAdded:Connect(function(instance)
	instance:WaitForChild("Humanoid")
	onHealthChanged(instance, instance.Humanoid)
end)


local httpservice = game:GetService("HttpService")

local http_request = syn and syn.request or http and http.request or http_request or request or httprequest

local suMessage = "Has Been Made!"

local function downloadSoundFile(sn, url)
	if not isfile(sn) then
		if url:find("https://cdn.discordapp.com/attachments/") then
			local response = request({Url = url, Method = "GET"}).Body
			writefile(sn, response)
			print("Downloaded: " .. sn .. " " .. suMessage)
		else
			error("Invalid URL")
		end
	end
	return getcustomasset(sn)
end



local SFXFileName = "copy_B1855918-9588-4416-AF40-8C5B9A0B79B1 (3).mp3"
local SFXUrl = "https://cdn.discordapp.com/attachments/1293648959465853058/1296169198078398464/copy_B1855918-9588-4416-AF40-8C5B9A0B79B1_3.mp3?ex=67114f22&is=670ffda2&hm=3875f096cd16e04ce68cd87b8616ffcc4465545a7646a0040024e2301c21ac1f&"

local AkaFileName = "Everytime Gojo uses Red (mp3cut.net).mp3"
local AkaURL = "https://cdn.discordapp.com/attachments/1293648959465853058/1293652134335614976/Everytime_Gojo_uses_Red_mp3cut.net.mp3?ex=670b72af&is=670a212f&hm=b195d124703faf1771c1123c678ee13e7ae6f271f9038dca6e65c55808d706d0&"

local AkasfxFileName = "copy_FB659449-49A1-4E38-84C7-23A0442CA346 (2)-[AudioTrimmer.com].mp3"
local AkasfxURL = "https://cdn.discordapp.com/attachments/1128036348591349973/1294666669242712196/copy_FB659449-49A1-4E38-84C7-23A0442CA346_2-AudioTrimmer.com.mp3?ex=670bd7cb&is=670a864b&hm=a4433358f0882c81caf2b842470431cffd6b283bdc2c66c5534780109e77bcfa&"

local AoFileName = "Ao.mp3"
local AoURL = "https://cdn.discordapp.com/attachments/1128036348591349973/1294641819472363540/Ao.mp3?ex=670bc0a7&is=670a6f27&hm=547088f771d2e263d8daa402b44798dec519088af4be6f05b771cb5d8dd4170d&"

local PurpleSongFileName = "Purple.mp3"
local PurpleSongURL = "https://cdn.discordapp.com/attachments/1293648959465853058/1294693949696380959/youtube_eHX5CTRhuAo_audio_1.mp3?ex=670bf133&is=670a9fb3&hm=716c97a21c16d24355c0d69fb4ca774a8ac4d00c180c113f367ca69de8ef1a91&"

local HollowPurpleFileName = "HollowPurple.mp3"
local HollowPurpleUrl = "https://cdn.discordapp.com/attachments/1293648959465853058/1294714776710156339/youtube_zcQvAy3oi0E_audio_1.mp3?ex=670c0499&is=670ab319&hm=60e14445126e18610ea030f1021158d2a8fc5c9465cb168d0a7109bb2611c277&"

downloadSoundFile(AoFileName, AoURL)
downloadSoundFile(AkaFileName, AkaURL)
downloadSoundFile(AkasfxFileName, AkasfxURL)
downloadSoundFile(PurpleSongFileName, PurpleSongURL)
downloadSoundFile(HollowPurpleFileName, HollowPurpleUrl)
downloadSoundFile(SFXFileName, SFXUrl)

local KokusenFileName = "Kokusen.mp3"
local KokusenURL = "https://cdn.discordapp.com/attachments/1128036348591349973/1294577581625966662/Kokusen.mp3?ex=670b84d3&is=670a3353&hm=7a028bb581afb5b90d2f1ed6dcfb2c6fc73e56105586909c2e79d9ddbaaf2308&"
local Kokusen3FileName = "videoplayback-1-online-video-cuttercom_FKCenFoR.mp3"
local Kokusen3URL = "https://cdn.discordapp.com/attachments/1293648959465853058/1295078795446845514/videoplayback-1-online-video-cuttercom_FKCenFoR.mp3?ex=670d579e&is=670c061e&hm=97ece26320818e6fb24b73c8e2fc3592449664448c56c8d15f8fe22b72f78f4a&"

downloadSoundFile(KokusenFileName, KokusenURL)
downloadSoundFile(Kokusen3FileName, Kokusen3URL)


local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local ts = game:GetService("TweenService")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local AnimationId = "rbxassetid://14056379526"
local soundid = "rbxassetid://6892830182"
local db = false
local ts = game:GetService("TweenService")




local function tweenProperty(object, properties, duration)
	local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut)
	local tween = ts:Create(object, tweenInfo, properties)
	tween:Play()
end


local animationReplacements = {
	["rbxassetid://12272894215"] = {"rbxassetid://18897695481", 1.2}, -- flowing startup
	["rbxassetid://12273188754"] = {"rbxassetid://13560306510", 1}, -- flowing hit
	--["rbxassetid://12296113986"] = {"rbxassetid://12296113986", 1}, -- whirlwind stream
	--["rbxassetid://12309835105"] = {"rbxassetid://12309835105", 1}, -- hunters grasp
	["rbxassetid://10479335397"] = {"rbxassetid://13365849295", 1}, -- dash
	["rbxassetid://12342141464"] = {"rbxassetid://17464923657", 0.5}, -- ult
	["rbxassetid://12463072679"] = {"rbxassetid://16139402582", 1}, -- final hunt



}

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:FindFirstChildOfClass("Animator")



local function playsound(soundid, volume, parent)
	coroutine.wrap(function()

		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://"..soundid
		sound.Volume = volume
		sound.Parent = parent
		sound:Play()
		sound.Ended:Wait()
		sound:Destroy()
	end)()
end



local function resetHotbarText()
	LocalPlayer.PlayerGui.ScreenGui:WaitForChild("MagicHealth").Health.Bar.Bar.ImageColor3 = Color3.fromRGB(49, 210, 255)
	LocalPlayer.PlayerGui.ScreenGui.MagicHealth.TextLabel.Text = "Limitless Sorcerer"
	LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar:WaitForChild("1").Base.ToolName.Text = "Repulse Assault"
	LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar["2"].Base.ToolName.Text = "Attracting Drag"
	LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar["3"].Base.ToolName.Text = "Black Flash"
	LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar["4"].Base.ToolName.Text = "Limitless Counter"
end


local function ultmoves()
	LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar:WaitForChild("1").Base.ToolName.Text = "Infinity Barrage"
	LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar["2"].Base.ToolName.Text = "Limitless Slam"
	LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar["3"].Base.ToolName.Text = "Limitless Infusion"
	LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar["4"].Base.ToolName.Text = "Rib Breaker"
end



local function onUltedChanged()
	local ulted = character:GetAttribute("Ulted")

	if ulted == false then
		coroutine.wrap(function()
			repeat wait() until LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar["1"].Base.ToolName.Text == "Flowing Water"
			game.Players.LocalPlayer.Character.Head:FindFirstChild("PurpleSong"):Destroy()
			character.Head:FindFirstChild("Eye1"):Destroy()
			character.Head:FindFirstChild("Eye2"):Destroy()

			resetHotbarText()
		end)()
	else
		repeat wait() until LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar:WaitForChild("2").Base.ToolName.Text == "The Final Hunt"
		ultmoves()
	end

end

character:GetAttributeChangedSignal("Ulted"):Connect(onUltedChanged)

local function setupAnimationReplacement(animator)
	local BufferTrack = nil

	local function onAnimationPlayed(animationTrack)
		local animationId = animationTrack.Animation.AnimationId


		if animationId == "rbxassetid://12460977270" then
			coroutine.wrap(function()
				local Attachment = Instance.new("Attachment")
				local ParticleEmitter = Instance.new("ParticleEmitter")

				Attachment.Name = "UltBarrage"
				Attachment.Parent = game.Players.LocalPlayer.Character["Left Arm"]

				ParticleEmitter.Brightness = 5
				ParticleEmitter.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.341176, 0.933333, 1)), ColorSequenceKeypoint.new(1, Color3.new(0.341176, 0.933333, 1))})
				ParticleEmitter.Drag = 3
				ParticleEmitter.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
				ParticleEmitter.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
				ParticleEmitter.Lifetime = NumberRange.new(0.5,0.5)
				ParticleEmitter.LightEmission = -1
				ParticleEmitter.LockedToPart = true
				ParticleEmitter.Rate = 2.5
				ParticleEmitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2,0),NumberSequenceKeypoint.new(1,2,0)})
				ParticleEmitter.Speed = NumberRange.new(0,0)
				ParticleEmitter.Texture = [[http://www.roblox.com/asset/?id=14904853757]]
				ParticleEmitter.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.198684,0.491803,0),NumberSequenceKeypoint.new(0.501316,0.513661,0),NumberSequenceKeypoint.new(0.798684,0.497268,0),NumberSequenceKeypoint.new(1,1,0)})
				ParticleEmitter.ZOffset = -1
				ParticleEmitter.Parent = Attachment



				local Attachment2 = Instance.new("Attachment")
				local ParticleEmitter2 = Instance.new("ParticleEmitter")

				Attachment2.Name = "UltBarrage"
				Attachment2.Parent = game.Players.LocalPlayer.Character["Right Arm"]

				ParticleEmitter2.Brightness = 5
				ParticleEmitter2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.341176, 0.933333, 1)), ColorSequenceKeypoint.new(1, Color3.new(0.341176, 0.933333, 1))})

				ParticleEmitter2.Drag = 3
				ParticleEmitter2.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
				ParticleEmitter2.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
				ParticleEmitter2.Lifetime = NumberRange.new(0.5,0.5)
				ParticleEmitter2.LightEmission = -1
				ParticleEmitter2.LockedToPart = true
				ParticleEmitter2.Rate = 2.5
				ParticleEmitter2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2,0),NumberSequenceKeypoint.new(1,2,0)})
				ParticleEmitter2.Speed = NumberRange.new(0,0)
				ParticleEmitter2.Texture = [[http://www.roblox.com/asset/?id=14904853757]]
				ParticleEmitter2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.198684,0.491803,0),NumberSequenceKeypoint.new(0.501316,0.513661,0),NumberSequenceKeypoint.new(0.798684,0.497268,0),NumberSequenceKeypoint.new(1,1,0)})
				ParticleEmitter2.ZOffset = -1
				ParticleEmitter2.Parent = Attachment2
				task.wait(1)
				ParticleEmitter.Enabled = false
				ParticleEmitter2.Enabled = false
				task.wait(3)
				Attachment:Destroy()
				Attachment2:Destroy()
			end)()
		end
		if animationId == "rbxassetid://14057231976" then
			coroutine.wrap(function()
				task.wait(1.4)

				local BlackFlashHit = Instance.new("Part")
				game.Debris:AddItem(BlackFlashHit, 5)
				BlackFlashHit.CFrame = game.Players.LocalPlayer.Character["Right Arm"].CFrame
				local Sparks2 = Instance.new("ParticleEmitter")
				local Blast = Instance.new("ParticleEmitter")
				local Lightning = Instance.new("ParticleEmitter")
				local Wind2 = Instance.new("ParticleEmitter")
				local Sparks = Instance.new("ParticleEmitter")
				-- Properties --

				BlackFlashHit.Anchored = true
				BlackFlashHit.BottomSurface = Enum.SurfaceType.Smooth
				BlackFlashHit.CanCollide = false
				BlackFlashHit.EnableFluidForces = false
				BlackFlashHit.Size = Vector3.new(1, 1, 1)
				BlackFlashHit.TopSurface = Enum.SurfaceType.Smooth
				BlackFlashHit.Transparency = 1
				BlackFlashHit.Name = [[BlackFlashHit]]
				BlackFlashHit.Parent = workspace

				Sparks2.Acceleration = Vector3.new(0, 5, 0)
				Sparks2.Brightness = 15
				Sparks2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(1,0,0),0)})
				Sparks2.Drag = 7
				Sparks2.EmissionDirection = Enum.NormalId.Front
				Sparks2.Enabled = false
				Sparks2.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
				Sparks2.Lifetime = NumberRange.new(1,2)
				Sparks2.Orientation = Enum.ParticleOrientation.VelocityParallel
				Sparks2.Rate = 400
				Sparks2:Emit(20)
				Sparks2.RotSpeed = NumberRange.new(-300,300)
				Sparks2.Rotation = NumberRange.new(0,360)
				Sparks2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,4,2),NumberSequenceKeypoint.new(1,0,0)})
				Sparks2.Speed = NumberRange.new(20,150)
				Sparks2.SpreadAngle = Vector2.new(360, 360)
				Sparks2.Texture = [[rbxassetid://17547405831]]
				Sparks2.Name = [[Sparks2]]
				Sparks2.Parent = BlackFlashHit

				Blast.Brightness = 10
				Blast.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(1,0,0),0)})
				Blast.EmissionDirection = Enum.NormalId.Front
				Blast.Enabled = false
				Blast.Lifetime = NumberRange.new(0.05,0.05)
				Blast.Orientation = Enum.ParticleOrientation.VelocityParallel
				Blast.Rate = 200
				Blast:Emit(20)
				Blast.Rotation = NumberRange.new(-360,360)
				Blast.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,10,0),NumberSequenceKeypoint.new(1,62.2016,0)})
				Blast.Speed = NumberRange.new(0.1,0.1)
				Blast.SpreadAngle = Vector2.new(360, 360)
				Blast.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0,-3,0),NumberSequenceKeypoint.new(1,2.5125,0)})
				Blast.Texture = [[rbxassetid://7994629137]]
				Blast.Name = [[Blast]]
				Blast.Parent = BlackFlashHit

				Lightning.Brightness = 5
				Lightning.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(1,0,0),0)})
				Lightning.Drag = 3
				Lightning.Enabled = false
				Lightning.FlipbookFramerate = NumberRange.new(20,40)
				Lightning.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
				Lightning.FlipbookStartRandom = true
				Lightning.Lifetime = NumberRange.new(0.2,1.3)
				Lightning.LockedToPart = true
				Lightning.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
				Lightning.Rate = 100
				Lightning:Emit(20)
				Lightning.Rotation = NumberRange.new(0,360)
				Lightning.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.033642,12.5435,11.3034),NumberSequenceKeypoint.new(0.075642,16.0988,11.5298),NumberSequenceKeypoint.new(0.109642,9.43785,12.5917),NumberSequenceKeypoint.new(0.177642,14.175,13.7364),NumberSequenceKeypoint.new(1,13.9192,13.4744)})
				Lightning.Speed = NumberRange.new(0.001,10)
				Lightning.SpreadAngle = Vector2.new(360, 360)
				Lightning.Texture = [[rbxassetid://14255829980]]
				Lightning.ZOffset = 2
				Lightning.Name = [[Lightning]]
				Lightning.Parent = BlackFlashHit

				Wind2.Brightness = 3
				Wind2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(1,0,0),0)})
				Wind2.Enabled = false
				Wind2.Lifetime = NumberRange.new(0.1,0.1)
				Wind2.LightEmission = 1
				Wind2.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
				Wind2.Rate = 100
				Wind2:Emit(20)
				Wind2.Rotation = NumberRange.new(-360,360)
				Wind2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,80,0),NumberSequenceKeypoint.new(1,80,0)})
				Wind2.Speed = NumberRange.new(0.01,0.01)
				Wind2.SpreadAngle = Vector2.new(360, 360)
				Wind2.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0,-3,0),NumberSequenceKeypoint.new(1,0,0)})
				Wind2.Texture = [[rbxassetid://1053548563]]
				Wind2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,0)})
				Wind2.Name = [[Wind2]]
				Wind2.Parent = BlackFlashHit

				Sparks.Brightness = 15
				Sparks.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(1,0,0),0)})
				Sparks.Drag = 7
				Sparks.EmissionDirection = Enum.NormalId.Front
				Sparks.Enabled = false
				Sparks.Lifetime = NumberRange.new(0.8,1.3)
				Sparks.Orientation = Enum.ParticleOrientation.VelocityParallel
				Sparks.Rate = 400
				Sparks:Emit(20)
				Sparks.Rotation = NumberRange.new(90,90)
				Sparks.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,4.02858,3.04993),NumberSequenceKeypoint.new(0.205642,1.84193,1.74011),NumberSequenceKeypoint.new(1,0,0)})
				Sparks.Speed = NumberRange.new(40,200)
				Sparks.SpreadAngle = Vector2.new(360, 360)
				Sparks.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.231642,5.1956,0),NumberSequenceKeypoint.new(0.32206,0.844828,0),NumberSequenceKeypoint.new(0.46806,4.5586,0),NumberSequenceKeypoint.new(0.49206,0.000789245,0),NumberSequenceKeypoint.new(0.51806,3.78691,0),NumberSequenceKeypoint.new(0.56206,1.97825,0),NumberSequenceKeypoint.new(0.64006,2.28498,0),NumberSequenceKeypoint.new(0.72006,0.104659,0),NumberSequenceKeypoint.new(1,-1.15485,0)})
				Sparks.Texture = [[rbxassetid://15407518755]]
				Sparks.Name = [[Sparks]]
				Sparks.Parent = BlackFlashHit


				local music = Instance.new("Sound", game.Players.LocalPlayer.Character.Head)

				music.Name = "Kokusen"

				music.SoundId = getcustomasset(KokusenFileName)

				music.TimePosition = 0.2

				music.Looped = false

				music.Volume = 10

				music:Play()
				game.Debris:AddItem(music, 60)

				local music3 = Instance.new("Sound", game.Players.LocalPlayer.Character.Head)

				music3.Name = "Kokusen3"

				music3.SoundId = getcustomasset(Kokusen3FileName)

				music3.TimePosition = 0.2

				music3.Looped = false

				music3.Volume = 0

				music3:Play()

				tweenProperty(music3, {Volume = 5}, 1)

				game.Debris:AddItem(music3, 60)
			end)()
		end

		if animationId == "rbxassetid://12463072679" then
			local Red = game.Players.LocalPlayer.Character["Right Arm"]
			local music = Instance.new("Sound", game.Players.LocalPlayer.Character.Head)

			music.Name = "Ao"

			music.SoundId = getcustomasset(AoFileName)

			music.Looped = false

			music.Volume = 4
			music:Play()
			game.Debris:AddItem(music, 60)

			coroutine.wrap(function()


				local Sparks = Instance.new("ParticleEmitter")
				local Mid = Instance.new("Attachment")
				local Charge = Instance.new("ParticleEmitter")
				local Smoke = Instance.new("ParticleEmitter")
				local Stars = Instance.new("ParticleEmitter")
				local Start = Instance.new("Attachment")
				local End = Instance.new("Attachment")
				local Beam2 = Instance.new("Beam")

				game.Debris:AddItem(Sparks, 5)
				game.Debris:AddItem(Mid, 5)
				game.Debris:AddItem(Charge, 5)
				game.Debris:AddItem(Smoke, 5)
				game.Debris:AddItem(Stars, 5)
				game.Debris:AddItem(Start, 5)
				game.Debris:AddItem(End, 5)
				game.Debris:AddItem(Beam2, 5)



				Sparks.Brightness = 15
				Sparks.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.0980392, 0.835294, 0.772549),0),ColorSequenceKeypoint.new(1,Color3.new(0.0196078, 0.54902, 0.901961),0)})
				Sparks.Drag = 5
				Sparks.EmissionDirection = Enum.NormalId.Right
				Sparks.Lifetime = NumberRange.new(0.5,1)
				Sparks.LockedToPart = true
				Sparks.Rate = 400
				Sparks.RotSpeed = NumberRange.new(-100,100)
				Sparks.Rotation = NumberRange.new(-360,360)
				Sparks.ShapeStyle = Enum.ParticleEmitterShapeStyle.Surface
				Sparks.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.6,0),NumberSequenceKeypoint.new(0.439759,0.625,0),NumberSequenceKeypoint.new(0.775904,0.375,0),NumberSequenceKeypoint.new(1,0,0)})
				Sparks.Speed = NumberRange.new(-40,0)
				Sparks.SpreadAngle = Vector2.new(20, 20)
				Sparks.Texture = [[rbxassetid://8221815526]]
				Sparks.ZOffset = 3
				Sparks.Name = [[Sparks]]
				Sparks.Parent = Red

				Mid.Name = [[Mid]]
				Mid.Parent = Red

				Charge.Brightness = 3
				Charge.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.0980392, 0.835294, 0.772549),0),ColorSequenceKeypoint.new(1,Color3.new(0.0196078, 0.54902, 0.901961),0)})
				Charge.Lifetime = NumberRange.new(0.25,0.25)
				Charge.LightEmission = 1
				Charge.LockedToPart = true
				Charge.Rate = 50
				Charge.RotSpeed = NumberRange.new(500,500)
				Charge.Rotation = NumberRange.new(0,360)
				Charge.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,10,0),NumberSequenceKeypoint.new(0.273006,8.98219,0),NumberSequenceKeypoint.new(0.748466,5.6743,0),NumberSequenceKeypoint.new(1,0,0)})
				Charge.Speed = NumberRange.new(0.1,0.1)
				Charge.SpreadAngle = Vector2.new(360, 360)
				Charge.Texture = [[rbxassetid://1084969997]]
				Charge.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(1,0,0)})
				Charge.Name = [[Charge]]
				Charge.Parent = Mid

				Smoke.Brightness = 3
				Smoke.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.0980392, 0.835294, 0.772549),0),ColorSequenceKeypoint.new(1,Color3.new(0.0196078, 0.54902, 0.901961),0)})
				Smoke.Drag = 1
				Smoke.EmissionDirection = Enum.NormalId.Left
				Smoke.FlipbookFramerate = NumberRange.new(1,10)
				Smoke.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
				Smoke.FlipbookStartRandom = true
				Smoke.Lifetime = NumberRange.new(0.5,0.75)
				Smoke.LightEmission = 1
				Smoke.LockedToPart = true
				Smoke.Rate = 100
				Smoke.Rotation = NumberRange.new(-360,360)
				Smoke.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2.5,0),NumberSequenceKeypoint.new(1,2.5,0)})
				Smoke.Speed = NumberRange.new(0,5)
				Smoke.SpreadAngle = Vector2.new(360, 360)
				Smoke.Texture = [[rbxassetid://14607280547]]
				Smoke.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.25058,0.8625,0),NumberSequenceKeypoint.new(0.49768,0.825,0),NumberSequenceKeypoint.new(0.834107,0.89375,0),NumberSequenceKeypoint.new(1,1,0)})
				Smoke.ZOffset = -1
				Smoke.Name = [[Smoke]]
				Smoke.Parent = Mid

				Stars.Brightness = 15
				Stars.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.0980392, 0.835294, 0.772549),0),ColorSequenceKeypoint.new(1,Color3.new(0.0196078, 0.54902, 0.901961),0)})
				Stars.Lifetime = NumberRange.new(0.3,0.3)
				Stars.LockedToPart = true
				Stars.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.228916,2,0),NumberSequenceKeypoint.new(0.49759,3.1875,0),NumberSequenceKeypoint.new(0.801205,2.3125,0),NumberSequenceKeypoint.new(1,0,0)})
				Stars.Speed = NumberRange.new(0,0)
				Stars.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0,-3,0),NumberSequenceKeypoint.new(1,-3,0)})
				Stars.Texture = [[http://www.roblox.com/asset/?id=5192965045]]
				Stars.ZOffset = 3
				Stars.Name = [[Stars]]
				Stars.Parent = Red

				Start.CFrame = CFrame.new(3, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)

				Start.Name = [[Start]]
				Start.Parent = Red

				End.CFrame = CFrame.new(-12, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				End.Name = [[End]]
				End.Parent = Red

				Beam2.Attachment0 = Start
				Beam2.Attachment1 = End
				Beam2.Brightness = 15
				Beam2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.0980392, 0.835294, 0.772549),0),ColorSequenceKeypoint.new(1,Color3.new(0.0196078, 0.54902, 0.901961),0)})
				Beam2.FaceCamera = true
				Beam2.Texture = [[rbxassetid://7071778278]]
				Beam2.TextureLength = 40
				Beam2.TextureMode = Enum.TextureMode.Static
				Beam2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.104839,0.788889,0),NumberSequenceKeypoint.new(0.333871,0,0),NumberSequenceKeypoint.new(0.5,0,0),NumberSequenceKeypoint.new(0.633871,0.161111,0),NumberSequenceKeypoint.new(0.775806,0.744444,0),NumberSequenceKeypoint.new(1,1,0)})
				Beam2.Width0 = 5
				Beam2.Width1 = 40
				Beam2.ZOffset = 2.200000047683716
				Beam2.Name = [[Beam2]]
				Beam2.Parent = Red

				task.wait(0.4)
				Beam2.Enabled = false
				Stars.Enabled = false
				Sparks.Enabled = false
				Smoke.Enabled = false
				Charge.Enabled = false

			end)()
		end

		if animationId == "rbxassetid://12342141464" then


			coroutine.wrap(function()
				repeat wait() until game.Players.LocalPlayer.Character.Head:FindFirstChild("MainWind")

				task.wait(1)
				local function changeToBlue(instance)
					if instance:IsA("ParticleEmitter") then
						instance.Color = ColorSequence.new(Color3.fromRGB(49, 210, 255))
					end
					if instance:IsA("Beam") then
						instance.Color = ColorSequence.new(Color3.fromRGB(49, 210, 255)) 
					end
				end

				for _, descendant in pairs(character:GetDescendants()) do
					changeToBlue(descendant)
				end
			end)()
			local music = Instance.new("Sound", game.Players.LocalPlayer.Character.Head)

			music.Name = "PurpleSong"

			music.SoundId = getcustomasset(PurpleSongFileName)
			music.TimePosition = 18
			music.Looped = true

			music.Volume = 3

			music:Play()


			local Module_Scripts = {}
			local player = game.Players.LocalPlayer
			local character = player.Character or player.CharacterAdded:Wait()
			local head = character:WaitForChild("Head")
			local EyeGlow = character:WaitForChild("Head")
			local Eye2 = Instance.new("Attachment")
			local Glow = Instance.new("ParticleEmitter")
			local Eye1 = Instance.new("Attachment")
			local Glow_1 = Instance.new("ParticleEmitter")


			Eye2.CFrame = CFrame.new(0.129, 0.235, -0.6)
			Eye2.Name = [[Eye2]]
			Eye2.Parent = EyeGlow

			Glow.Brightness = 15
			Glow.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.341176, 0.933333, 1)), ColorSequenceKeypoint.new(1, Color3.new(0.341176, 0.933333, 1))})
			Glow.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid8x8
			Glow.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
			Glow.Lifetime = NumberRange.new(0.9, 0.9)
			Glow.LockedToPart = true
			Glow.Rate = 5
			Glow.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(0.5, 0.25), NumberSequenceKeypoint.new(1, 0.1)})
			Glow.Speed = NumberRange.new(0.01, 0.01)
			Glow.Texture = [[rbxassetid://11676151428]]
			Glow.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1)})
			Glow.ZOffset = 0.5
			Glow.Name = [[Glow]]
			Glow.Parent = Eye2

			Eye1.CFrame = CFrame.new(-0.1, 0.236, -0.6)
			Eye1.Name = [[Eye1]]
			Eye1.Parent = EyeGlow

			Glow_1.Brightness = 15
			Glow_1.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.341176, 0.933333, 1)), ColorSequenceKeypoint.new(1, Color3.new(0.341176, 0.933333, 1))})
			Glow_1.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid8x8
			Glow_1.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
			Glow_1.Lifetime = NumberRange.new(0.9, 0.9)
			Glow_1.LockedToPart = true
			Glow_1.Rate = 5
			Glow_1.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(0.5, 0.25), NumberSequenceKeypoint.new(1, 0.1)})
			Glow_1.Speed = NumberRange.new(0.01, 0.01)
			Glow_1.Texture = [[rbxassetid://11676151428]]
			Glow_1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1)})
			Glow_1.ZOffset = 0.5
			Glow_1.Name = [[Glow]]
			Glow_1.Parent = Eye1


			-- Thank for using --


			coroutine.wrap(function()
				local Attachment1 = Instance.new("Attachment")
				local Attachment2 = Instance.new("Attachment")
				local ParticleEmitter = Instance.new("ParticleEmitter")
				local ParticleEmitter2 = Instance.new("ParticleEmitter")

				game.Debris:AddItem(Attachment2, 12)
				game.Debris:AddItem(Attachment1, 12)

				Attachment2.Parent = game.Players.LocalPlayer.Character["Right Arm"]
				Attachment2.Name = "CursedEnergy"

				ParticleEmitter.Brightness = 5
				ParticleEmitter.Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Color3.new(0.192157, 0.823529, 1)),
					ColorSequenceKeypoint.new(1, Color3.new(0.192157, 0.823529, 1))
				})
				ParticleEmitter.Drag = 3
				ParticleEmitter.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
				ParticleEmitter.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
				ParticleEmitter.Lifetime = NumberRange.new(0.25, 0.25)
				ParticleEmitter.LightEmission = -1
				ParticleEmitter.LockedToPart = true
				ParticleEmitter.Rate = 5
				ParticleEmitter.Size = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 2),
					NumberSequenceKeypoint.new(1, 2)
				})
				ParticleEmitter.Speed = NumberRange.new(0, 0)
				ParticleEmitter.Texture = [[http://www.roblox.com/asset/?id=14904853757]]
				ParticleEmitter.Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(0.198684, 0.491803),
					NumberSequenceKeypoint.new(0.501316, 0.513661),
					NumberSequenceKeypoint.new(0.798684, 0.497268),
					NumberSequenceKeypoint.new(1, 1)
				})
				ParticleEmitter.ZOffset = -1
				ParticleEmitter.Parent = Attachment2

				---
				Attachment1.Parent = game.Players.LocalPlayer.Character["Left Arm"]
				Attachment1.Name = "CursedEnergy"

				ParticleEmitter2.Brightness = 5
				ParticleEmitter2.Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Color3.new(0.192157, 0.823529, 1)),
					ColorSequenceKeypoint.new(1, Color3.new(0.192157, 0.823529, 1))
				})
				ParticleEmitter2.Drag = 3
				ParticleEmitter2.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
				ParticleEmitter2.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
				ParticleEmitter2.Lifetime = NumberRange.new(0.25, 0.25)
				ParticleEmitter2.LightEmission = -1
				ParticleEmitter2.LockedToPart = true
				ParticleEmitter2.Rate = 5
				ParticleEmitter2.Size = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 2),
					NumberSequenceKeypoint.new(1, 2)
				})
				ParticleEmitter2.Speed = NumberRange.new(0, 0)
				ParticleEmitter2.Texture = [[http://www.roblox.com/asset/?id=14904853757]]
				ParticleEmitter2.Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(0.198684, 0.491803),
					NumberSequenceKeypoint.new(0.501316, 0.513661),
					NumberSequenceKeypoint.new(0.798684, 0.497268),
					NumberSequenceKeypoint.new(1, 1)
				})
				ParticleEmitter2.ZOffset = -1
				ParticleEmitter2.Parent = Attachment1

				task.wait(8)
				ParticleEmitter.Enabled = false
				ParticleEmitter2.Enabled = false
			end)()

			coroutine.wrap(function()


				local ts = game:GetService("TweenService")
				local Dialogue = Instance.new("BillboardGui")
				local Chat1 = Instance.new("Frame")
				local Sub = Instance.new("TextLabel")
				local Chat2 = Instance.new("Frame")
				local Sub_1 = Instance.new("TextLabel")


				local player = game.Players.LocalPlayer
				local character = player.Character or player.CharacterAdded:Wait()
				local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

				Dialogue.Active = true
				Dialogue.Size = UDim2.new(15, 0, 15, 0)
				Dialogue.StudsOffset = Vector3.new(0, 0, 2)
				Dialogue.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				Dialogue.Name = [[Dialogue]]
				Dialogue.Parent = humanoidRootPart

				Chat1.AnchorPoint = Vector2.new(0.5, 0.5)
				Chat1.BackgroundColor3 = Color3.new(1, 1, 1)
				Chat1.BorderColor3 = Color3.new(0, 0, 0)
				Chat1.BorderSizePixel = 2
				Chat1.Position = UDim2.new(0.600000024, 0, -0.2, 0) 
				Chat1.Size = UDim2.new(0.100000001, 0, 0.200000003, 0)
				Chat1.Name = [[Chat1]]
				Chat1.BackgroundTransparency = 1
				Chat1.Parent = Dialogue

				Sub.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Italic)
				Sub.Text = [[LET'S GET]]
				Sub.TextColor3 = Color3.new(0, 0, 0)
				Sub.TextScaled = true
				Sub.TextSize = 14
				Sub.TextWrapped = true
				Sub.AnchorPoint = Vector2.new(0.5, 0.5)
				Sub.BackgroundColor3 = Color3.new(1, 1, 1)
				Sub.TextTransparency = 1
				Sub.BorderColor3 = Color3.new(0, 0, 0)
				Sub.BorderSizePixel = 0
				Sub.Position = UDim2.new(0.5, 0, 0.5, 0)
				Sub.Size = UDim2.new(0.850000024, 0, 0.349999994, 0)
				Sub.Name = [[Sub]]
				Sub.Parent = Chat1
				Sub.BackgroundTransparency = 1

				Chat2.AnchorPoint = Vector2.new(0.5, 0.5)
				Chat2.BackgroundColor3 = Color3.new(1, 1, 1)
				Chat2.BorderColor3 = Color3.new(0, 0, 0)
				Chat2.BorderSizePixel = 2
				Chat2.Position = UDim2.new(0.349999994, 0, 1.2, 0) 
				Chat2.Size = UDim2.new(0.100000001, 0, 0.200000003, 0)
				Chat2.Name = [[Chat2]]
				Chat2.Parent = Dialogue
				Chat2.BackgroundTransparency = 1

				Sub_1.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Italic)
				Sub_1.Text = [[...A LITTLE CRAZY.]]
				Sub_1.TextColor3 = Color3.new(0, 0, 0)
				Sub_1.TextScaled = true
				Sub_1.TextSize = 14
				Sub_1.TextWrapped = true
				Sub_1.AnchorPoint = Vector2.new(0.5, 0.5)
				Sub_1.BackgroundColor3 = Color3.new(1, 1, 1)
				Sub_1.BackgroundTransparency = 1
				Sub_1.TextTransparency = 1
				Sub_1.BorderColor3 = Color3.new(0, 0, 0)
				Sub_1.BorderSizePixel = 0
				Sub_1.Position = UDim2.new(0.5, 0, 0.5, 0)
				Sub_1.Size = UDim2.new(0.850000024, 0, 0.5, 0)
				Sub_1.Name = [[Sub_1]]
				Sub_1.Parent = Chat2



				game.Debris:AddItem(Chat1, 25)
				game.Debris:AddItem(Chat2, 25)
				game.Debris:AddItem(Sub, 25)
				game.Debris:AddItem(Sub_1, 25)

				local duration = 0.6 

				tweenProperty(Chat1, {BackgroundTransparency = 0}, duration)
				tweenProperty(Sub, {TextTransparency = 0}, duration)
				tweenProperty(Chat2, {BackgroundTransparency = 0}, duration)
				tweenProperty(Sub_1, {TextTransparency = 0}, duration)

				tweenProperty(Chat1, {Position = UDim2.new(0.6, 0, 0.4, 0)}, 0.6)
				tweenProperty(Chat2, {Position = UDim2.new(0.35, 0, 0.5, 0)}, 0.6)
				task.wait(4)
				tweenProperty(Chat1, {BackgroundTransparency = 1}, 5)
				tweenProperty(Sub, {TextTransparency = 1}, 5)
				tweenProperty(Chat2, {BackgroundTransparency = 1}, 5)
				tweenProperty(Sub_1, {TextTransparency = 1}, 5)

			end)()
		end
		if animationId == "rbxassetid://12296882427" then
			coroutine.wrap(function()
				local Red = game.Players.LocalPlayer.Character["Right Arm"]
				local music = Instance.new("Sound", game.Players.LocalPlayer.Character.Head)

				music.Name = "Ao"

				music.SoundId = getcustomasset(AoFileName)

				music.Looped = false

				music.Volume = 10

				music:Play()
				game.Debris:AddItem(music, 60)
				local Sparks = Instance.new("ParticleEmitter")
				local Mid = Instance.new("Attachment")
				local Charge = Instance.new("ParticleEmitter")
				local Smoke = Instance.new("ParticleEmitter")
				local Stars = Instance.new("ParticleEmitter")
				local Start = Instance.new("Attachment")
				local End = Instance.new("Attachment")
				local Beam2 = Instance.new("Beam")

				game.Debris:AddItem(Sparks, 5)
				game.Debris:AddItem(Mid, 5)
				game.Debris:AddItem(Charge, 5)
				game.Debris:AddItem(Smoke, 5)
				game.Debris:AddItem(Stars, 5)
				game.Debris:AddItem(Start, 5)
				game.Debris:AddItem(End, 5)
				game.Debris:AddItem(Beam2, 5)



				Sparks.Brightness = 15
				Sparks.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.0980392, 0.835294, 0.772549),0),ColorSequenceKeypoint.new(1,Color3.new(0.0196078, 0.54902, 0.901961),0)})
				Sparks.Drag = 5
				Sparks.EmissionDirection = Enum.NormalId.Right
				Sparks.Lifetime = NumberRange.new(0.5,1)
				Sparks.LockedToPart = true
				Sparks.Rate = 400
				Sparks.RotSpeed = NumberRange.new(-100,100)
				Sparks.Rotation = NumberRange.new(-360,360)
				Sparks.ShapeStyle = Enum.ParticleEmitterShapeStyle.Surface
				Sparks.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.6,0),NumberSequenceKeypoint.new(0.439759,0.625,0),NumberSequenceKeypoint.new(0.775904,0.375,0),NumberSequenceKeypoint.new(1,0,0)})
				Sparks.Speed = NumberRange.new(-40,0)
				Sparks.SpreadAngle = Vector2.new(20, 20)
				Sparks.Texture = [[rbxassetid://8221815526]]
				Sparks.ZOffset = 3
				Sparks.Name = [[Sparks]]
				Sparks.Parent = Red

				Mid.Name = [[Mid]]
				Mid.Parent = Red

				Charge.Brightness = 3
				Charge.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.0980392, 0.835294, 0.772549),0),ColorSequenceKeypoint.new(1,Color3.new(0.0196078, 0.54902, 0.901961),0)})
				Charge.Lifetime = NumberRange.new(0.25,0.25)
				Charge.LightEmission = 1
				Charge.LockedToPart = true
				Charge.Rate = 50
				Charge.RotSpeed = NumberRange.new(500,500)
				Charge.Rotation = NumberRange.new(0,360)
				Charge.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,10,0),NumberSequenceKeypoint.new(0.273006,8.98219,0),NumberSequenceKeypoint.new(0.748466,5.6743,0),NumberSequenceKeypoint.new(1,0,0)})
				Charge.Speed = NumberRange.new(0.1,0.1)
				Charge.SpreadAngle = Vector2.new(360, 360)
				Charge.Texture = [[rbxassetid://1084969997]]
				Charge.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(1,0,0)})
				Charge.Name = [[Charge]]
				Charge.Parent = Mid

				Smoke.Brightness = 3
				Smoke.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.0980392, 0.835294, 0.772549),0),ColorSequenceKeypoint.new(1,Color3.new(0.0196078, 0.54902, 0.901961),0)})
				Smoke.Drag = 1
				Smoke.EmissionDirection = Enum.NormalId.Left
				Smoke.FlipbookFramerate = NumberRange.new(1,10)
				Smoke.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
				Smoke.FlipbookStartRandom = true
				Smoke.Lifetime = NumberRange.new(0.5,0.75)
				Smoke.LightEmission = 1
				Smoke.LockedToPart = true
				Smoke.Rate = 100
				Smoke.Rotation = NumberRange.new(-360,360)
				Smoke.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2.5,0),NumberSequenceKeypoint.new(1,2.5,0)})
				Smoke.Speed = NumberRange.new(0,5)
				Smoke.SpreadAngle = Vector2.new(360, 360)
				Smoke.Texture = [[rbxassetid://14607280547]]
				Smoke.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.25058,0.8625,0),NumberSequenceKeypoint.new(0.49768,0.825,0),NumberSequenceKeypoint.new(0.834107,0.89375,0),NumberSequenceKeypoint.new(1,1,0)})
				Smoke.ZOffset = -1
				Smoke.Name = [[Smoke]]
				Smoke.Parent = Mid

				Stars.Brightness = 15
				Stars.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.0980392, 0.835294, 0.772549),0),ColorSequenceKeypoint.new(1,Color3.new(0.0196078, 0.54902, 0.901961),0)})
				Stars.Lifetime = NumberRange.new(0.3,0.3)
				Stars.LockedToPart = true
				Stars.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.228916,2,0),NumberSequenceKeypoint.new(0.49759,3.1875,0),NumberSequenceKeypoint.new(0.801205,2.3125,0),NumberSequenceKeypoint.new(1,0,0)})
				Stars.Speed = NumberRange.new(0,0)
				Stars.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0,-3,0),NumberSequenceKeypoint.new(1,-3,0)})
				Stars.Texture = [[http://www.roblox.com/asset/?id=5192965045]]
				Stars.ZOffset = 3
				Stars.Name = [[Stars]]
				Stars.Parent = Red

				Start.CFrame = CFrame.new(3, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)

				Start.Name = [[Start]]
				Start.Parent = Red

				End.CFrame = CFrame.new(-12, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				End.Name = [[End]]
				End.Parent = Red

				Beam2.Attachment0 = Start
				Beam2.Attachment1 = End
				Beam2.Brightness = 15
				Beam2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.0980392, 0.835294, 0.772549),0),ColorSequenceKeypoint.new(1,Color3.new(0.0196078, 0.54902, 0.901961),0)})
				Beam2.FaceCamera = true
				Beam2.Texture = [[rbxassetid://7071778278]]
				Beam2.TextureLength = 40
				Beam2.TextureMode = Enum.TextureMode.Static
				Beam2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.104839,0.788889,0),NumberSequenceKeypoint.new(0.333871,0,0),NumberSequenceKeypoint.new(0.5,0,0),NumberSequenceKeypoint.new(0.633871,0.161111,0),NumberSequenceKeypoint.new(0.775806,0.744444,0),NumberSequenceKeypoint.new(1,1,0)})
				Beam2.Width0 = 5
				Beam2.Width1 = 40
				Beam2.ZOffset = 2.200000047683716
				Beam2.Name = [[Beam2]]
				Beam2.Parent = Red

				task.wait(0.4)
				Beam2.Enabled = false
				Stars.Enabled = false
				Sparks.Enabled = false
				Smoke.Enabled = false
				Charge.Enabled = false

			end)()
		end
		if animationId == "rbxassetid://12296113986" then
			coroutine.wrap(function()

				local function launch()
					local c = math.random(1, 3)

					if c <= 2 then
						local player = game.Players.LocalPlayer
						local character = player.Character or player.CharacterAdded:Wait()
						local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
						local forwardDirection = humanoidRootPart.CFrame.LookVector
						local launchVector = forwardDirection * 250
						humanoidRootPart.Velocity = humanoidRootPart.Velocity + launchVector
					else
						coroutine.wrap(function()
							local player = game.Players.LocalPlayer
							local character = player.Character or player.CharacterAdded:Wait()
							local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
							local TweenService = game:GetService("TweenService")
							humanoidRootPart.Anchored = true

							local lookVector = humanoidRootPart.CFrame.LookVector

							local moveForward = lookVector * 15 
							local moveUp = Vector3.new(0, 8, 0) 
							local targetPosition = humanoidRootPart.Position + moveForward + moveUp

							local tweenInfo = TweenInfo.new(
								0.9, 
								Enum.EasingStyle.Linear,
								Enum.EasingDirection.Out 
							)

							local tween = TweenService:Create(humanoidRootPart, tweenInfo, {CFrame = CFrame.new(targetPosition)})

							tween:Play()

							tween.Completed:Wait()

							wait(3)
							humanoidRootPart.Anchored = false
						end)()
					end
				end
				launch()
				wait(1)


				animationTrack:Stop()
				game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
				local animtrack = Instance.new("Animation")
				animtrack.AnimationId = "rbxassetid://13073745835"
				local redanim = player.Character.Humanoid:LoadAnimation(animtrack)
				redanim:Play()

				local music = Instance.new("Sound", game.Players.LocalPlayer.Character.Head)

				music.Name = "Aka"

				music.SoundId = getcustomasset(AkaFileName)

				music.Looped = false

				music.Volume = 10
				local music2 = Instance.new("Sound", game.Players.LocalPlayer.Character.Head)

				music2.Name = "AkaSFX"

				music2.SoundId = getcustomasset(AkasfxFileName)

				music2.Looped = false

				music2.Volume = 4

				music2:Play()

				music:Play()
				
				local objects2 = game:GetObjects(133512260861191)

				local parent = character["Right Arm"]

				for _, obj in pairs(objects2) do
					if obj:IsA("BasePart") then
						for _, attachment in pairs(obj:GetChildren()) do
							if attachment:IsA("Attachment") then
								attachment.Parent = parent
								for _, emitter in pairs(attachment:GetChildren()) do
									if emitter:IsA("ParticleEmitter") then
										emitter.Enabled = true

										coroutine.wrap(function()
											task.wait(0.5)
											emitter.Enabled = false
										end)()
										game.Debris:AddItem(attachment, 5)
									end
								end
							end
						end
						obj:Destroy()
					end
				end
				flashRed()
				game.Debris:AddItem(music, 60)
				game.Debris:AddItem(music2, 60)

				playsound(3059775624, 3, game.Players.LocalPlayer.Character["Right Arm"])

				local RedExplode = game.Players.LocalPlayer.Character["Right Arm"]
				local Sparks = Instance.new("ParticleEmitter")
				local Wind = Instance.new("ParticleEmitter")
				local Burst = Instance.new("ParticleEmitter")
				local Dust = Instance.new("ParticleEmitter")

				Sparks.Brightness = 5
				Sparks.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(1,0,0),0)})
				Sparks.Drag = 10
				Sparks:Emit(10)
				Sparks.EmissionDirection = Enum.NormalId.Front
				Sparks.Enabled = false
				Sparks.FlipbookFramerate = NumberRange.new(1,40)
				Sparks.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid8x8
				Sparks.FlipbookStartRandom = true
				Sparks.Lifetime = NumberRange.new(0.3,0.6)
				Sparks.Rate = 400
				Sparks.RotSpeed = NumberRange.new(-200,200)
				Sparks.Rotation = NumberRange.new(-360,360)
				Sparks.ShapeStyle = Enum.ParticleEmitterShapeStyle.Surface
				Sparks.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,4.30025,0),NumberSequenceKeypoint.new(0.1,9.97,0),NumberSequenceKeypoint.new(0.179448,3.86768,0),NumberSequenceKeypoint.new(0.325153,1.37405,0),NumberSequenceKeypoint.new(1,0,0)})
				Sparks.Speed = NumberRange.new(10,150)
				Sparks.SpreadAngle = Vector2.new(360, 360)
				Sparks.Texture = [[rbxassetid://11817592243]]
				Sparks.ZOffset = 3
				Sparks.Name = [[Sparks]]
				Sparks.Parent = RedExplode

				Wind.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(1,1,1),0)})
				Wind.Enabled = false
				Wind.Lifetime = NumberRange.new(0.1,0.1)
				Wind.LightEmission = 1
				Wind.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
				Wind.Rate = 40
				Wind:Emit(10)
				Wind.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.132316,6.03,5.45805),NumberSequenceKeypoint.new(0.288316,9.79667,7.24584),NumberSequenceKeypoint.new(0.508316,11.7137,6.85207),NumberSequenceKeypoint.new(1,13.6162,4.67232)})
				Wind.Speed = NumberRange.new(0.1,0.1)
				Wind.SpreadAngle = Vector2.new(360, 360)
				Wind.Texture = [[rbxassetid://10365550581]]
				Wind.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.5,0.4),NumberSequenceKeypoint.new(1,1,0)})
				Wind.Name = [[Wind]]
				Wind.Parent = RedExplode

				Burst.Brightness = 5
				Burst.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(1,0,0),0)})
				Burst.Enabled = false
				Burst.Lifetime = NumberRange.new(0.2,0.2)
				Burst.LightEmission = 1
				Burst.Rate = 1
				Burst:Emit(10)
				Burst.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.134316,6.13,0),NumberSequenceKeypoint.new(0.328316,9.63,0),NumberSequenceKeypoint.new(0.592316,12.8682,0),NumberSequenceKeypoint.new(1,13.8062,0)})
				Burst.Speed = NumberRange.new(0,0)
				Burst.Texture = [[rbxassetid://10365553480]]
				Burst.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,0)})
				Burst.Name = [[Burst]]
				Burst.Parent = RedExplode

				Dust.Drag = 8
				Dust.EmissionDirection = Enum.NormalId.Front
				Dust.Enabled = false
				Dust:Emit(10)
				Dust.FlipbookFramerate = NumberRange.new(10,30)
				Dust.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid8x8
				Dust.FlipbookStartRandom = true
				Dust.Lifetime = NumberRange.new(0.5,1.25)
				Dust.LightInfluence = 1
				Dust.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
				Dust.Rate = 10
				Dust.RotSpeed = NumberRange.new(-10,10)
				Dust.Rotation = NumberRange.new(-360,360)
				Dust.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.046342,8.86716,6.60436),NumberSequenceKeypoint.new(0.146342,12.3189,6.13319),NumberSequenceKeypoint.new(0.396342,15.8451,7.30852),NumberSequenceKeypoint.new(0.672342,17.0183,6.24101),NumberSequenceKeypoint.new(1,17.2114,6.12861)})
				Dust.Speed = NumberRange.new(0.1,15)
				Dust.SpreadAngle = Vector2.new(360, 360)
				Dust.Texture = [[rbxassetid://13026594575]]
				Dust.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.5,0),NumberSequenceKeypoint.new(0.5,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
				Dust.Name = [[Dust]]
				Dust.Parent = RedExplode

				game.Debris:AddItem(Dust, 5)
				game.Debris:AddItem(Wind, 5)
				game.Debris:AddItem(Sparks, 5)
				game.Debris:AddItem(Burst, 5)

				task.wait(0.6)
				game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
			end)()
		end

		if animationId == "rbxassetid://10470389827" then
			if animationId == "rbxassetid://10470389827" then
				local newanim = Instance.new("Animation")
				newanim.AnimationId = "rbxassetid://18459183268"
				local void = character.Humanoid:LoadAnimation(newanim)
				void.Priority = Enum.AnimationPriority.Action4
				void:Play()
				workspace.Gravity = 50

				animationTrack.Stopped:Connect(function()
					void:Stop()
					workspace.Gravity = 196.2
				end)
			end
		end


		if animationId == "rbxassetid://13560306510" then -- Flowing hit animation ID
			animationTrack.TimePosition = 2.8
			local music3 = Instance.new("Sound", game.Players.LocalPlayer.Character.Head)

			music3.Name = "PunchingSFX"

			music3.SoundId = getcustomasset(SFXFileName)

			music3.Looped = false

			music3.Volume = 4
			

			music3:Play()
			
			music3.TimePosition = 2

			game.Debris:AddItem(music3, 60)
			coroutine.wrap(function()
				task.wait(1)
				player.Character.HumanoidRootPart.Anchored = true
				animationTrack:Stop()
				local animtrack = Instance.new("Animation")
				animtrack.AnimationId = "rbxassetid://13073745835"
				local redanim = player.Character.Humanoid:LoadAnimation(animtrack)
				redanim:Play()

				local Red = game.Players.LocalPlayer.Character["Right Arm"]

				local Sparks = Instance.new("ParticleEmitter")
				local Mid = Instance.new("Attachment")
				local Charge = Instance.new("ParticleEmitter")
				local Smoke = Instance.new("ParticleEmitter")
				local Stars = Instance.new("ParticleEmitter")
				local Start = Instance.new("Attachment")
				local End = Instance.new("Attachment")
				local Beam2 = Instance.new("Beam")

				game.Debris:AddItem(Sparks, 5)
				game.Debris:AddItem(Mid, 5)
				game.Debris:AddItem(Charge, 5)
				game.Debris:AddItem(Smoke, 5)
				game.Debris:AddItem(Stars, 5)
				game.Debris:AddItem(Start, 5)
				game.Debris:AddItem(End, 5)
				game.Debris:AddItem(Beam2, 5)


				local music = Instance.new("Sound", game.Players.LocalPlayer.Character.Head)

				music.Name = "Aka"

				music.SoundId = getcustomasset(AkaFileName)

				music.Looped = false

				music.Volume = 10

				music:Play()

				local music2 = Instance.new("Sound", game.Players.LocalPlayer.Character.Head)

				music2.Name = "AkaSFX"

				music2.SoundId = getcustomasset(AkasfxFileName)

				music2.Looped = false

				music2.Volume = 4

				music2:Play()
				

				local objects2 = game:GetObjects(133512260861191)

				local parent = character["Right Arm"]

				for _, obj in pairs(objects2) do
					if obj:IsA("BasePart") then
						for _, attachment in pairs(obj:GetChildren()) do
							if attachment:IsA("Attachment") then
								attachment.Parent = parent
								for _, emitter in pairs(attachment:GetChildren()) do
									if emitter:IsA("ParticleEmitter") then
										emitter.Enabled = true

										coroutine.wrap(function()
											task.wait(0.5)
											emitter.Enabled = false
										end)()
										game.Debris:AddItem(attachment, 5)
									end
								end
							end
						end
						obj:Destroy()
					end
				end
				flashRed()

				game.Debris:AddItem(music, 60)

				Sparks.Brightness = 15
				Sparks.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.588235,0.0901961,0.0901961),0),ColorSequenceKeypoint.new(1,Color3.new(0.588235,0.0901961,0.0901961),0)})
				Sparks.Drag = 5
				Sparks.EmissionDirection = Enum.NormalId.Right
				Sparks.Lifetime = NumberRange.new(0.5,1)
				Sparks.LockedToPart = true
				Sparks.Rate = 400
				Sparks.RotSpeed = NumberRange.new(-100,100)
				Sparks.Rotation = NumberRange.new(-360,360)
				Sparks.ShapeStyle = Enum.ParticleEmitterShapeStyle.Surface
				Sparks.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.6,0),NumberSequenceKeypoint.new(0.439759,0.625,0),NumberSequenceKeypoint.new(0.775904,0.375,0),NumberSequenceKeypoint.new(1,0,0)})
				Sparks.Speed = NumberRange.new(-40,0)
				Sparks.SpreadAngle = Vector2.new(20, 20)
				Sparks.Texture = [[rbxassetid://8221815526]]
				Sparks.ZOffset = 3
				Sparks.Name = [[Sparks]]
				Sparks.Parent = Red

				Mid.Name = [[Mid]]
				Mid.Parent = Red

				Charge.Brightness = 3
				Charge.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(1,0,0),0)})
				Charge.Lifetime = NumberRange.new(0.25,0.25)
				Charge.LightEmission = 1
				Charge.LockedToPart = true
				Charge.Rate = 50
				Charge.RotSpeed = NumberRange.new(500,500)
				Charge.Rotation = NumberRange.new(0,360)
				Charge.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,10,0),NumberSequenceKeypoint.new(0.273006,8.98219,0),NumberSequenceKeypoint.new(0.748466,5.6743,0),NumberSequenceKeypoint.new(1,0,0)})
				Charge.Speed = NumberRange.new(0.1,0.1)
				Charge.SpreadAngle = Vector2.new(360, 360)
				Charge.Texture = [[rbxassetid://1084969997]]
				Charge.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(1,0,0)})
				Charge.Name = [[Charge]]
				Charge.Parent = Mid

				Smoke.Brightness = 3
				Smoke.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(1,0,0),0)})
				Smoke.Drag = 1
				Smoke.EmissionDirection = Enum.NormalId.Left
				Smoke.FlipbookFramerate = NumberRange.new(1,10)
				Smoke.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
				Smoke.FlipbookStartRandom = true
				Smoke.Lifetime = NumberRange.new(0.5,0.75)
				Smoke.LightEmission = 1
				Smoke.LockedToPart = true
				Smoke.Rate = 100
				Smoke.Rotation = NumberRange.new(-360,360)
				Smoke.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2.5,0),NumberSequenceKeypoint.new(1,2.5,0)})
				Smoke.Speed = NumberRange.new(0,5)
				Smoke.SpreadAngle = Vector2.new(360, 360)
				Smoke.Texture = [[rbxassetid://14607280547]]
				Smoke.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.25058,0.8625,0),NumberSequenceKeypoint.new(0.49768,0.825,0),NumberSequenceKeypoint.new(0.834107,0.89375,0),NumberSequenceKeypoint.new(1,1,0)})
				Smoke.ZOffset = -1
				Smoke.Name = [[Smoke]]
				Smoke.Parent = Mid

				Stars.Brightness = 15
				Stars.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.588235,0.160784,0.160784),0),ColorSequenceKeypoint.new(1,Color3.new(0.588235,0.160784,0.160784),0)})
				Stars.Lifetime = NumberRange.new(0.3,0.3)
				Stars.LockedToPart = true
				Stars.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.228916,2,0),NumberSequenceKeypoint.new(0.49759,3.1875,0),NumberSequenceKeypoint.new(0.801205,2.3125,0),NumberSequenceKeypoint.new(1,0,0)})
				Stars.Speed = NumberRange.new(0,0)
				Stars.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0,-3,0),NumberSequenceKeypoint.new(1,-3,0)})
				Stars.Texture = [[http://www.roblox.com/asset/?id=5192965045]]
				Stars.ZOffset = 3
				Stars.Name = [[Stars]]
				Stars.Parent = Red

				Start.CFrame = CFrame.new(3, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)

				Start.Name = [[Start]]
				Start.Parent = Red

				End.CFrame = CFrame.new(-12, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				End.Name = [[End]]
				End.Parent = Red

				Beam2.Attachment0 = Start
				Beam2.Attachment1 = End
				Beam2.Brightness = 15
				Beam2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0.133333,0.133333),0),ColorSequenceKeypoint.new(1,Color3.new(1,0.133333,0.133333),0)})
				Beam2.FaceCamera = true
				Beam2.Texture = [[rbxassetid://7071778278]]
				Beam2.TextureLength = 40
				Beam2.TextureMode = Enum.TextureMode.Static
				Beam2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.104839,0.788889,0),NumberSequenceKeypoint.new(0.333871,0,0),NumberSequenceKeypoint.new(0.5,0,0),NumberSequenceKeypoint.new(0.633871,0.161111,0),NumberSequenceKeypoint.new(0.775806,0.744444,0),NumberSequenceKeypoint.new(1,1,0)})
				Beam2.Width0 = 5
				Beam2.Width1 = 40
				Beam2.ZOffset = 2.200000047683716
				Beam2.Name = [[Beam2]]
				Beam2.Parent = Red

				task.wait(0.4)
				Beam2.Enabled = false
				Stars.Enabled = false
				Sparks.Enabled = false
				Smoke.Enabled = false
				Charge.Enabled = false
				task.wait(0.2)
				playsound(3059775624, 3, game.Players.LocalPlayer.Character["Right Arm"])
				local RedExplode = game.Players.LocalPlayer.Character["Right Arm"]
				local Sparks = Instance.new("ParticleEmitter")
				local Wind = Instance.new("ParticleEmitter")
				local Burst = Instance.new("ParticleEmitter")
				local Dust = Instance.new("ParticleEmitter")

				Sparks.Brightness = 5
				Sparks.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(1,0,0),0)})
				Sparks.Drag = 10
				Sparks:Emit(10)
				Sparks.EmissionDirection = Enum.NormalId.Front
				Sparks.Enabled = false
				Sparks.FlipbookFramerate = NumberRange.new(1,40)
				Sparks.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid8x8
				Sparks.FlipbookStartRandom = true
				Sparks.Lifetime = NumberRange.new(0.3,0.6)
				Sparks.Rate = 400
				Sparks.RotSpeed = NumberRange.new(-200,200)
				Sparks.Rotation = NumberRange.new(-360,360)
				Sparks.ShapeStyle = Enum.ParticleEmitterShapeStyle.Surface
				Sparks.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,4.30025,0),NumberSequenceKeypoint.new(0.1,9.97,0),NumberSequenceKeypoint.new(0.179448,3.86768,0),NumberSequenceKeypoint.new(0.325153,1.37405,0),NumberSequenceKeypoint.new(1,0,0)})
				Sparks.Speed = NumberRange.new(10,150)
				Sparks.SpreadAngle = Vector2.new(360, 360)
				Sparks.Texture = [[rbxassetid://11817592243]]
				Sparks.ZOffset = 3
				Sparks.Name = [[Sparks]]
				Sparks.Parent = RedExplode

				Wind.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(1,1,1),0)})
				Wind.Enabled = false
				Wind.Lifetime = NumberRange.new(0.1,0.1)
				Wind.LightEmission = 1
				Wind.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
				Wind.Rate = 40
				Wind:Emit(10)
				Wind.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.132316,6.03,5.45805),NumberSequenceKeypoint.new(0.288316,9.79667,7.24584),NumberSequenceKeypoint.new(0.508316,11.7137,6.85207),NumberSequenceKeypoint.new(1,13.6162,4.67232)})
				Wind.Speed = NumberRange.new(0.1,0.1)
				Wind.SpreadAngle = Vector2.new(360, 360)
				Wind.Texture = [[rbxassetid://10365550581]]
				Wind.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.5,0.4),NumberSequenceKeypoint.new(1,1,0)})
				Wind.Name = [[Wind]]
				Wind.Parent = RedExplode

				Burst.Brightness = 5
				Burst.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(1,0,0),0)})
				Burst.Enabled = false
				Burst.Lifetime = NumberRange.new(0.2,0.2)
				Burst.LightEmission = 1
				Burst.Rate = 1
				Burst:Emit(10)
				Burst.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.134316,6.13,0),NumberSequenceKeypoint.new(0.328316,9.63,0),NumberSequenceKeypoint.new(0.592316,12.8682,0),NumberSequenceKeypoint.new(1,13.8062,0)})
				Burst.Speed = NumberRange.new(0,0)
				Burst.Texture = [[rbxassetid://10365553480]]
				Burst.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,0)})
				Burst.Name = [[Burst]]
				Burst.Parent = RedExplode

				Dust.Drag = 8
				Dust.EmissionDirection = Enum.NormalId.Front
				Dust.Enabled = false
				Dust:Emit(10)
				Dust.FlipbookFramerate = NumberRange.new(10,30)
				Dust.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid8x8
				Dust.FlipbookStartRandom = true
				Dust.Lifetime = NumberRange.new(0.5,1.25)
				Dust.LightInfluence = 1
				Dust.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
				Dust.Rate = 10
				Dust.RotSpeed = NumberRange.new(-10,10)
				Dust.Rotation = NumberRange.new(-360,360)
				Dust.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.046342,8.86716,6.60436),NumberSequenceKeypoint.new(0.146342,12.3189,6.13319),NumberSequenceKeypoint.new(0.396342,15.8451,7.30852),NumberSequenceKeypoint.new(0.672342,17.0183,6.24101),NumberSequenceKeypoint.new(1,17.2114,6.12861)})
				Dust.Speed = NumberRange.new(0.1,15)
				Dust.SpreadAngle = Vector2.new(360, 360)
				Dust.Texture = [[rbxassetid://13026594575]]
				Dust.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.5,0),NumberSequenceKeypoint.new(0.5,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
				Dust.Name = [[Dust]]
				Dust.Parent = RedExplode

				game.Debris:AddItem(Dust, 5)
				game.Debris:AddItem(Wind, 5)
				game.Debris:AddItem(Sparks, 5)
				game.Debris:AddItem(Burst, 5)
				player.Character.HumanoidRootPart.Anchored = false

			end)()
			-- Stop the flowing startup animation when flowing hit starts
			if BufferTrack and BufferTrack.IsPlaying then
				BufferTrack:Stop()
			end
		end

		if animationId == "rbxassetid://12309835105" then
			coroutine.wrap(function()
				local TweenService = game:GetService("TweenService")
				local player = game.Players.LocalPlayer -- Get the player
				local character = player.Character or player.CharacterAdded:Wait() -- Get the player's character
				local humanoidRootPart = character:WaitForChild("HumanoidRootPart") -- The main part we will use to move the object around
				local music2 = Instance.new("Sound", game.Players.LocalPlayer.Character.Head)

				music2.Name = "AkaSFX"

				music2.SoundId = getcustomasset(AkasfxFileName)

				music2.Looped = false

				music2.Volume = 4

				music2:Play()
				game.Debris:AddItem(music2, 60)
				coroutine.wrap(function()
					tweenProperty(game.Workspace.CurrentCamera, {FieldOfView = 90}, 0.3)
					task.wait(0.2)
					tweenProperty(game.Workspace.CurrentCamera, {FieldOfView = 20}, 0.2)
					task.wait(0.2)
					tweenProperty(game.Workspace.CurrentCamera, {FieldOfView = 70}, 0.8)

				end)()
				-- Create the ReversalRedMax2 object as in your original script
				local ReversalRedMax2 = Instance.new("Part")
				local Trail = Instance.new("Trail")
				local Center = Instance.new("Attachment")
				local Aura = Instance.new("ParticleEmitter")
				local CenterParticle = Instance.new("ParticleEmitter")
				local PointLight = Instance.new("PointLight")
				local Attachment2 = Instance.new("Attachment")
				local Attachment = Instance.new("Attachment")
				-- Properties --

				ReversalRedMax2.Shape = Enum.PartType.Ball
				ReversalRedMax2.Anchored = false
				ReversalRedMax2.BottomSurface = Enum.SurfaceType.Smooth
				ReversalRedMax2.BrickColor = BrickColor.new([[Really red]])
				ReversalRedMax2.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
				ReversalRedMax2.CanCollide = false
				ReversalRedMax2.Color = Color3.new(1, 0, 0)
				ReversalRedMax2.Massless = true
				ReversalRedMax2.Material = Enum.Material.Neon
				ReversalRedMax2.Size = Vector3.new(3, 3, 3)
				ReversalRedMax2.TopSurface = Enum.SurfaceType.Smooth
				ReversalRedMax2.Name = [[ReversalRedMax2]]
				ReversalRedMax2.Parent = workspace

				Trail.Attachment0 = Attachment2
				Trail.Attachment1 = Attachment
				Trail.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(1,0,0),0)})
				Trail.FaceCamera = true
				Trail.Lifetime = 0.20000000298023224
				Trail.LightInfluence = 1
				Trail.Texture = [[rbxassetid://12533057255]]
				Trail.TextureLength = 0.8999999761581421
				Trail.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,0,0)})
				Trail.Parent = ReversalRedMax2

				Center.Name = [[Center]]
				Center.Parent = ReversalRedMax2

				Aura.Brightness = 6
				Aura.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(1,0,0),0)})
				Aura.FlipbookFramerate = NumberRange.new(10,20)
				Aura.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
				Aura.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
				Aura.FlipbookStartRandom = true
				Aura.Lifetime = NumberRange.new(0.5,0.75)
				Aura.LockedToPart = true
				Aura.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
				Aura.Rate = 200
				Aura.RotSpeed = NumberRange.new(-400,400)
				Aura.Rotation = NumberRange.new(-360,360)
				Aura.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.103491,0.578231,0.578231),NumberSequenceKeypoint.new(0.253117,2.10884,2.10884),NumberSequenceKeypoint.new(0.48005,2.82313,2.82313),NumberSequenceKeypoint.new(0.753117,2.07483,2.07483),NumberSequenceKeypoint.new(1,1.00111,1.00111)})
				Aura.Speed = NumberRange.new(0.1,5)
				Aura.SpreadAngle = Vector2.new(360, 360)
				Aura.Texture = [[rbxassetid://15269497616]]
				Aura.Name = [[Aura]]
				Aura.Parent = Center

				CenterParticle.Brightness = 5
				CenterParticle.Lifetime = NumberRange.new(0.2,0.2)
				CenterParticle.LightEmission = 1
				CenterParticle.LockedToPart = true
				CenterParticle.Rate = 40
				CenterParticle.RotSpeed = NumberRange.new(500,500)
				CenterParticle.Rotation = NumberRange.new(-360,360)
				CenterParticle.Speed = NumberRange.new(0,0)
				CenterParticle.Texture = [[rbxassetid://2122546039]]
				CenterParticle.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.5,0,0),NumberSequenceKeypoint.new(0.85,0.25,0),NumberSequenceKeypoint.new(1,1,0)})
				CenterParticle.ZOffset = 6
				CenterParticle.Name = [[CenterParticle]]
				CenterParticle.Parent = Center

				PointLight.Range = 15
				PointLight.Brightness = 5
				PointLight.Color = Color3.new(1, 0, 0)
				PointLight.Parent = ReversalRedMax2

				Attachment2.CFrame = CFrame.new(0, 0, 1.40000153, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				Attachment2.Name = [[Attachment2]]
				Attachment2.Parent = ReversalRedMax2

				Attachment.CFrame = CFrame.new(0, 0, -1.40000153, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				Attachment.Parent = ReversalRedMax2


				-- Tweening variables
				local outwardDistance = 50 -- The distance to move the object outward
				local outwardTime = 0.5 -- Time to move outward
				local returnTime = 0.2 -- Time to return like a magnet

				-- Create a function to move the object outward and then return
				local function flyOutAndBack()
					-- Initial position (near the player)
					ReversalRedMax2.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -3) -- Start in front of the player

					-- Tween to move outward
					local targetPosition = humanoidRootPart.Position + humanoidRootPart.CFrame.LookVector * outwardDistance
					local outwardTween = TweenService:Create(ReversalRedMax2, TweenInfo.new(outwardTime, Enum.EasingStyle.Linear), {CFrame = CFrame.new(targetPosition)})
					outwardTween:Play()

					-- When outward tween is done, return the part to the player
					outwardTween.Completed:Connect(function()
						-- Tween to return to the player's position
						local returnTween = TweenService:Create(ReversalRedMax2, TweenInfo.new(returnTime, Enum.EasingStyle.Linear), {CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -3)})
						returnTween:Play()

						-- After returning to the player, destroy the part
						returnTween.Completed:Connect(function()

							ReversalRedMax2:Destroy() -- Destroy the object after it returns
							local BlackFlashHit = Instance.new("Part")
							game.Debris:AddItem(BlackFlashHit, 5)
							
							coroutine.wrap(function()


								local ts = game:GetService("TweenService")
								local Dialogue = Instance.new("BillboardGui")
								local Chat1 = Instance.new("Frame")
								local Sub = Instance.new("TextLabel")



								local player = game.Players.LocalPlayer
								local character = player.Character or player.CharacterAdded:Wait()
								local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

								Dialogue.Active = true
								Dialogue.Size = UDim2.new(15, 0, 15, 0)
								Dialogue.StudsOffset = Vector3.new(0, 0, 2)
								Dialogue.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
								Dialogue.Name = [[Dialogue]]
								Dialogue.Parent = humanoidRootPart

								Chat1.AnchorPoint = Vector2.new(0.5, 0.5)
								Chat1.BackgroundColor3 = Color3.new(1, 1, 1)
								Chat1.BorderColor3 = Color3.new(0, 0, 0)
								Chat1.BorderSizePixel = 2
								Chat1.Position = UDim2.new(0.600000024, 0, -0.2, 0) 
								Chat1.Size = UDim2.new(0.100000001, 0, 0.200000003, 0)
								Chat1.Name = [[Chat1]]
								Chat1.BackgroundTransparency = 1
								Chat1.Parent = Dialogue

								Sub.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Italic)
								Sub.Text = [[KOKUSEN!!]]
								Sub.TextColor3 = Color3.new(0, 0, 0)
								Sub.TextScaled = true
								Sub.TextSize = 14
								Sub.TextWrapped = true
								Sub.AnchorPoint = Vector2.new(0.5, 0.5)
								Sub.BackgroundColor3 = Color3.new(1, 1, 1)
								Sub.TextTransparency = 1
								Sub.BorderColor3 = Color3.new(0, 0, 0)
								Sub.BorderSizePixel = 0
								Sub.Position = UDim2.new(0.5, 0, 0.5, 0)
								Sub.Size = UDim2.new(0.850000024, 0, 0.349999994, 0)
								Sub.Name = [[Sub]]
								Sub.Parent = Chat1
								Sub.BackgroundTransparency = 1






								game.Debris:AddItem(Chat1, 25)
								game.Debris:AddItem(Sub, 25)



								tweenProperty(Chat1, {BackgroundTransparency = 0}, 1)
								tweenProperty(Sub, {TextTransparency = 0}, 1)
								tweenProperty(Chat1, {Position = UDim2.new(0.6, 0, 0.4, 0)}, 1)
								task.wait(2)
								tweenProperty(Chat1, {BackgroundTransparency = 1}, 2)
								tweenProperty(Sub, {TextTransparency = 1}, 2)

							end)()
							BlackFlashHit.CFrame = game.Players.LocalPlayer.Character["Right Arm"].CFrame
							local Sparks2 = Instance.new("ParticleEmitter")
							local Blast = Instance.new("ParticleEmitter")
							local Lightning = Instance.new("ParticleEmitter")
							local Wind2 = Instance.new("ParticleEmitter")
							local Sparks = Instance.new("ParticleEmitter")
							-- Properties --

							BlackFlashHit.Anchored = true
							BlackFlashHit.BottomSurface = Enum.SurfaceType.Smooth
							BlackFlashHit.CanCollide = false
							BlackFlashHit.EnableFluidForces = false
							BlackFlashHit.Size = Vector3.new(1, 1, 1)
							BlackFlashHit.TopSurface = Enum.SurfaceType.Smooth
							BlackFlashHit.Transparency = 1
							BlackFlashHit.Name = [[BlackFlashHit]]
							BlackFlashHit.Parent = workspace

							Sparks2.Acceleration = Vector3.new(0, 5, 0)
							Sparks2.Brightness = 15
							Sparks2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(1,0,0),0)})
							Sparks2.Drag = 7
							Sparks2.EmissionDirection = Enum.NormalId.Front
							Sparks2.Enabled = false
							Sparks2.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
							Sparks2.Lifetime = NumberRange.new(1,2)
							Sparks2.Orientation = Enum.ParticleOrientation.VelocityParallel
							Sparks2.Rate = 400
							Sparks2:Emit(15)
							Sparks2.RotSpeed = NumberRange.new(-300,300)
							Sparks2.Rotation = NumberRange.new(0,360)
							Sparks2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,4,2),NumberSequenceKeypoint.new(1,0,0)})
							Sparks2.Speed = NumberRange.new(20,150)
							Sparks2.SpreadAngle = Vector2.new(360, 360)
							Sparks2.Texture = [[rbxassetid://17547405831]]
							Sparks2.Name = [[Sparks2]]
							Sparks2.Parent = BlackFlashHit

							Blast.Brightness = 10
							Blast.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(1,0,0),0)})
							Blast.EmissionDirection = Enum.NormalId.Front
							Blast.Enabled = false
							Blast.Lifetime = NumberRange.new(0.05,0.05)
							Blast.Orientation = Enum.ParticleOrientation.VelocityParallel
							Blast.Rate = 200
							Blast:Emit(15)
							Blast.Rotation = NumberRange.new(-360,360)
							Blast.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,10,0),NumberSequenceKeypoint.new(1,62.2016,0)})
							Blast.Speed = NumberRange.new(0.1,0.1)
							Blast.SpreadAngle = Vector2.new(360, 360)
							Blast.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0,-3,0),NumberSequenceKeypoint.new(1,2.5125,0)})
							Blast.Texture = [[rbxassetid://7994629137]]
							Blast.Name = [[Blast]]
							Blast.Parent = BlackFlashHit

							Lightning.Brightness = 5
							Lightning.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(1,0,0),0)})
							Lightning.Drag = 3
							Lightning.Enabled = false
							Lightning.FlipbookFramerate = NumberRange.new(20,40)
							Lightning.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
							Lightning.FlipbookStartRandom = true
							Lightning.Lifetime = NumberRange.new(0.2,1.3)
							Lightning.LockedToPart = true
							Lightning.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
							Lightning.Rate = 100
							Lightning:Emit(15)
							Lightning.Rotation = NumberRange.new(0,360)
							Lightning.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.033642,12.5435,11.3034),NumberSequenceKeypoint.new(0.075642,16.0988,11.5298),NumberSequenceKeypoint.new(0.109642,9.43785,12.5917),NumberSequenceKeypoint.new(0.177642,14.175,13.7364),NumberSequenceKeypoint.new(1,13.9192,13.4744)})
							Lightning.Speed = NumberRange.new(0.001,10)
							Lightning.SpreadAngle = Vector2.new(360, 360)
							Lightning.Texture = [[rbxassetid://14255829980]]
							Lightning.ZOffset = 2
							Lightning.Name = [[Lightning]]
							Lightning.Parent = BlackFlashHit

							Wind2.Brightness = 3
							Wind2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(1,0,0),0)})
							Wind2.Enabled = false
							Wind2.Lifetime = NumberRange.new(0.1,0.1)
							Wind2.LightEmission = 1
							Wind2.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
							Wind2.Rate = 100
							Wind2:Emit(15)
							Wind2.Rotation = NumberRange.new(-360,360)
							Wind2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,80,0),NumberSequenceKeypoint.new(1,80,0)})
							Wind2.Speed = NumberRange.new(0.01,0.01)
							Wind2.SpreadAngle = Vector2.new(360, 360)
							Wind2.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0,-3,0),NumberSequenceKeypoint.new(1,0,0)})
							Wind2.Texture = [[rbxassetid://1053548563]]
							Wind2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,0)})
							Wind2.Name = [[Wind2]]
							Wind2.Parent = BlackFlashHit

							Sparks.Brightness = 15
							Sparks.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,0,0),0),ColorSequenceKeypoint.new(1,Color3.new(1,0,0),0)})
							Sparks.Drag = 7
							Sparks.EmissionDirection = Enum.NormalId.Front
							Sparks.Enabled = false
							Sparks.Lifetime = NumberRange.new(0.8,1.3)
							Sparks.Orientation = Enum.ParticleOrientation.VelocityParallel
							Sparks.Rate = 400
							Sparks:Emit(15)
							Sparks.Rotation = NumberRange.new(90,90)
							Sparks.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,4.02858,3.04993),NumberSequenceKeypoint.new(0.205642,1.84193,1.74011),NumberSequenceKeypoint.new(1,0,0)})
							Sparks.Speed = NumberRange.new(40,200)
							Sparks.SpreadAngle = Vector2.new(360, 360)
							Sparks.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.231642,5.1956,0),NumberSequenceKeypoint.new(0.32206,0.844828,0),NumberSequenceKeypoint.new(0.46806,4.5586,0),NumberSequenceKeypoint.new(0.49206,0.000789245,0),NumberSequenceKeypoint.new(0.51806,3.78691,0),NumberSequenceKeypoint.new(0.56206,1.97825,0),NumberSequenceKeypoint.new(0.64006,2.28498,0),NumberSequenceKeypoint.new(0.72006,0.104659,0),NumberSequenceKeypoint.new(1,-1.15485,0)})
							Sparks.Texture = [[rbxassetid://15407518755]]
							Sparks.Name = [[Sparks]]
							Sparks.Parent = BlackFlashHit


							local music = Instance.new("Sound", game.Players.LocalPlayer.Character.Head)

							music.Name = "Kokusen"

							music.SoundId = getcustomasset(KokusenFileName)

							music.TimePosition = 0.2

							music.Looped = false

							music.Volume = 10

							music:Play()
							game.Debris:AddItem(music, 60)

							local music3 = Instance.new("Sound", game.Players.LocalPlayer.Character.Head)

							music3.Name = "Kokusen3"

							music3.SoundId = getcustomasset(Kokusen3FileName)

							music3.TimePosition = 0.2

							music3.Looped = false

							music3.Volume = 0

							music3:Play()
							
							tweenProperty(music3, {Volume = 5}, 1)
							
							coroutine.wrap(function()


								local ts = game:GetService("TweenService")
								local Dialogue = Instance.new("BillboardGui")
								local Chat1 = Instance.new("Frame")
								local Sub = Instance.new("TextLabel")



								local player = game.Players.LocalPlayer
								local character = player.Character or player.CharacterAdded:Wait()
								local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

								Dialogue.Active = true
								Dialogue.Size = UDim2.new(15, 0, 15, 0)
								Dialogue.StudsOffset = Vector3.new(0, 0, 2)
								Dialogue.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
								Dialogue.Name = [[Dialogue]]
								Dialogue.Parent = humanoidRootPart

								Chat1.AnchorPoint = Vector2.new(0.5, 0.5)
								Chat1.BackgroundColor3 = Color3.new(1, 1, 1)
								Chat1.BorderColor3 = Color3.new(0, 0, 0)
								Chat1.BorderSizePixel = 2
								Chat1.Position = UDim2.new(0.600000024, 0, -0.2, 0) 
								Chat1.Size = UDim2.new(0.100000001, 0, 0.200000003, 0)
								Chat1.Name = [[Chat1]]
								Chat1.BackgroundTransparency = 1
								Chat1.Parent = Dialogue

								Sub.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Italic)
								Sub.Text = [[KOKUSEN!!]]
								Sub.TextColor3 = Color3.new(0, 0, 0)
								Sub.TextScaled = true
								Sub.TextSize = 14
								Sub.TextWrapped = true
								Sub.AnchorPoint = Vector2.new(0.5, 0.5)
								Sub.BackgroundColor3 = Color3.new(1, 1, 1)
								Sub.TextTransparency = 1
								Sub.BorderColor3 = Color3.new(0, 0, 0)
								Sub.BorderSizePixel = 0
								Sub.Position = UDim2.new(0.5, 0, 0.5, 0)
								Sub.Size = UDim2.new(0.850000024, 0, 0.349999994, 0)
								Sub.Name = [[Sub]]
								Sub.Parent = Chat1
								Sub.BackgroundTransparency = 1






								game.Debris:AddItem(Chat1, 25)
								game.Debris:AddItem(Sub, 25)



								tweenProperty(Chat1, {BackgroundTransparency = 0}, 1)
								tweenProperty(Sub, {TextTransparency = 0}, 1)
								tweenProperty(Chat1, {Position = UDim2.new(0.6, 0, 0.4, 0)}, 1)
								task.wait(2)
								tweenProperty(Chat1, {BackgroundTransparency = 1}, 2)
								tweenProperty(Sub, {TextTransparency = 1}, 2)

							end)()

							game.Debris:AddItem(music3, 60)

						end)
					end)
				end

				-- Call the function to trigger the motion
				flyOutAndBack()
			end)()
		end

		-- Check if the animationId is in the replacements table
		local replacementData = animationReplacements[animationId]
		if replacementData then
			animationTrack:Stop() -- Stop the current animation

			-- Create and play the replacement animation
			local newAnimation = Instance.new("Animation")
			newAnimation.AnimationId = replacementData[1] -- Replacement animation ID
			local newAnimationTrack = animator:LoadAnimation(newAnimation)

			-- Set the speed of the replacement animation
			newAnimationTrack:Play()
			newAnimationTrack:AdjustSpeed(replacementData[2]) -- Adjust speed based on the value from the table
			if animationId == "rbxassetid://12272894215" then -- Flowing startup animation ID
				coroutine.wrap(function()
					BufferTrack = newAnimationTrack
					newAnimationTrack.Looped = false
					task.wait(0.65)
					newAnimationTrack:Stop()
				end)()
			end
		end
	end

	-- Listen for animations being played
	animator.AnimationPlayed:Connect(onAnimationPlayed)
end


local function monitorHotbarText()

	local hotbar1Text = LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar["1"].Base.ToolName
	hotbar1Text:GetPropertyChangedSignal("Text"):Connect(function()
		if hotbar1Text.Text == "Death Counter" then
			repeat
				task.wait(0.1)
			until hotbar1Text.Text == "Normal Punch"

			resetHotbarText()
		end
	end)
end




-- Call the function to monitor Hotbar "1" text changes
monitorHotbarText()



resetHotbarText()

local HumanModCons = {}





local Char = LocalPlayer.Character
local Human = Char and Char:FindFirstChildWhichIsA("Humanoid")
local function WalkSpeedChange()
	if Char and Human then
		Human.WalkSpeed = 25
		Human.JumpHeight = 7.2

	end
end
WalkSpeedChange()
HumanModCons.wsLoop = (HumanModCons.wsLoop and HumanModCons.wsLoop:Disconnect() and false) or Human:GetPropertyChangedSignal("WalkSpeed"):Connect(WalkSpeedChange)
HumanModCons.wsCA = (HumanModCons.wsCA and HumanModCons.wsCA:Disconnect() and false) or LocalPlayer.CharacterAdded:Connect(function(nChar)
	Char, Human = nChar, nChar:WaitForChild("Humanoid")
	WalkSpeedChange()
	HumanModCons.wsLoop = (HumanModCons.wsLoop and HumanModCons.wsLoop:Disconnect() and false) or Human:GetPropertyChangedSignal("WalkSpeed"):Connect(WalkSpeedChange)

end)


local function onCharacterAdded(character)
	repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Hotbar")
	repeat wait() until game.Players.LocalPlayer.Character

	task.wait(1)

	local iconLabel = player.PlayerGui.TopbarPlus.TopbarContainer.UnnamedIcon.DropdownContainer.DropdownFrame.Hunter.IconButton.IconLabel
	iconLabel.TextColor3 = Color3.fromRGB(255, 216, 19)

	local iconImage = player.PlayerGui.TopbarPlus.TopbarContainer.UnnamedIcon.DropdownContainer.DropdownFrame.Hunter.IconButton.IconImage

	local function revertLabelAndIcon()
		iconLabel.Text = "Sorcerer"
		iconImage.Image = "http://www.roblox.com/asset/?id=15143528348"
	end

	iconLabel:GetPropertyChangedSignal("Text"):Connect(function()
		if iconLabel.Text ~= "Sorcerer" then
			revertLabelAndIcon()
		end
	end)

	revertLabelAndIcon()


	local function onChildAdded(child)
		if child.Name == "WaterPalm" then
			task.defer(function()
				coroutine.wrap(function()
					local objects = game:GetObjects(94432959425138)

					local rightHand = child.Parent

					for _, obj in pairs(objects) do
						if obj:IsA("BasePart") then
							for _, child in pairs(obj:GetChildren()) do
								child.Parent = rightHand
								coroutine.wrap(function()
									if child:IsA("Trail") then
										task.wait(0.5)
										child.Enabled = false
									end
								end)()
								game.Debris:AddItem(child, 2)

							end
							if obj:IsA("BasePart") then
								obj:Destroy()
							end
						end
					end

					local objects2 = game:GetObjects(120392383930344)

					local parent = child.Parent

					for _, obj in pairs(objects2) do
						if obj:IsA("BasePart") then
							for _, attachment in pairs(obj:GetChildren()) do
								if attachment:IsA("Attachment") then
									attachment.Parent = child.Parent
									for _, emitter in pairs(attachment:GetChildren()) do
										if emitter:IsA("ParticleEmitter") then
											emitter.Enabled = true

											coroutine.wrap(function()
												task.wait(0.5)
												emitter.Enabled = false
											end)()
											game.Debris:AddItem(attachment, 5)
										end
									end
								end
							end
							obj:Destroy()
						end
					end
				end)()
				child:Destroy()

			end)
		end
	end


	player.Character.DescendantAdded:Connect(onChildAdded)

	local tool = Instance.new("Tool")
	tool.Name = "Run Tool"

	tool.Parent = game.Players.LocalPlayer.Backpack
	tool.RequiresHandle = false

	local moving = false
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	local humanoid = character:WaitForChild("Humanoid")
	local runService = game:GetService("RunService")
	local movementSpeed = 125 

	local animation = Instance.new("Animation")
	animation.AnimationId = "rbxassetid://18897115785" 
	local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator")
	local animationTrack

	local purpletool = Instance.new("Tool")
	purpletool.Name = "Hollow Purple"
	purpletool.RequiresHandle = false
	purpletool.Parent = player.Backpack
	purpletool.Activated:Connect(function()
		coroutine.wrap(function()

			local music = Instance.new("Sound", game.Players.LocalPlayer.Character.Head)

			music.Name = "Purple"

			music.SoundId = getcustomasset(HollowPurpleFileName)
			music.TimePosition = 165
			music.Looped = false

			music.Volume = 4

			music:Play()

			local objects = game:GetObjects("rbxassetid://123913192872790")[1]
			local char = player.Character or player.CharacterAdded:Wait()
			local humRootPart = char:WaitForChild("HumanoidRootPart")

			local redOrb = objects:FindFirstChild("Red Orb")
			local blueOrb = objects:FindFirstChild("Blue Orb")
			local hollowPurple = objects:FindFirstChild("HollowPurple")

			local TweenService = game:GetService("TweenService")
			local Debris = game:GetService("Debris")

			local function enableEffects(model)
				for _, obj in pairs(model:GetDescendants()) do
					if obj:IsA("ParticleEmitter") or obj:IsA("Beam") then
						obj.Enabled = true
					end
				end
			end

			local function disableEffects(model)
				for _, obj in pairs(model:GetDescendants()) do
					if obj:IsA("ParticleEmitter") or obj:IsA("Beam") then
						obj.Enabled = false
					end
				end
			end

			local function moveTo(part, position, time)
				local initialPos = part.Position
				local timeElapsed = 0
				while timeElapsed < time do
					timeElapsed = timeElapsed + game:GetService("RunService").Heartbeat:Wait()
					part.Position = initialPos:Lerp(position, timeElapsed / time)
				end
				part.Position = position
			end

			local function faceTarget(part, target, away)
				local direction = (target.Position - part.Position).unit
				if away then
					direction = -direction
				end
				part.CFrame = CFrame.new(part.Position, part.Position + direction)
			end

			local function launchHollowPurple(part, distance, time)
				local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Linear)
				local goalPosition = part.Position + (humRootPart.CFrame.LookVector * distance)
				local tween = TweenService:Create(part, tweenInfo, {Position = goalPosition})
				tween:Play()
			end

			local anim = Instance.new("Animation")
			anim.AnimationId = "rbxassetid://13071982935"
			local hollow = char.Humanoid:LoadAnimation(anim)
			hollow:Play()
			hollow:AdjustSpeed(0.5)

			redOrb.Parent = workspace
			blueOrb.Parent = workspace
			hollowPurple.Parent = workspace

			redOrb.Anchored = true
			blueOrb.Anchored = true
			hollowPurple.Anchored = true

			redOrb.CFrame = humRootPart.CFrame * CFrame.new(-5, 0, 5)  
			blueOrb.CFrame = humRootPart.CFrame * CFrame.new(5, 0, 5)  
			hollowPurple.CFrame = humRootPart.CFrame * CFrame.new(0, 0, -10) 

			disableEffects(hollowPurple)

			enableEffects(blueOrb)

			faceTarget(blueOrb, redOrb)

			faceTarget(redOrb, blueOrb, true)

			wait(1)
			enableEffects(redOrb)

			wait(1.5)

			local middlePoint = (redOrb.Position + blueOrb.Position) / 2

			spawn(function()
				moveTo(redOrb, middlePoint, 1.5)
			end)

			spawn(function()
				moveTo(blueOrb, middlePoint, 1.5)
			end)
			coroutine.wrap(function()
				disableEffects(redOrb)
				disableEffects(blueOrb)
			end)()
			wait(2)
			enableEffects(hollowPurple)
			wait(2)
			redOrb:Destroy()
			blueOrb:Destroy()

			wait(2)
			hollowPurple.Anchored = false
			launchHollowPurple(hollowPurple, 800, 5) 
			task.wait(6)
			local twn = TweenService:Create(music, TweenInfo.new(1), {Volume = 0}):Play()
			task.wait(1)
			music:Destroy()
		end)()
	end)

	local function moveForward()
		while moving do
			local forwardDirection = humanoidRootPart.CFrame.LookVector
			humanoidRootPart.Velocity = forwardDirection * movementSpeed
			runService.Stepped:Wait()
		end
	end

	tool.Equipped:Connect(function()
		moving = true

		for i, v in character:GetChildren() do
			if v:IsA("Part") then
				local Attachment = Instance.new("Attachment")
				local ParticleEmitter = Instance.new("ParticleEmitter")


				Attachment.Parent = v
				Attachment.Name = "sigmarun"

				ParticleEmitter.Brightness = 5
				ParticleEmitter.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(0.192157, 0.823529, 1),0),ColorSequenceKeypoint.new(1,Color3.new(0.192157, 0.823529, 1),0)})
				ParticleEmitter.Drag = 3
				ParticleEmitter.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
				ParticleEmitter.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
				ParticleEmitter.Lifetime = NumberRange.new(0.5,0.5)
				ParticleEmitter.LightEmission = -1
				ParticleEmitter.LockedToPart = true
				ParticleEmitter.Rate = 2.5
				ParticleEmitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2,0),NumberSequenceKeypoint.new(1,2,0)})
				ParticleEmitter.Speed = NumberRange.new(0,0)
				ParticleEmitter.Texture = [[http://www.roblox.com/asset/?id=14904853757]]
				ParticleEmitter.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.198684,0.491803,0),NumberSequenceKeypoint.new(0.501316,0.513661,0),NumberSequenceKeypoint.new(0.798684,0.497268,0),NumberSequenceKeypoint.new(1,1,0)})
				ParticleEmitter.ZOffset = -1
				ParticleEmitter.Parent = Attachment
			end
		end
		animationTrack = animator:LoadAnimation(animation)
		animationTrack:Play()
		moveForward()
	end)

	tool.Unequipped:Connect(function()
		moving = false
		for i, v in character:GetDescendants() do
			if v:IsA("Attachment") and v:FindFirstChild("ParticleEmitter") and v.Name == "sigmarun" then
				v:Destroy()
			end
		end
		if animationTrack then
			animationTrack:Stop()
		end
	end)	

	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator")


	setupAnimationReplacement(animator)
	resetHotbarText()

	character:GetAttributeChangedSignal("Ulted"):Connect(onUltedChanged)

	monitorHotbarText()
end

onCharacterAdded(player.Character or player.CharacterAdded:Wait())

player.CharacterAdded:Connect(onCharacterAdded)
