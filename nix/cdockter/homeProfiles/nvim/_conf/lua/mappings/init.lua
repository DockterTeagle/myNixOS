local function load_dir(dir)
	local path = vim.fn.stdpath("config") .. "/lua/" .. dir
	local files = vim.fn.globpath(path, "*.lua", false, true)

	for _, file in ipairs(files) do
		local mod = file:match("lua/(.*)%.lua$"):gsub("/", ".")
		if mod ~= "mappings.init" then -- Avoid requiring itself
			require(mod)
		end
	end
end
load_dir("mappings")
load_dir("mappings/plugin")
