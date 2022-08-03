" show lightline even when only single file is open
set laststatus=2

" hide the inbuilt mode display
set noshowmode
let g:lightline = {
            \	'colorscheme': 'palenight',
            \	'separator': { 'left': '', 'right': '' },
            \	'subseparator': { 'left': '|', 'right': '|' },
            \	'active': {
                \		'left': [
                    \			[ 'mode', 'paste' ],
                    \			[ 'cocstatus', 'fugitive', 'readonly', 'filename', ] ]
                    \	},
                    \	'component_function': {
                        \		'fugitive': 'LightLineFugitive',
                        \		'readonly': 'LightLineReadonly',
                        \		'modified': 'LightLineModified',
                        \		'filename': 'LightLineFilename',
                        \       'cocstatus': 'coc#status',
                        \	},
                        \}

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

function! LightLineModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

function! LightLineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "x"
    else
        return ""
    endif
endfunction

function! LightLineFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction
