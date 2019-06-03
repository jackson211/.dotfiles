" Settings
set ruler
set number
set showcmd
set tabstop=2 shiftwidth=2 expandtab
set showmatch
set encoding=utf-8
set laststatus=2
set hlsearch

" Indent
au BufNewFile,BufRead *.py
    \ set tabstop=4            |
    \ set softtabstop=4        |
    \ set shiftwidth=4         |
    \ set textwidth=79         |
    \ set expandtab            |
    \ set autoindent           |
    \ set fileformat=unix      |
	\ let python_highlight_all=1 |

"Parenthesis and Brackets
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf

" Colorscheme
syntax enable

" Spelling
nnoremap <space>ss :setlocal spell!<cr>
function! FixLastSpellingError()
  normal! mm[s1z=`m"
endfunction
nnoremap <space>sp :call FixLastSpellingError() <cr> 
nnoremap <space>sop :source %<cr>

" Markdown Underline
function! UnderlineHeading(level)
  if a:level == 1
    normal! yypVr=
  elseif a:level == 2
    normal! yypVr-
  else
    normal! I###<space>
  endif
endfunction

nnoremap <space>u1 :call UnderlineHeading(1);
nnoremap <space>u2 :call UnderlineHeading(2);
nnoremap <space>u3 :call UnderlineHeading(3);

nnoremap <space>pdf :! pandoc -s -t latex % -o %<.pdf<CR>

"Latex
let g:livepreview_previewer = 'open -a Preview'

"Powerline
let g:Powerline_symbols = 'unicode'
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

