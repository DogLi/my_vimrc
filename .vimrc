"=============================================================================
"                   FileName: .vimrc                                     
"            /|         Desc: This is the configuration file for vim     
"  --- 8"     |       Author: yuanlinfeng
"   \'  0 。0 !        Email: cxwcylf@126.com                            
"                    Version: 0.0.1
"                 LastChange: 2014-04-26 14:17:08
"                    History:
"=============================================================================

"os detect
if(has('win32') || has('win64') || has('win32unix'))
    let g:isWin=1
else
    let g:isWin=0
endif

"乱码问题{{{1
"--------------------------------------------------------------------------------------
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
source $VIMRUNTIME/delmenu.vim "解决encoding后出现的菜单乱码
source $VIMRUNTIME/menu.vim "再次读取缺省菜单
language messages zh_CN.utf-8 "解决console和界面的乱码


"--------------------------------------------------------------------------------------
"显示相关{{{1
"--------------------------------------------------------------------------------------
"set lines=45 columns=110
set colorcolumn=100                            "在80行处显示颜色竖条
set cmdheight=1
set guifont=AR\ PL\ UKai\ CN\ 13            "设置字体
set linespace=2                               "行间距
set scrolloff=5                               "向上下滚动时,至少显示5行
set number                                    "显示行号
"set textwidth=100                             "设置文本宽度为80,对于已经存在的文本,选中后按gq就可以了
" set nowrap                                      "设置自动折行
set showcmd                                   "显示命令
"set cursorcolumn
set cursorline                                "高亮光标行
set ambiwidth=double                          "默认用窄字符,防止无法显示某些字符
set lbr                                       "不在单词中间段行
set selectmode=mouse,key                      "可以用鼠标和键盘进入选择模式
set iskeyword+=_,$,@,%,#,-                    "带有上述符号的单词不能被换行分割
let g:vimim_disable_chinese_punctuation=1     "关闭中文标点
let g:vimim_disable_seamless_english_input=1  "中英文之间不加标点
set formatoptions+=mB                         "使中文也能自动换行
set helplang=cn
" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
if has("gui_running")
    set guioptions+=b  "隐藏底部滚动条
    set guioptions+=e  "打开gui标签页支持
    set showtabline=2  "指定合适显示标签页行，0永远不显示，1至少有两个标签，2永远显示
endif
set listchars=tab:\ \ ,trail:.,extends:>,precedes:<             " 制表符显示方式定义：trail为拖尾空白显示字符，extends和precedes分别是wrap关闭时，所在行在屏幕右边和左边显示的指示字符

"--------------------------------------------------------------------------------------
"操作设置{{{1
"--------------------------------------------------------------------------------------
set lazyredraw
autocmd! bufwritepost .vimrc source % " vimrc文件修改之后自动加载。 linux。
"set nobackup
"set nowritebackup
"set noswapfile
"set autochdir "Automatically cd into the directory
set formatoptions=tcrqn "自动格式化
set mouse=a                         "使用鼠标=a
set confirm  "在处理未保存或者只读文件的时候，弹出确认
set backspace=indent,start,eol "<Bsc>可以删除上一行的换行符,并使两行合并
let Tlist_Exist_OnlyWindow = 1 "如果只有一个buffer，kill窗口也kill掉buffer
set whichwrap=b,s,<,>,[,],h,l
set smarttab "按一下<Bsc>就可以删除tab
set noerrorbells  "让命令行不发出滴滴
set nocompatible "避免与vi的兼容性
set nosol    "行间移动时尽量在同一列
set splitright "窗口分割方向
"设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
"set t_ti= t_te=
" 修复ctrl+m 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
set selection=inclusive
set selectmode=mouse,key
" 备份,到另一个位置. 防止误删
set backup
"set backupext=.bak
set backupskip=/tmp/*
set backupdir=~/.vim-backup
set directory=~/.vim-backup
set writebackup
set undolevels=1000
if v:version > 730
    set undofile
    set undoreload=1000
    if g:isWin
        set undodir=$VIM/bak/vimundo/
    else
        set undodir=~/.vim/vimundo/
    endif 
endif

"--------------------------------------------------------------------------------------
"查找相关设置{{{1
"--------------------------------------------------------------------------------------
set ignorecase smartcase " 智能调整大小写检查
set hlsearch "高亮显示搜索结果
set incsearch "搜索时根据键入的字母实施显示查找结果
"set gdefault "替换时所有的行匹配都被替换,而不是有第一个
set nowrapscan
set wildignore=*.swp,*.bak,*.pyc,*~,*.svn
set cscopequickfix=s-,c-,d-,i-,t-,e-

"--------------------------------------------------------------------------------------
"错误自动更改{{{1
"--------------------------------------------------------------------------------------
"iabbrev Mymail zsz921130@gmail.com
"cabbrev a b "命令模式下将a 映射为b
"abbreviate a b "所有模式下,将a映射为b
"另一种方法,将要映射的单词放入一个文件内，然后souce该文件
abbreviate teh the 
abbreviate mian main
abbreviate slef self
abbreviate retrun return
abbreviate improt import
abbreviate pirnt print
abbreviate mian() main()
abbreviate imput input 
abbreviate ture true
abbreviate Ture True
"--------------------------------------------------------------------------------------
"编程相关设置{{{1
"--------------------------------------------------------------------------------------
filetype off                                 "文件类型
filetype plugin on
filetype indent on
set autoindent                              "自动换行
set wildmenu                                "自动补全命令
set wildignore=*.o,*~,*.pyc,*.class
set cindent                                 "C/C++自动缩进
syntax on                                   "语法检测打开
"set tags=/home/bingoboy/Nutstore/code/tags
set showmatch
set matchtime=2                             "匹配括号高亮的时间,单位是1/10秒
set shiftwidth=4
set softtabstop=4
set ai!                                     "设置自动缩进
set expandtab                               "将tab转化为空格
retab                                       "将已有tab转化为空格
set nopaste                                 "复制代码时不自动缩进         
set tags=./tags;/,~/.vim/tags path=.,/usr/local/include,/usr/include
"function FuncHead()
    "call setline(1,"/**********************************************")
    "call append(line("."),"*函数名称：  ")
    "call append(line(".")+1,"*功能:  ")
    "call append(line(".")+2,"*返回值:  ".expand("%"))
    "call append(line(".")+3,"*其他:  ")
    "call append(line(".")+4,"**********************************************/")
