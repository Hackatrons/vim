" vim-plug auto setup
" https://gist.github.com/AdnoC/88707d795018244bbf32
let s:vimDirectory=expand("$HOME/.vim")

" Download the manager if it isn't yet.
if empty(glob(expand(s:vimDirectory . '/autoload/plug.vim')))
    if executable("curl")
        silent exec '!curl -fLo ' . shellescape(expand(s:vimDirectory."/autoload/plug.vim")) .
                    \ ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    elseif executable("wget")
        " wget can't make folders on its own, so we need to make .vim/autoload for it
        if executable("mkdir")
            silent exec '!mkdir -p ' . shellescape(expand(s:vimDirectory."/autoload/"))
        endif
        silent exec '!wget -q -O ' . shellescape(expand(s:vimDirectory."/autoload/plug.vim")) .
                    \ '  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

        " If we are on Windows we can use Powershell to download it
    elseif executable("powershell")
        silent exec '!if not exist ' . shellescape(expand(s:vimDirectory)) . ' mkdir ' .
                    \ shellescape(expand(s:vimDirectory."/autoload/"))
        silent exec '!powershell "(new-object System.Net.WebClient).DownloadFile(''https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'',''' .
                    \ shellescape(expand(s:vimDirectory."/autoload/plug.vim")) . ''')"'

        " If all else fails we can just use git.
    elseif executable("git")
        silent exec '!git clone -q --depth=1 git@github.com:junegunn/vim-plug.git ' .
                    \ shellescape(expand(s:vimDirectory."/temp"))

        " Use the correct commands to move/delete files/folders
        if has('gui_win32')
            let s:mv="move "
            let s:rm="del "
        else
            let s:mv="mv "
            let s:rm="rm -rf "
        endif

        silent exec '!' . s:mv . shellescape(expand(s:vimDirectory."/temp/plug.vim")) .
                    \ ' ' . shellescape(expand(s:vimDirectory."/autoload/plug.vim"))
        silent exec '!' . s:rm . shellescape(expand(s:vimDirectory."/temp/"))

    else
        echo "Couldn't find a way to download Vim-Plug."
    endif
endif

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'bronson/vim-trailing-whitespace'
Plug 'moll/vim-bbye'
Plug 'kshenoy/vim-signature'
Plug 'sheerun/vim-polyglot'
Plug 'osyo-manga/vim-over'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'
Plug 'ap/vim-buftabline'
Plug 'junegunn/vim-easy-align'
Plug 'iamcco/markdown-preview.nvim', {'do': 'call mkdp#util#install()' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'flazz/vim-colorschemes'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile' }
Plug 'mhinz/vim-startify'

call plug#end()

function LoadConfig()
    " all plugins loaded, load our config file
    for f in glob('~/.vim/config/**/*.vim', 0, 1)
        execute 'source' f
    endfor
endfunction

" auto install any missing plugins, then load our config
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    autocmd VimEnter * PlugInstall --sync | q | call LoadConfig()
else
    call LoadConfig()
endif
