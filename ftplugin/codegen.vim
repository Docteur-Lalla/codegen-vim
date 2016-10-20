if !exists("g:codegen_exec")
  let g:codegen_exec = "/usr/bin/codegen"
endif

function! CodeGenBuffer(lang)
  let save_a_reg = @a
  normal! gg"ayG
  let conf = @a
  let code = system(g:codegen_exec . " " . a:lang . " '" . conf . "'")
  normal! ggdG
  execute "normal! i" . code . "<esc>gg"
  set @a = save_a_reg
endfunction