"endf
"map <home> <Esc>:call FuncHead()<CR>

"--------------------------------------------------------------------------------------
"代码折行{{{1
"--------------------------------------------------------------------------------------
"set foldmarker={,}
"set foldmethod=marker
"set foldmethod=syntax
set foldmethod=indent
set foldlevel=20 "Don't autofold anything(but i can still fold manually)
set foldopen+=search " open folds when you search into them
set foldopen+=undo   "open folds when you undo stuff
set foldcolumn=3 "用最左边4列显示fold的信息



"--------------------------------------------------------------------------------------
"状态栏设置{{{1
"--------------------------------------------------------------------------------------
let g:Powerline_symbols = 'fancy'
set laststatus=2
set t_Co=256 "颜色设置

"--------------------------------------------------------------------------------------
"主题设置{{{1
"--------------------------------------------------------------------------------------
"
"set background=dark
"let g:lucius_style = 'dark' " or 'light'
syntax enable

set background=dark
let g:airline_powerline_fonts=1
"colorscheme solarized
"let g:solarized_termcolors=256

"colorscheme lucius
"if (strftime("%H")< 6 + '0' ) "凌晨
    "LuciusDark
"elseif((strftime("%H")>(8+'0')) && (strftime("%H")<(13 + '0'))) "上午
    "LuciusBlackLowContrast
"elseif((strftime("%H")>(13+'0')) && ((strftime("%H")<18 + '0'))) "下午
    "LuciusBlackLowContrast
"elseif (strftime("%H") > 18 + '0')  "晚上
    "LuciusDark
"endif
"LuciusDark (dark default)
"LuciusDarkHighContrastd
"LuciusDarkLowContrastd
"LuciusBlackd
"LuciusBlackHighContrastd
"LuciusBlackLowContrastd

"LuciusLight (light default)
"LuciusLightLowContrastd
"LuciusWhited
"LuciusWhiteLowContrastd


colorscheme molokai
let g:rehash256 = 1
let g:molokai_original = 0

"================错误提示错误提示错误提示======================{{{2

match ErrorMsg /\%>100v.\+/ "每行字数超过100就显示红色
"合法IP地址显示
"match todo /\(\(25[0-5]\|2[0-4][0-9]\|[01]\?[0-9] [0-9]\?\)\.\) \{3\}\(25[0-5]\|2[0-4][0-9]\|[01]\?  [0-9][0-9]\?\)/ 
"非法IP地址显示红色
match errorMsg /\(2[5][6-9]\|2[6-9][0-9]\|[3-9][0-9][0-9]\)[.]\[0-9]\{1,3\}[.][0-9]\{1,3\}[.][0-9]\{1,3\}\|\[0-9]\{1,3\}[.]\(2[5][6-9]\|2[6-9][0-9]\|\
            \\ \[3-9][0-9][0-9]\)[.][0-9]\{1,3\}[.][0-9]
            \\{1,3\}\|\[0-9]\{1,3\}[.][0-9]\{1,3\}[.]\(2[5]
            \\ \[6-9]\|\2[6-9][0-9]|[3-9][0-9][0-9]\)[.][0-9]\{1,3\}
            \\|[0-9]\{1,3\}[.][0-9]\{1,3\}[.][0-9]\{1,3\}[.]
            \\(2[5][6-9]\|2[6-9][0-9]\|\[3-9][0-9][0-9]\)/



