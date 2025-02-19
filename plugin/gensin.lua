-- insert output from external command
-- local jid = vim.fn.jobstart({"ls", "-al"}, {
--   stdout_buffered = true,
--   on_stdout = function(_, data)
--     if data then
--       for _, v in ipairs(data) do
--         vim.api.nvim_buf_set_lines(0, -1, -1, false, {"--" .. v})
--       end
--     end
--   end
-- })
-- vim.fn.jobwait({jid})

-- -- get selected visual range
-- local line1 = vim.api.nvim_buf_get_mark(0, "<")[1]
-- local line2 = vim.api.nvim_buf_get_mark(0, ">")[1]
-- print(line1, line2)

local doit = function(s, a)
  local cline = vim.api.nvim_win_get_cursor(0)[1]

  local SIZE = s
  local AMPLITUDE = a
  local l = ""
  local res = { "{" }
  for i = 0, SIZE - 1, 1 do
    if i % 8 == 0 and i > 0 then
      table.insert(res, l)
      l = ""
    end

    local v = math.floor(AMPLITUDE * math.sin(2 * math.pi * i / SIZE))
    local vs = string.sub(string.format("%04X", v), -4)

    if i == 0 then
      l = l .. string.format("   0x%s", vs)
    else
      l = l .. string.format(" , 0x%s", vs)
    end
  end
  table.insert(res, l)
  table.insert(res, "}")

  vim.api.nvim_buf_set_lines(0, cline, cline, false, res)
end

-- set the mapping for executin the code in the current buffer
vim.keymap.set("n", "<leader>gs", function()
  vim.ui.input({ prompt = "Enter value for SIZE: ", default = "32" }, function(size)
    vim.ui.input({ prompt = "Enter value for AMPLITUDE: ", default = "32760" }, function(ampli)
      doit(tonumber(size), tonumber(ampli))
    end)
  end)
end)
