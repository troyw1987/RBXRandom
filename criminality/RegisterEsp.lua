local cashPath = game:GetService("Workspace").Map.BredMakurz

function createChamOnPart(part,color3) -- my cham function
    local folder = Instance.new("Folder",part)
    folder.Name = "Anti-AntiCheat"

    local cham = Instance.new("BoxHandleAdornment",folder)
    cham.Name = "NotChams"
    cham.Adornee = part
    cham.Color3 = color3
    cham.Transparency = 0.3
    cham.AlwaysOnTop = true
    cham.ZIndex = 1
    cham.Size = part.Size
    cham.Visible = true
end



function checkReg(ins)
	local vals = ins:WaitForChild("Values")
	local broken = vals:WaitForChild("Broken")
	local mainPart = ins:WaitForChild("MainPart")


	if not mainPart:FindFirstChild("Anti-AntiCheat") then
		if not broken.Value then
			createChamOnPart(mainPart,Color3.fromRGB(0,255,0))
		else
			createChamOnPart(mainPart,Color3.fromRGB(255,0,0))
		end
	elseif broken.Value then
		mainPart:FindFirstChild("Anti-AntiCheat").NotChams.Color3 = Color3.fromRGB(255,0,0)
	elseif not broken.Value then
		mainPart:FindFirstChild("Anti-AntiCheat").NotChams.Color3 = Color3.fromRGB(0,255,0)
	end
end


function loop()
	for _,v in pairs(cashPath:GetChildren()) do
		checkReg(v)
	end
end


while wait(1) do
	loop()
end