"--------------------------------------------------------------------------------------
"查看XXX映射文件：verbose map XXX
"Map{{{1
let mapleader = ","
"================== normal mode ======================{{{2
map <Left> :bn<cr>
map <Right> :bp<cr>
"nnoremap <right> gt    "到下一个tabe页
map <Up> :CtrlP<cr>
map <Down> :CtrlPBuffer<cr>
nnoremap <C-F5> :!rs_check<cr> "同步文件到服务器
nnoremap wv <C-w>v     "垂直分割当前窗口
nnoremap wc <C-w>c     "关闭当前窗口
nnoremap ws <C-w>s     "水平分割当前窗口
nnoremap <C-h> <C-w>h  "到左边的一个window
nnoremap <C-j> <C-w>j  "到下边的一个window latex_vim中的<C-J>用<C-G>代替 用verbose map <c-g> 查看
nnoremap <C-k> <C-w>k  "到上边的一个window
nnoremap <C-l> <C-w>l  "到右边的一个window
nnoremap j gj
nnoremap k gk
"让编辑模式可以中文输入法下按：转到命令模式
nnoremap ： :
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr> 

map <Leader>ch :call SetColorColumn()<CR>
function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
if count(cc_list, string(col_num)) <= 0
    execute "set cc+=".col_num
else
    execute "set cc-=".col_num
endif
endfunction
map "" maviwS"`a
map '' maviwS'`a
map )) maviwS)`a
map ]] maviwS]`a
map d" ds"
map d' ds'
map d) ds)
map d] ds]


noremap <F1> <Esc>
set pastetoggle=<F2>
" tab 操作
" TODO: ctrl + n 变成切换tab的方法
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim
"map <C-2> 2gt
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>


" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
" TODO: 配置成功这里, 切换更方便, 两个键
 nnoremap <C-S-tab> :tabprevious<CR>
 nnoremap <C-tab>   :tabnext<CR>
 inoremap <C-S-tab> <Esc>:tabprevious<CR>i
 inoremap <C-tab>   <Esc>:tabnext<CR>i
 nnoremap <C-Left> :tabprevious<CR>
 nnoremap <C-Right> :tabnext<CR>

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
vnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()

vnoremap < <gv
vnoremap > >gv

"================== insert mode ======================{{{2
" imap  ..   <Right>
imap  ''   <Right>
" imap  ,,   <Left>
imap  ;;   <Left>

"================== all mode ======================={{{2
"map <C-b>           <home>
"map <C-e>           <end>

"function! CompileRun()
"exec "w"
"if(&filetype=='java')
    "exec "!javac %"
    "exec "!java ./%<"
"elseif(&filetype=='sh')
    "exec "!chmod a+x %"
    "exec "!./%"
"elseif(&filetype=='python')
    "exec "!python %"
"elseif
  "echo "error:The filetype is not included!"
"endif 
"endfunc 

"function DoOneFileMake()
"if(expand("%:p:h")!=getcwd())
    "echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press redirect to the dir of this file."
"endif
"exec "w"
"call SetCompilation()
"exec "make"
"exec "copen"
"endfunction

"function SetCompilation()
"if &filetype=='c'    
    "set makeprg=gcc\ %\ -o\ %<
"elseif &filetype=='cpp'
    "set makeprg=g++\ %\ -o\ %<
"endif
"endfunction

"map <C-F5> :call CompileRun()<cr>
""ctrl+F6一键make C/C++程序
"nmap <C-F6> :call DoOneFileMake()<CR><CR>
map <leader>1 1gt  
map <leader>2 2gt  
map <leader>3 3gt  
map <leader>4 4gt  
map <leader>5 5gt  
map <leader>6 6gt  
map <leader>7 7gt  
map <leader>8 8gt  
map <leader>9 9gt  
"============设置<Fn>快捷键==============={{{2
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <silent><F6> :TagbarToggle<CR>
nnoremap <f7> :UndotreeToggle<cr>
nnoremap <f8> :YRShow<CR>
"================
 nmap <F9> :SCCompile<cr>
