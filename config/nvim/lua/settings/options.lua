-- Basic file handling
vim.opt.swapfile = false		-- Disable swap files
vim.opt.hidden = true			-- Allow hidden buffers

-- Line numbers and cursor
vim.opt.number = true			-- Show absolute line numbers
vim.opt.relativenumber = true	-- Show relative line numbers
vim.opt.cursorline = true		-- Highlight current line
vim.opt.wrap = false			-- Don't wrap long lines

-- Indentation and tabs
vim.opt.tabstop = 4				-- Tab width in spaces
vim.opt.shiftwidth = 4			-- Indentation width
vim.opt.softtabstop = 4			-- Soft tab width
vim.opt.autoindent = true		-- Auto indent new lines
vim.opt.smarttab = true			-- Smart tab behavior

-- Search behavior
vim.opt.hlsearch = true			-- Highlight search results
vim.opt.incsearch = true		-- Incremental search
vim.opt.ignorecase = true		-- Case insensitive search
vim.opt.smartcase = true		-- Case sensitive if uppercase present

-- Display and UI
vim.opt.scrolloff = 8			-- Keep 8 lines above/below cursor
vim.opt.termguicolors = true	-- Enable 24-bit RGB colors

-- Statusline

-- Enable syntax highlighting
vim.cmd('syntax on')


-- 캐시를 위한 변수들
local buffer_cache = {}
local last_update = 0

-- 최적화된 상태바 함수
function _G.statusline()
  local current_time = vim.loop.hrtime()
  local current_buf = vim.api.nvim_get_current_buf()
  
  -- 캐시 유효성 검사 (10ms마다 업데이트)
  if current_time - last_update < 10000000 and buffer_cache.current_buf == current_buf then
    return buffer_cache.result or ''
  end
  
  local buffers = {}
  local buf_list = vim.api.nvim_list_bufs()
  
  -- 버퍼 목록 생성 (한 번의 루프로 처리)
  for i = 1, #buf_list do
    local bufnr = buf_list[i]
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].buflisted then
      -- 버퍼 이름 가져오기
      local name = vim.api.nvim_buf_get_name(bufnr)
      name = (name == '') and 'No Name' or vim.fn.fnamemodify(name, ':t')
      
      -- 상태 확인
      local is_current = bufnr == current_buf
      local is_modified = vim.bo[bufnr].modified
      
      -- 문자로 상태 표시
      local prefix = is_current and '[' or ''
      local suffix = is_current and ']' or ''
      local modified_mark = is_modified and '*' or ''
      
      -- 현재 버퍼는 [name*] 형태, 수정된 버퍼는 name*, 일반 버퍼는 name
      local formatted = prefix .. name .. modified_mark .. suffix
      
      buffers[#buffers + 1] = formatted
    end
  end
  
  -- 파일 정보 생성
  local ft = vim.bo.filetype
  local enc = vim.bo.fileencoding
  if enc == '' then enc = vim.o.encoding end
  
  local file_info = ft .. ' ' .. enc
  if ft == '' then file_info = enc end
  
  -- 위치 정보
  local line = vim.fn.line('.')
  local col = vim.fn.col('.')
  local total_lines = vim.fn.line('$')
  local percent = math.floor(line * 100 / total_lines)
  local position = line .. ':' .. col .. ' ' .. percent .. '%'
  
  -- 상태바 구성 (구분자 없이 공백으로만 구분)
  local buffer_section = #buffers > 0 and table.concat(buffers, '  ') or 'No buffers'
  local result = buffer_section .. ' %= ' .. position .. '  ' .. file_info .. ' '
  
  -- 캐시 업데이트
  buffer_cache = {
    current_buf = current_buf,
    result = result
  }
  last_update = current_time
  
  return result
end

-- 상태바 설정
vim.o.statusline = '%!v:lua.statusline()'

-- 자동 새로고침 (필요한 이벤트만)
vim.api.nvim_create_autocmd({'BufEnter', 'BufDelete', 'BufWritePost'}, {
  callback = function()
    buffer_cache = {} -- 캐시 무효화
    vim.cmd.redrawstatus()
  end,
})

-- 수정 상태 변경 감지
vim.api.nvim_create_autocmd('TextChanged', {
  callback = function()
    if buffer_cache.current_buf == vim.api.nvim_get_current_buf() then
      buffer_cache = {} -- 캐시 무효화
      vim.cmd.redrawstatus()
    end
  end,
})