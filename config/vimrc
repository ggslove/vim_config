" 使用 ln -s $(pwd)/vimrc ~/.vimrc
" 编辑vimrc时，可以使用: source ~/.vimrc 来查看配置后状态 
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
set backspace=2
set number
syntax on 
" colorscheme hybrid
" 按F2进入粘贴模式
set pastetoggle=<F2>
" 高亮搜索
set hlsearch
" 设置折叠方式
set foldmethod=indent


" 设置一些方便的映射
let mapleader=','
" ------- insert 模式映射 ---------

" 在插入模式中 按 ,w 保存
inoremap <leader>w <Esc>:w<cr>
" 使用 jj 在insert 模式退出
inoremap jj <Esc>
" <C-d> 来在插入模式删除一行 并且返回insert模式
inoremap <C-d> <Esc>ddi

" --------- normal 模式映射 ---------

" 切换窗口 直接使用 contrl+ hjkl
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k 
noremap <C-l> <C-w>l
" noremap <C-w> <C-w>w
" 这几个_ | = 好像不能映射
" noremap <C-_> <C-w>_
" noremap <C-|> <C-w>|
" noremap <C-=> <C-w>=
" 在normal模式 按住空格选中单词 
" 这个效果不好 map <space> viw

" json 格式化
" com! FormatJSON %!python3 -m json.tool



" 安装插件
