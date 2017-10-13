"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 定义快捷键的前缀，即<Leader>
let mapleader = ","
" 开启文件类型侦测
filetype on
" 不要使用vi的键盘模式，使用vim自己的
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F5编译和运行程序
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.cpp,*.c,*.sh exec ":call Compile()"

map <F5> :call Compile()<CR>
func! Compile()
	" C的编译和运行
	if &filetype == 'c'	
		exec "w"
		exec "!gcc -Wall % -o %<"
		exec "! ./%<"
	endif
	" C++的编译和运行
	if &filetype == 'cpp' 
		exec "w"
		exec "!g++ -Wall % -o %<"
		exec "! ./%<"
	endif
	"shell的运行
	if &filetype == 'sh'		
		exec "w"
		exec "!bash ./%"
	endif
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"注释,Ctrl-t
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-t> :call Annotation()<CR>
func! Annotation()
exec "s#^#//#g"
endfunc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"删除注释,Ctrl-c 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-c> :call CancelAnnotation()<CR>
func! CancelAnnotation()
exec "s#^//###g"
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"默认打开ctag
let Tlist_Auto_Open=1
"因为我们放在环境变量里，所以可以直接执行
let Tlist_Ctags_Cmd='ctags' 
"让窗口显示在右边，0的话就是显示在左边
let Tlist_Use_Right_Window=0 
"让taglist可以同时展示多个文件的函数列表
let Tlist_Show_One_File=0 
"非当前文件，函数列表折叠隐藏
let Tlist_File_Fold_Auto_Close=1 
"当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Exit_OnlyWindow=1 
"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=1 
"实时更新tags
let Tlist_Inc_Winwidth=0
"按F7生成ctags
map <F8> :! ctags -R --languages=c<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 开启语法高亮功能
syntax enable
" 允许指定语法高亮配色方案替换默认方案
syntax on
" 开启256色支持，默认是8色
set t_Co=256
" 命令行显示输入的命令
set showcmd         
" 命令行显示vim当前模式
set showmode
" 总是显示状态栏
set laststatus=2
" 开启行号显示
set number
" 禁止显示菜单和工具条
set guioptions-=T           
set guioptions-=m           
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 字符间插入的像素行数目
set linespace=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行的距离
set scrolloff=3
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 动态查找
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置自动缩进
set autoindent
" 设置使用C/C++语言的自动缩进方式
set cindent
" 设置C/C++语言的具体缩进方式
set cinoptions=g0,:0,N-s,(0
" 智能的选择对其方式
set smartindent
" 自适应不同语言的智能缩进
filetype indent on
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让vim把连续数量的空格视为一个制表符
set softtabstop=4
" 在行和段开始处使用制表符
set smarttab
" 历史文件中需要记录的行数
set history=1000
" 使用回格键正常处理indent,eol,start等
set backspace=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码折叠，想用就留着
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基于缩进或语法进行代码折叠
" set foldmethod=indent
set foldmethod=manual
" 保存折叠
au BufWinLeave * silent mkview
au BufWinEnter * silent loadview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置,防止乱码
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
" 帮助系统设置为中文
set helplang=cn
" 设置编码格式
set termencoding=utf-8
set encoding=utf8
" 使用utf-8或gbk打开文件
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"c++自动补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/fl
" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

