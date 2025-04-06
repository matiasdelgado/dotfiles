if exists("b:current_syntax")
  finish
endif

" Match the type name after 'type' (allowing extra spaces)
syn match fgaType /^\s*type\s\+\zs\w\+/ containedin=ALL

" Match the relationship name after 'define' (allowing extra spaces, only capture the relationship name)
syn match fgaRelation /\vdefine\s+\zs\w+/ containedin=fgaType,fgaKeyword

" Match anything between square brackets (like [user] or [user, organization#member])
syn match fgaBrackets /\v\[[^\]]*\]/ containedin=fgaType,fgaRelation

syn match fgaComment /\v(^\s*)\#.*$/ containedin=ALL
syn match fgaComment /\v\s\zs\#.*$/ containedin=ALL

" Highlight groups for types, relationships, and bracket contents
highlight fgaType ctermfg=Blue guifg=#807DDB
highlight fgaRelation ctermfg=Green guifg=#3DC1A1
highlight fgaBrackets ctermfg=Yellow guifg=#E2CC7B
highlight fgaComment ctermfg=DarkGray guifg=#888888

" Optional: Use fgaType and fgaRelation for easier linking in other parts of the configuration
hi def link fgaType Type
hi def link fgaRelation Identifier
hi def link fgaBrackets Special

let b:current_syntax = "fga"
