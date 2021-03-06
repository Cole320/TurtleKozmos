-- Auto-updating bootstrapping script

host = { replace_me }

files = {
	"api.lua",
	"base64.lua",
	"expose.lua",
	"json.lua",
	"main.lua",
	"tools.lua",
	"startup.lua",
}

local function download_files()
	for _, file in ipairs(files) do
		shell.run("wget " .. host .. file)
	end
end

local function delete_files()
	for _, file in ipairs(files) do
		shell.run("rm " .. file)
	end
end

local function update()
	delete_files()
	download_files()

	term.clear()
	shell.run("main")
end

update()
