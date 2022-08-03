" Use the stdio version of OmniSharp-roslyn:
let g:OmniSharp_server_stdio = 1

augroup omnisharp_commands
    autocmd!
    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
    autocmd FileType cs nmap <silent> <buffer> gr <Plug>(omnisharp_find_usages)
    autocmd FileType cs nmap <silent> <buffer> gi <Plug>(omnisharp_find_implementations)
    autocmd FileType cs nmap <silent> <buffer> gp <Plug>(omnisharp_preview_definition)
    autocmd FileType cs nmap <silent> <buffer> K <Plug>(omnisharp_documentation)
    autocmd FileType cs nmap <silent> <buffer> <c-t> <Plug>(omnisharp_find_symbol)

    " Contextual code actions (uses fzf, CtrlP or unite.vim selector when available)
    autocmd FileType cs nmap <silent> <buffer> <a-cr> <Plug>(omnisharp_code_actions)
    autocmd FileType cs xmap <silent> <buffer> <a-cr> <Plug>(omnisharp_code_actions)

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nmap <silent> <buffer> <Leader>gcc <Plug>(omnisharp_global_code_check)
augroup END

" override codedark from colouring the entire error red
hi error guibg=#1e1e1e
