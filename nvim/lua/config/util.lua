-- print("test")

local function ls(path, fn)
	local handle = vim.uv.fs_scandir(path)
	while handle do
		local f_name, f_t = vim.uv.fs_scandir_next(handle)
		if not f_name then break end

		local f_path = path .. "/" .. f_name
		if fn(f_path, f_name, f_t or vim.uv.fs_stat(f_path).type) == false then break end
	end
end


local function lsp_load(mod_name)
	local lspopts_tbl = require(mod_name)
	for key, _ in pairs(lspopts_tbl) do
		local lsp_opts = lspopts_tbl[key].opts == true and {} or lspopts_tbl[key].opts
		print(type(lsp_opts))
	end
end

local function lsmod(mod_dir)
	if vim.uv.fs_stat(mod_dir).type ~= "directory" then return end
	ls(mod_dir, function(child, name, t)
		if vim.uv.fs_stat(child).type == "directory" then
			lsmod(child)
		elseif (t == "file" or t == "link") then
			lsp_load(child .. "/" .. name)
		end
	end)
end


local mod_name = "mason/lua_ls"
-- print(mod_name)
lsp_load(mod_name)

return {}
