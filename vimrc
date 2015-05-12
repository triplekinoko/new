
syntax enable

set cursorline
set autoindent
set number
set ruler
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<
set incsearch
set hlsearch
set nowrap
set showmatch
set whichwrap=h,l
set nowrapscan
set ignorecase
set smartcase
set hidden
set history=2000
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
set helplang=en
set nowritebackup
set nobackup
set noswapfile
set textwidth=0


colorscheme desert

nnoremap <Space>w  :<C-u>w<CR>
nnoremap <Space>q  :<C-u>q<CR>
nnoremap <Space>Q  :<C-u>q!<CR>
nnoremap <Space>wq  :<C-u>wq<CR>

nnoremap ;  :
nnoremap :  ;
vnoremap ;  :
vnoremap :  ;

nnoremap <Space>h  ^
nnoremap <Space>l  $

nnoremap j   gk
nnoremap k  gj
vnoremap j   gk
vnoremap k   gj
nnoremap gj  k
nnoremap gk  j
vnoremap gj  k
vnoremap gk  j

nnoremap <Space>/  *<C-o>
nnoremap g<Space>/ g*<C-o>

nnoremap <expr> n <SID>search_forward_p() ? 'nzv' : 'Nzv'
nnoremap <expr> N <SID>search_forward_p() ? 'Nzv' : 'nzv'
vnoremap <expr> n <SID>search_forward_p() ? 'nzv' : 'Nzv'
vnoremap <expr> N <SID>search_forward_p() ? 'Nzv' : 'nzv'

function! s:search_forward_p()
  return exists('v:searchforward') ? v:searchforward : 1
endfunction


nnoremap <Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Space>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

nnoremap <silent> tt  :<C-u>tabe<CR>
nnoremap <C-p>  gT
nnoremap <C-n>  gt

nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

nnoremap Q gq


onoremap aa  a>
onoremap ia  i>
onoremap ar  a]
onoremap ir  i]
onoremap ad  a"
onoremap id  i"


inoremap jk  <Esc>

inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
nnoremap gs  :<C-u>%s///g<Left><Left><Left>
vnoremap gs  :s///g<Left><Left><Left>


nnoremap <r> <C-r>
nnoremap <Right> <C-f>
nnoremap <Left> <C-b>
" neobundle settings {{{
if has('vim_starting')
  set nocompatible
    " neobundle をインストールしていない場合は自動インストール
      if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
          echo "install neobundle..."
              " vim からコマンド呼び出しているだけ neobundle.vim のクローン
                  :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
                    endif
                      " runtimepath の追加は必須
                        set runtimepath+=~/.vim/bundle/neobundle.vim/
                        endif
                        call neobundle#begin(expand('~/.vim/bundle'))
                        let g:neobundle_default_git_protocol='https'

                        " neobundle#begin - neobundle#end の間に導入するプラグインを記載します。
                        NeoBundleFetch 'Shougo/neobundle.vim'
                       " ↓こんな感じが基本の書き方
NeoBundleLazy 'tpope/vim-endwise', {
  \ 'autoload' : { 'insert' : 1,}}
  NeoBundle 'Lokaltog/vim-easymotion'
  " vim-easymotion {{{
  let g:EasyMotion_do_mapping = 0
  nmap s <Plug>(easymotion-s2)
  xmap s <Plug>(easymotion-s2)
  omap z <Plug>(easymotion-s2)
  nmap g/ <Plug>(easymotion-sn)
  xmap g/ <Plug>(easymotion-sn)
  omap g/ <Plug>(easymotion-tn)
  let g:EasyMotion_smartcase = 1
  map <Leader>j <Plug>(easymotion-j)
  map <Leader>k <Plug>(easymotion-k)
  let g:EasyMotion_startofline = 0
  let g:EasyMotion_keys = 'QZASDFGHJKL;'
  let g:EasyMotion_use_upper = 1
  let g:EasyMotion_enter_jump_first = 1
  let g:EasyMotion_space_jump_first = 1
  hi EasyMotionTarget guifg=#80a0ff ctermfg=81
  " }}}
 if has('lua')
     NeoBundleLazy 'Shougo/neocomplete.vim', {
         \ 'depends' : 'Shougo/vimproc',
         \ 'autoload' : { 'insert' : 1,}
         \ }
   endif

    "neocomplete {{{
    let g:neocomplete#enable_at_startup               = 1
    let g:neocomplete#auto_completion_start_length    = 3
    let g:neocomplete#enable_ignore_case              = 1
    let g:neocomplete#enable_smart_case               = 1
    let g:neocomplete#enable_camel_case               = 1
    let g:neocomplete#use_vimproc                     = 1
    let g:neocomplete#sources#buffer#cache_limit_size = 1000000
    let g:neocomplete#sources#tags#cache_limit_size   = 30000000
    let g:neocomplete#enable_fuzzy_completion         = 1
    let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
    " }}}
NeoBundle 'LeafCage/yankround.vim'

" yankround.vim {{{
 nmap p <Plug>(yankround-p)
 nmap P <Plug>(yankround-P)
 nmap <C-p> <Plug>(yankround-prev)
 nmap <C-n> <Plug>(yankround-next)
 let g:yankround_max_history = 100
 nnoremap <Leader><C-p> :<C-u>Unite yankround<CR>
 "}}}
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'nathanaelkane/vim-indent-guides' 
" vim-indent-guides
 let g:indent_guides_auto_colors=0
 autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=110
 autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=140
 let g:indent_guides_enable_on_vim_startup=1
 let g:indent_guides_guide_size=1
NeoBundleLazy "davidhalter/jedi-vim", {
  \ "rev" : 'dev',
  \ "autoload": {
  \ "filetypes": [ "python", "python3", "djangohtml"]}}
 
function! InitPython()
      let b:did_ftplugin = 1
        setlocal commentstring=#%s
          command! -nargs=0 JediRename :call jedi#rename()
           
            setlocal shiftwidth=4
              setlocal tabstop=8
                setlocal softtabstop=4
                  setlocal expandtab
                   
                    setlocal autoindent
                      setlocal smartindent
                        setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
                         
                    endfunction
                    autocmd BufEnter * if &filetype == "python" | call InitPython() | endif
                    " pythonのrename用のマッピングがquickrunとかぶるため回避させる
                    " let g:jedi#rename_command = "<Leader><C-r><C-r>"
                    " let g:jedi#documentation_command = "<Leader>k" ]}}


                        " vimrc に記述されたプラグインでインストールされていないものがないかチェックする
                        "
                        NeoBundleCheck
                        call neobundle#end()
filetype plugin indent on
