local scrapPath = game:GetService("Workspace").Filter.SpawnedPiles


function createChamOnPart(part,color3,transparency) -- my cham function
    local folder = Instance.new("Folder",part)
    folder.Name = "Anti-AntiCheat"

    local cham = Instance.new("BoxHandleAdornment",folder)
    cham.Name = "NotChams"
    cham.Adornee = part
    cham.Color3 = color3
    cham.Transparency = transparency
    cham.AlwaysOnTop = true
    cham.ZIndex = 1
    cham.Size = part.Size
    cham.Visible = true
end





function loop()
	if scrapPath then
		for _,instance in pairs(scrapPath:GetDescendants()) do
			pcall(function()
				if instance:IsA("MeshPart") and instance.Parent.Parent and instance.Parent.Parent == scrapPath then
					wait(0.1)
					local mesh = instance
					local particle = mesh:FindFirstChildOfClass("ParticleEmitter")

					local cham = mesh:FindFirstChildOfClass("Folder")

					if not cham then
						createChamOnPart(mesh,particle.Color.Keypoints[1].Value,0.8)
					end
				end
			end)
		end
	else
		error("No Scrap Path?!?! what kind of black-magic fuckery is this")
	end
end


loop()

while true do
    loop()
end