nnoremap <f3> :lnext<cr>
nnoremap <f4> :lprevious<cr>
"============gvim使用ctr+F1显示/取消工具栏===============
set guioptions-=m
set guioptions-=T
map <silent> <C-F1> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <Bar>
        \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
        \endif<CR>


"============== 按ctrl+F3把所有buffer变成tab显示出来=========
let notabs = 1  
nnoremap <silent> <C-F3> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR> 




"============== 按 ,1 ,2 ,3等跳到相应的tab================{{{2

"}}}
"}}}

"插件相关{{{1
"--------------------------------------------------------------------------------------
"Vundle 插件管理软件{{{
set tabstop=2  
set completeopt=menu  
"此处规定Vundle的路径
set rtp+=~/.vim/bundle/vundle/  
"此处规定插件的安装路径
call vundle#rc()  
Bundle 'davidhalter/jedi'
Bundle 'mbbill/fencview'
Bundle 'gmarik/vundle'  
Bundle 'Valloric/YouCompleteMe'  
Bundle 'scrooloose/syntastic'  
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'tpope/vim-repeat'
Bundle 'Yggdroot/indentLine'
Bundle 'scrooloose/nerdcommenter'
Bundle 'terryma/vim-expand-region'
"Bundle 'vim-multiple-cursors'
"Bundle 'scrooloose/nerdtree'
Bundle 'airblade/vim-gitgutter'
Bundle 'Xuyuanp/git-nerdtree'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'erikw/tmux-powerline'
"Plugin 'bling/vim-airline'
"Bundle 'spiiph/vim-space'
Bundle 'tpope/vim-surround'
"Bundle 'godlygeek/tabular'
Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/Mark--Karkat'
"Bundle 'vim-scripts/ZoomWin'
"Bundle 'vim-scripts/YankRing.vim'
Bundle 'vim-scripts/EasyGrep'
Bundle 'mileszs/ack.vim'
"Easily interact with tmux from vim 
Bundle 'benmills/vimux' 
"git wrapper
Bundle 'tpope/vim-fugitive' 
"Compile or run a single source file without leaving Vim
Bundle 'xuhdev/singleCompile' 
"Provide your Vim's buffer with the outline view
Bundle 'h1mesuke/unite-outline' 
"Provides automatic closing of quotes, parenthesis, brackets, etc.
Bundle 'Raimondi/delimitMate' 
"integrates Python documentation system into Vim
Bundle 'fs111/pydoc.vim'
Bundle 'tell-k/vim-autopep8'
"Bundle 'alfredodeza/pytest.vim'
Bundle 'mbbill/undotree'

Bundle 'ihacklog/AuthorInfo'
"colorscheme
Bundle 'altercation/vim-colors-solarized'

"Bundle 'tmhedberg/matchit'
Plugin 'junegunn/vim-easy-align' "对齐
""代码片
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'terryma/vim-multiple-cursors' "多word编辑
"}}}

"python{{{
let OPTION_NAME=1
"}}}

"括号显示增强{{{
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
"}}}

"nerdtree{{{
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
let NERDTreeQuitOnOpen=0
"}}}

"indentLine {{{
let g:indentLine_noConcealCursor = 1
let g:indentLine_color_term = 0
let g:indentLine_char = '¦'
"}}}

"load_template 模板插件{{{
let g:template_load = 1
let g:template_tags_replacing = 1
let g:T_AUTHOR = "yuanlinfeng"
let g:T_AUTHOR_EMAIL = "cxwcylf@126.com"
let g:T_AUTHOR_WEBSITE="www.woqutech.com"
let g:T_DATE_FORMAT="%Y-%m-%d %H:%M%S"
"}}}

"{{{ undotree
if has("persistent_undo")
    set undodir='~/.vim-undodir/'
    set undofile
endif
"}}}

"tagbar  成员、函数信息栏{{{2
"let tagbar_left=1
let tagbar_autofocus=0
let g:tagbar_expand=1
let g:tagbar_foldlevel=2
let g:tagbar_autoshowtag=1
let g:tagbar_width=25
"}}}

"showmarks   高亮mark行{{{
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1
"}}}

"Indent Guides{{{   显示对齐线
"version 1.6 2012-01-01
"默认快捷键<mapleader>ig

let g:indent_guides_guide_size=1

""let g:indent_guides_auto_colors = 0 
""autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3 
""autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"}}}

"NERD_commenter  注释插件{{{
"<leader>ca ->在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
"<leader>cc ->注释当前行
"<leader>cs ->以”性感”的方式注释
"<leader>cA ->在当前行尾添加注释符，并进入Insert模式
"<leader>cu ->取消注释
"<leader>cm ->添加块注释
"<leader>c<space> ->注释/取消注释
"<leader>ci ->注释选中行
"<leader>cs ->性感的方式注释
"}}}

