if !exists("g:codegen_exec")
  let g:codegen_exec = "/usr/bin/codegen"
endif

function! CodeGenBuffer(lang)
  let save_a_reg = @a
  execute 'normal! gg"ayG'
  let code = system(g:codegen_exec . " " . a:lang . " '" . @a . "'")
  normal! gg_dG
  set @a = code
  execute 'normal! "ap'
  " execute "normal! i" . code . "<esc>gg"
  set @a = save_a_reg
endfunction
