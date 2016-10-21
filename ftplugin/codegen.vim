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

function! CodeGenSplit(lang, splitf)
  " Save the state of register a
  let save_a_reg = @a

  " Copy the whole buffer
  execute('normal! gg"ayG')
  let conf = @a

  "Generate the code
  let code = system(g:codegen_exec . " " . a:lang . " '" . conf . "'")
  let @a = code

  " Split the window and copy the code in the newly created buffer
  let filename = expand('%:r') . "." . a:lang
  execute(a:splitf . " " . filename)
  execute('normal! "aP')

  " Reset the register a and set filetype
  let @a = save_a_reg
  let &filetype = a:lang
endfunction

function! CodeGenHSplit(lang)
  call CodeGenSplit(a:lang, "split")
endfunction

function! CodeGenVSplit(lang)
  call CodeGenSplit(a:lang, "vsplit")
endfunction

function! CodeGenLine()
  " Set the target language and save the register a
  let lang = &filetype
  let save_a_reg = @a
  
  " Copy the line
  execute('normal! "ayy')
  let conf = @a

  " Generate the code
  let code = system(g:codegen_exec . " " . lang . " '" . conf . "'")
  let @a = code

  " Copy the code in the buffer
  execute('normal! _dd"aP')

  " Restore the register a
  let @a = save_a_reg
endfunction
