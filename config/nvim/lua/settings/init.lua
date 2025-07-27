for file in vim.fs.dir(vim.fn.stdpath("config") .. "/lua/settings") do
  if file:match("%.lua$") and file ~= "init.lua" then
    pcall(require, "settings." .. file:gsub("%.lua$", ""))
  end
end