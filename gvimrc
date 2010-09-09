" Last Change: 2009-11-13 17:21:06
"判斷系統是否具有“自動命令”（autocmd）的支持
if has('autocmd')
"清除所有的自動命令，以方便調試
au!
"對於後綴為“.asm”的文件，認為其是微軟的 Macro Assembler 格式
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
endif
" 載入文件類型插件
filetype plugin on 
" 為特定文件類型載入相關縮進文件
filetype indent on 
" colorscheme railscasts
" colorscheme fruidle
" colorscheme gemcolors 
" colorscheme night
colorscheme twilight
"語法樣式開啟
syntax on
"設置字體大小
set guifont=Monaco
"當使用了圖形界面，並且環境變量 LANG 中不含“.”（即沒有規定編碼）時，把 Vim 的內部編碼設為 UTF-8
"set encoding=utf-8
"設置縮進
set sw=2
set ts=2
set softtabstop=2
set expandtab
" history文件中需要記錄的行數
set history=100 
" 帶有如下符號的單詞不要被換行分割
set iskeyword+=_,$,@,%,#,- 
" 高亮顯示普通txt文件（需要txt.vim腳本）
au BufRead,BufNewFile *  setfiletype txt 
"不需要保持和 vi 非常兼容
"set nocompatible
"執行 Vim 缺省提供的 .vimrc 文件的示例，包含了打開語法加亮顯示等最常用的功能
"source $VIMRUNTIME/vimrc_example.vim
" 使backspace正常處理indent, eol, start等
set backspace=indent,eol,start whichwrap+=<,>,[,]
" 允許backspace和光標鍵跨越行邊界
set whichwrap+=<,>,h,l 
"在輸入命令時列出匹配項目，也就是截圖底部的效果
set wildmenu
"打開自動縮,繼承前一行的縮進註釋 進
set autoindent
"默認情況下手動折疊
set foldmethod=manual
"顯示行號（否：nonumber）
set number
"顯示光標的坐標
set ruler
"不自動換行(否：wrap)
set nowrap
"缺省不產生備份文件
set nobackup
" 不要生成swap文件
set noswapfile
"set bufhidden=hide
"在輸入括號時光標會短暫地跳到與之相匹配的括號處，不影響輸入
set showmatch
" 匹配括號高亮的時間（單位是十分之一秒）
set matchtime=1
" 搜索時不區分大小寫
" set ignorecase
" 在搜索時，輸入的詞句的逐字符高亮（類似firefox的搜索）
set incsearch
" 搜索高亮
set hlsearch
" 不要閃爍
set novisualbell 
"正確地處理中文字符的折行和拼接
set formatoptions+=mM
"文件 UTF-8 編碼
set fileencodings=utf-8
"設置文件格式為unix
set fileformat=unix
"開啟命令顯示
set showcmd
"設置窗口大小
set lines=35
set columns=160
" 啟動的時候不顯示那個援助索馬里兒童的提示
set shortmess=atI 
" 導出 html 設置
let html_use_css = 1
let html_number_lines = 0
let use_xhtml = 1

"隱藏底部滾動條
set guioptions-=b
"隱藏右邊滾動條
set guioptions-=R
set guioptions-=r
"隱藏左邊滾動條
set guioptions-=l
set guioptions-=L
"隱藏菜單欄
set guioptions-=m
"隱藏工具欄
set guioptions-=T


"設置Ctrl+F12呼出菜單欄
function! ToggleMenuBar()
	echo "ToggleMenuBar"
	if &guioptions =~# 'm'
		set guioptions-=m
	else
		set guioptions+=m
	endif
endfunction
imap <silent> <C-F12> <C-O>:call ToggleMenuBar()<CR>
map <silent> <C-F12> :call ToggleMenuBar()<CR>

"設置工作目錄
function! CHANGE_CURR_DIR()
let _dir = expand("%:p:h")
exec "cd " . _dir
unlet _dir
endfunction
autocmd BufEnter * call CHANGE_CURR_DIR()

