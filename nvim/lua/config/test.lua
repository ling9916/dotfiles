print("test")


local function ls(path, fn)
	
	local handle = vim.uv.fs_scandir(path)
	while handle do
		local f_name, f_t = vim.uv.fs_scandir_next(handle)
		if not f_name then break end

		local f_path = path.."/"..f_name

		if fn(f_path, f_name, f_t or vim.uv.fs_stat(f_path).type) == false then break end
	end
end

local function ls_mod(path, name,type)
	
	-- print(path, name,type)
end

local lspOpts_path = vim.fn.stdpath("config").."/lua/mason"

print(ls(lspOpts_path,ls_mod))

return {}
