if !exists("g:codegen_exec")
  let g:codegen_exec = "/usr/bin/codegen"
endif

function! CodeGenBuffer(lang)
  " Save the state of register a
  let save_a_reg = @a

  " Copy the whole buffer
  execute('normal! gg"ayG')
  let conf = @a

  " Generate the code
  let code = system(g:codegen_exec . " " . a:lang . " '" . conf . "'")

  " Delete the buffer
  normal! gg_dG

  " Write the code in the buffer
  let @a = code
  execute('normal! "aP')

  " Reset the register a and set filetype
  let @a = save_a_reg
  let &filetype = a:lang
endfunction

function! CodeGenSplit(lang)
  " Save the state of register a
  let save_a_reg = @a

  " Copy the whole buffer
  execute('normal! gg"ayG')
  let conf = @a

  "Generate the code
  let code = system(g:codegen_exec . " " . a:lang . " '" . conf . "'")
  let @a = code

  " Split the window and copy the code in the newly created buffer
  split
  execute('normal! "aP')

  " Reset the register a and set filetype
  let @a = save_a_reg
  let &filetype = a:lang
endfunction
