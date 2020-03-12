" vim-plug auto setup
if empty(glob('~/.vim/autoload/plug.vim'))
	if has("win32") || has("win64")
		set shell=powershell
		silent !New-Item -ItemType Directory -Force -Path ~/.vim/autoload
		silent !iwr https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -OutFile ~/.vim/autoload/plug.vim
	else
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	endif

	 if v:shell_error
		echom "Error downloading vim-plug. Please install it manually."
		exit
	endif
endif

function! BuildCoc(info)
	if has("win32") || has("win64")
        " coc doesn't work with powershell, only cmd
        set shell=cmd
    endif

    call coc#util#install()
endfunction

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'bronson/vim-trailing-whitespace'
Plug 'moll/vim-bbye'
Plug 'kshenoy/vim-signature'
Plug 'sheerun/vim-polyglot'
Plug 'osyo-manga/vim-over'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'ap/vim-buftabline'
Plug 'junegunn/vim-easy-align'
Plug 'iamcco/markdown-preview.nvim', {'do': { -> mkdp#util#install() }}
Plug 'drewtempelmeyer/palenight.vim'
Plug 'flazz/vim-colorschemes'
Plug 'neoclide/coc.nvim', {'do': function('BuildCoc')}
Plug 'OmniSharp/omnisharp-vim'
Plug 'mhinz/vim-startify'

call plug#end()

" auto install any missing plugins, then load our config
let config = $HOME."/.vim/config.vimrc"
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
	autocmd VimEnter * PlugInstall --sync | q | exec "source ".config
else
	" all plugins loaded, load our config file
	exec "source ".config
endif