" NERDTree插件的快捷鍵
imap <silent> <F7> <esc>:NERDTreeToggle<CR>
nmap <silent> <F7> :NERDTreeToggle<CR>
" BufExplorer 快捷鍵 {{{
imap <silent> <F8> <esc>:BufExplorer<CR>
nmap <silent> <F8> :BufExplorer<CR>
" }}}

"CTRL-[ and CTRL-] indent and unindent blocks {{{
"  inoremap <C-[> <C-O><LT><LT>
" inoremap <C-]> <C-O><GT><GT>
"  nnoremap <C-[> <LT><LT>
"  nnoremap <C-]> <GT><GT>
"  vnoremap <C-[> <LT>
"  vnoremap <C-]> <GT>
"}}}

" NERD Commenter {{{
let NERDSpaceDelims = 1
map <M-/> <Plug>NERDCommenterToggle
imap <M-/> <C-O><Plug>NERDCommenterToggle
" }}}

" 窗口區域切換,Ctrl+↑↓←→  來切換
imap <silent> <C-left> <esc><C-W><left>
vmap <silent> <C-left> <esc><C-W><left>
nmap <silent> <C-left> <C-W><left>
imap <silent> <C-right> <esc><C-W><right>
vmap <silent> <C-right> <esc><C-W><right>
nmap <silent> <C-right> <C-W><right>
imap <silent> <C-up> <esc><C-W><up>
vmap <silent> <C-up> <esc><C-W><up>
nmap <silent> <C-up> <C-W><up>
imap <silent> <C-down> <esc><C-W><down>
vmap <silent> <C-down> <esc><C-W><down>
nmap <silent> <C-down> <C-W><down>

" delete hack
nmap <silent> <del> "_x
vmap <silent> <del> "_x
nmap <silent> dd V<del>
nmap <silent> dw viw<del>
vmap <silent> dw iw<del>


" Textmate alt-p & alt+l {{{
inoremap <M-p> params[:]<left>
inoremap <M-j> session[:]<left>
inoremap <M-l> <space>=><space>
inoremap <M->> <%=<space><space>%><left><left><left>
" shift+alt+l 選擇行
inoremap <M-L> <C-O><home>v<S-end>
nnoremap <M-L> <home>v<S-end>
" shift+alt+k 刪除行
inoremap <M-K> <C-O><home>v<S-end><del>
nnoremap <M-K> <home>v<s-end><del>
" ctrl + c,a,v,x,z
nnoremap <BS> d
" ctrl + a
noremap <C-A> ggVG
inoremap <C-A> <C-O>ggVG
" ctrl + s

imap <C-s> <esc>:w<CR>:echo expand("%f") . " saved."<CR>
vmap <C-s> <esc>:w<CR>:echo expand("%f") . " saved."<CR>
nmap <C-s> :w<CR>:echo expand("%f") . " saved."<CR>

" ctrl + n
imap <C-n> <esc>:enew!<CR>
nmap <C-n> :enew!<CR>
vmap <C-n> <esc>:enew!<CR>
" ctrl + c
vmap <C-c> "+y
" ctrl + x
vmap <C-x> "+x
" ctrl + z
inoremap <C-z> <C-O>u
nnoremap <C-z> u
" ctrl + y
inoremap <C-y> <C-O><C-R>
nnoremap <C-y> <C-R>
" ctrl + v
nnoremap <C-v> "+gP
inoremap <C-v> <C-O>"+gP
" ctrl + f
imap <C-f> <esc>:/
nmap <C-f> :/
" ctrl + r
imap <C-r> <esc>:%s/
vmap <C-r> <esc>:%s/
nmap <C-r> :%s/
" ctrl + o
imap <C-o> <C-O>:e
vmap <C-o> <esc>:e
nmap <C-o> :e 
"}}}

let g:acp_enableAtStartup = 1
" 自動完成設置 禁止在插入模式移動的時候出現 Complete 提示
let g:acp_mappingDriven = 1
let g:acp_ignorecaseOption = 0
" 自動完成設置為 Ctrl + p 彈出
let g:acp_behaviorKeywordCommand = "\<C-p>"
let g:acp_completeoptPreview = 0
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

