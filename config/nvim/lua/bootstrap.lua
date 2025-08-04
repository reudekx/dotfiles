-- Configure rocks.nvim paths
local rocks_path = vim.fs.joinpath(vim.fn.stdpath("data"), "rocks")
vim.g.rocks_nvim = { rocks_path = rocks_path }

-- Add rocks.nvim to Lua paths  
local lua_paths = {
    vim.fs.joinpath(rocks_path, "share", "lua", "5.1", "?.lua"),
    vim.fs.joinpath(rocks_path, "share", "lua", "5.1", "?", "init.lua"),
}
package.path = package.path .. ";" .. table.concat(lua_paths, ";")

local c_paths = {
    vim.fs.joinpath(rocks_path, "lib", "lua", "5.1", "?.so"),
    vim.fs.joinpath(rocks_path, "lib64", "lua", "5.1", "?.so"),
}
package.cpath = package.cpath .. ";" .. table.concat(c_paths, ";")

-- Add to runtime path
vim.opt.runtimepath:append(vim.fs.joinpath(rocks_path, "lib", "luarocks", "rocks-5.1", "rocks.nvim", "*"))

-- Install rocks.nvim if not present (fallback to original method)
if not pcall(require, "rocks") then
    local rocks_location = vim.fs.joinpath(vim.fn.stdpath("cache"), "rocks.nvim")
    if not vim.uv.fs_stat(rocks_location) then
        vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/nvim-neorocks/rocks.nvim", rocks_location })
        assert(vim.v.shell_error == 0, "rocks.nvim installation failed. Try exiting and re-entering Neovim!")
    end
    
    -- Fix permission issue by using /tmp instead of /run/user/1000
    vim.env.XDG_RUNTIME_DIR = "/tmp"
    vim.cmd.source(vim.fs.joinpath(rocks_location, "bootstrap.lua"))
    vim.fn.delete(rocks_location, "rf")
end