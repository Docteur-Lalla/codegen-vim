if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "codegen"

syntax keyword codegenKeyword package class fun
syntax keyword codegenVisibility public private protected
syntax keyword codegenAttribute final const abstract

syntax match codegenOperator "\v:"
syntax match codegenOperator "\v-\>"
syntax match codegenOperator "\v\+"
syntax match codegenOperator "\v-"

highlight link codegenKeyword Keyword
highlight link codegenVisibility Statement
highlight link codegenAttribute Statement
highlight link codegenOperator Operator