"matchit    快速跳转到配对符号的标签{{{
"version 1.13.2 2008-01-29
"let g:loaded_matchit=1
"}}}

"authorinfo.vim      自动添加作者信息{{{
"（需要和NERD_commenter联用)使用,:AuthorInfoDetect呼出
"version 1.5        2011-08-18
let g:vimrc_author='linfeng.yuan' 
let g:vimrc_email='linfeng.yuan@woqutech.com' 
let g:vimrc_homepage='www.woqutech.com' 
"}}}

"fencview   自动检测文件编码 {{{
"version 4.8 2012-02-04 id = 1708
"Tools->Encoding->Auto Detect" or use this command: :FencAutoDetect
"}}}

"menus of SingleCompile to show in the menu bar{{{
 let g:SingleCompile_menumode = 2
 "}}}

"ctrlp 文件搜索{{{
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
    \ }
"\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
"}}}

"delimitMate,自动补全{{{
" for python docstring ",优化输入
au FileType python let b:delimitMate_nesting_quotes = ['"']

"BreakLine: Return TRUE if in the middle of {} or () in INSERT mode
fun BreakLine()
  if (mode() == 'i')
    return ((getline(".")[col(".")-2] == '{' && getline(".")[col(".")-1] == '}') ||
          \(getline(".")[col(".")-2] == '(' && getline(".")[col(".")-1] == ')'))
  else
    return 0
  endif
endfun

" Remap <Enter> to split the line and insert a new line in between if
" BreakLine return True
inoremap <expr> <CR> BreakLine() ? "<CR><ESC>O" : "<CR>"
"}}}

"Yankring {{{
let g:yankring_history_dir='~/.vim/bundle/YankRing.vim'
"}}}

"rainbow_parenthese{{{
map <leader>e  :RainbowParenthesesToggle<cr>
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
"}}}

"Tmux{{{
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vc :CloseVimTmuxPanes<CR>
map <Leader>vi :VimuxInterruptRunner<CR>
"}}}

"################# 具体语言语法高亮 ###############{{{

" for python.vim syntax highlight
 Bundle 'hdima/python-syntax'
 let python_highlight_all = 1

" for golang
" Bundle 'jnwhiteh/vim-golang'

" for markdown
" Bundle 'plasticboy/vim-markdown'
" let g:vim_markdown_folding_disabled=1

" for javascript
"Bundle 'pangloss/vim-javascript'
"let g:html_indent_inctags = "html,body,head,tbody"
"let g:html_indent_script1 = "inc"
"let g:html_indent_style1 = "inc"

"for jquery
"Bundle 'nono/jquery.vim'

"for jinja2 highlight
" Bundle 'Glench/Vim-Jinja2-Syntax'

"for nginx conf file highlight.   need to confirm it works
"Bundle 'thiderman/nginx-vim-syntax'

" for markdown
Plugin 'plasticboy/vim-markdown'
"}}}

""syntastic语法检查{{{
set statusline-=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers=['pylint']
"let g:syntastic_ignore_files=[".*\.py$"]

"set error or warning signs  
let g:syntastic_warning_symbol = '>!'
let g:syntastic_error_symbol = '✗'
let g:syntax_loc_list_height = 6
" let g:syntastic_cpp_remove_include_errors = 1  
" let g:syntastic_cpp_check_header = 1  
" let g:syntastic_cpp_compiler = 'clang++'  
"whether to show balloons  
let g:syntastic_enable_balloons = 1  
let g:syntastic_auto_jump = 2
" highlight SyntasticStyleWarningSign guifg=white guibg=#F78615
" highlight SyntasticWaring guibg=#F78615
"}}}

"YouCompleteMe 代码补全插件{{{
let g:ycm_collect_identifiers_from_tags_files = 1  
let g:ycm_seed_identifiers_with_syntax = 0  
let g:ycm_confirm_extra_conf = 0  
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '>!'  
"let g:ycm_filetype_specific_completion_to_disable = {'python':1, 'txt':1}
let g:ycm_filetype_blacklist = {
    \ 'tagbar' : 1,
    \ 'qf' : 1,
    \ 'notes' : 1,
    \ 'markdown' : 1,
    \ 'unite' : 1,
    \ 'text' : 1,
    \ 'vimwiki' : 1,
    \ 'pandoc' : 1,
    \ 'mail' : 1
    \}
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"}}}

"   vim:foldmethod=marker foldlevel=1 textwidth=100
"   上传代码到cn服务器
