if !exists("g:codegen_exec")
  let g:codegen_exec = "/usr/bin/codegen"
endif

function! CodeGenBuffer(lang)
  let save_a_reg = @a
  execute('normal! gg"ayG')
  let conf = @a
  let code = system(g:codegen_exec . " " . a:lang . " '" . conf . "'")
  normal! gg_dG
  let @a = code
  execute('normal! "aP')
  let @a = save_a_reg
  set filetype = a:lang
endfunction
