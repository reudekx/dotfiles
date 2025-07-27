for file in vim.fs.dir(vim.fn.stdpath("config") .. "/lua/plugins") do
    if file:match("%.lua$") and file ~= "init.lua" then
        pcall(require, "plugins." .. file:gsub("%.lua$", ""))
    end
end