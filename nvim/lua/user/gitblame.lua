local handle_success = function(jobid, data, event)
  local output = table.concat(data, "\n")
  if output == nil or output == '' then
    return
  end

  local commit_hash = string.match(output, "^([^%s]+)")
  if string.match(commit_hash, '^0+$') then
    print "[Not commited yet]"
    return
  end

  local author = string.match(output, "author ([^\n]+)")
  local author_mail = string.match(output, "author%-mail ([^\n]+)")
  local timestamp = string.match(output, "author%-time ([^\n]+)")
  local author_time = os.date("%Y-%m-%d %X", timestamp)
  local summary = string.match(output, "summary ([^\n]+)")

  print('['.. string.sub(commit_hash, 0, 8) .. '] '.. summary .. ' ' .. author_mail .. ' ' .. author .. ' (' .. author_time .. ')')
end

local gitblame_current_line = function ()
  local row, _col = unpack(vim.api.nvim_win_get_cursor(0))
  local filename = vim.fn.expand('%')

  vim.fn.jobstart(
    'git blame '.. filename ..' -L' .. row .. ',+1 --porcelain',
    {
      cwd = '.',
      on_stdout = handle_success
    }
  )
end

vim.api.nvim_create_user_command('GitBlameCurrent', gitblame_current_line, {})
