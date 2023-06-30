local parse_git_output = function(jobid, data, event)
  local summary = unpack(data)
  if summary == nil or summary == '' then
    return
  end

  local pr_number = string.match(summary, "summary .*%(#(%d+)%)")
  vim.fn.jobstart(
    'gh pr view ' .. pr_number .. ' --web',
    {
      cwd = '.'
    }
  )
end

local view_pr = function()
  local current_buff = vim.fn.expand("%:p")
  local line_number, _col = unpack(vim.api.nvim_win_get_cursor(0))

  local git_cmd = 'git blame -L' .. line_number .. ',+1 --porcelain -- ' .. current_buff

  vim.fn.jobstart(
    git_cmd .. ' | grep summary',
    {
      cwd = '.',
      on_stdout = parse_git_output
    }
  )
end

vim.api.nvim_create_user_command('ViewPr', view_pr, {})

