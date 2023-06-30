function! ViewPr()
  let current_buff = expand("%:p")
  let line_number = line(".")

  let git_cmd = 'git blame -L' . line_number . ',+1 --porcelain -- ' . current_buff
  let grep_cmd = 'grep summary'
  let sed_cmd = 'sed -E "s/.*\(#(.*)\).*/\1/"'
  let pr_number = system(git_cmd .' | '. grep_cmd .' | '. sed_cmd)

  let final_command = 'gh pr view ' . trim(pr_number) . ' --web'
  execute "!" . final_command

  " DEBUG
  " tabnew
  " setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
  " silent put=final_command
endfunction
