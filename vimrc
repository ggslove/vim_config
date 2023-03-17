" 使用 ln -s "$(pwd)/vim" ~/.vimrc
" 编辑vimrc时，可以使用: source ~/.vimrc 来查看配置后状态
" 使用 kubectl edit 时如果报错，需要将
" export EDITOR=/usr/bin/vim >> ~/.bashrc

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
" osx 中键盘 删除出现问题
set backspace=2 

" 自动缩进
set ai
" 4个空格
set ts=4
" 将tab转成空格
set et 
autocmd FileType yaml setlocal sw=2 ts=2 et ai


set number
syntax on 
set background=dark
colorscheme hybrid
" 按F2进入粘贴模式
set pastetoggle=<F2>
" 高亮搜索
set hlsearch
" 取消高亮 :noh 
" 设置折叠方式
set foldmethod=indent


" 设置一些方便的映射
let mapleader=','
" ------- insert 模式映射 ---------

" 在插入模式中 按 ,w 保存
"inoremap <leader>w <Esc>:w<cr>
" 使用 jj 在insert 模式退出
inoremap jj <Esc>
" <C-d> 来在插入模式删除一行 并且返回insert模式
" 不用这个了，这个与 shift left tab  冲突
" inoremap <C-d> <Esc>ddi

" --------- normal 模式映射 ---------

" 切换窗口 直接使用 contrl+ hjkl
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k 
noremap <C-l> <C-w>l
" 搜索后按两次 Esc 来取消搜索
noremap <silent> <Esc><Esc> :let @/=""<CR>
noremap <C-p> <C-w>p
"noremap <C-w> <C-w>w
" 这几个_ | = 好像不能映射
" noremap <C-_> <C-w>_
" noremap <C-|> <C-w>|
" noremap <C-=> <C-w>=
" 在normal模式 按住空格选中单词 
" 这个效果不好 map <space> viw

" json 格式化
" com! FormatJSON %!python3 -m json.tool



" 安装插件
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'w0ng/vim-hybrid'
Plug 'preservim/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf',{'dir':'~/.fzf','do':'./install --all'}
Plug 'junegunn/fzf.vim'
Plug 'brooth/far.vim'
" 需要安装 https://docs.ctags.io/en/latest/ 依赖
Plug 'preservim/tagbar'
Plug 'lfv89/vim-interestingwords'
Plug 'rking/ag.vim'



call plug#end()

" --------- NERDTree 配置----------
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" 查找文件在树中位置
nnoremap <C-n> :NERDTreeFind<CR>

let NERDTreeIgnore=[ 
             \ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.pyo$', '\.swp$',
             \ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.ropeproject$',
             \ ]


" ctrlp 
set wildignore+=/tmp/,.so,.swp,*.zip
let g:ctrlp_custom_ignore={
        \ 'dir': '\v[\/]\.(git|hg|svn)$',
         \ 'file': '\v\.(exe|so|dll|swp|pyc|pyo)$'
        \}
let g:ctrlp_user_command='ag %s -l --nocolor --hidden -g ""'
 if executable('ag')
         set grepprg=ag\ --nogroup\ --nocolor
         let g:ctrlp_user_command='ag %s -l --nocolor -f -g ""'
 else
         "let g:ctrlp_user_command=['.git','cd %s && git ls-files . -co --exclude-standard','find %s -type f']
endif

" easymotion 映射
nmap ss <Plug>(easymotion-s2)
let g:far#enable_undo=1

" tagbar 
nnoremap <leader>t :TagbarToggle<CR>

" inentLine
"
set cindent "针对c语言自动缩进
set autoindent " 自动缩进
" set smarttab " 根据文件中国其他缩进空格来确定一个tab多少个空格
set ts=4 "设定tab为4个空格
