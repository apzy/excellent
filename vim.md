先将文件移到.vim目录下

`cd ~/.vim/tags`

`ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ cpp_src`

`mv tags cpp`

在vim下执行命令

`set nocp`

`filetype plugin on`

`set ofu=syntaxcomplete#Complete`

