" vim: nowrap foldmethod=marker
" The above command turns on folding for vim files.
" See

" Many of these commands came from the FAQ file of the vim-ruby gem
" /usr/lib/ruby/gems/1.8/gems/vim-ruby-2007.05.07/FAQ
"
" See also
"   https://github.com/nelstrom/dotfiles/blob/master/vimrc
" which is nelstrom's .vimrc - he's the guy behind vimcasts.com
"
" This is fine, turns on the vim stuff and turns off the old vi compat stuff.
" See
"   :help compatible
" for more details
set nocompatible        " We're running Vim, not vi!

" Load plugins that ship with Vim {{{1
runtime macros/matchit.vim
runtime ftplugin/man.vim

" Pathogen allows installation of vim bundles in their own directories,
" which is a very good thing.
" See http://www.vim.org/scripts/script.php?script_id=2332
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect() 
" We could regenerate helptags each time we start vim - I chose not to do this
" (usually)
call pathogen#helptags()




syntax on               " Enable syntax highlighting
"  the syntax on also enables filetype, so the next line is not necessary:
"filetype on             " Enables filetype detection
"  this loads $VIMRUNTIME/filetype.vim which defines autocommands
"  for the BufNewFile and BufRead events.
filetype indent on      " Enable filetype-specific indenting
filetype plugin on      " Enable filetype-specific plugins
"  see 
"    :help filetype
"  for more details.
"
" hmmm... this should be ruby specific...
" need to check my ruby plugins, and put this in an augroup
" if it's still necessary.
compiler ruby           " Enable compiler support for ruby
" See also
" http://wiki.rubyonrails.org/rails/pages/HowtoUseVimWithRails


" See
"   :help highlight
" for more details. I think I added these when I was using a black background
" on xterms. Not sure if still needed, could probably be cleverer...
highlight Comment ctermfg=lightgreen
highlight Search  ctermfg=black ctermbg=yellow

" These commands came from Damian Conway's Perl Best Practises book
" page 482
set autoindent                  " Preserve current indent on new lines
set textwidth=78                " Wrap at this column
set backspace=indent,eol,start  " Make backspaces delete sensibly
"  MacVim does this for gvim automatically, not sure about others or if we
"  should keep it in.

" hmm, recommendation is 4 columns for Perl, 2 for Ruby.
" Need to work out how to make these setting language specific.
" Have worked out a hint - see :help augroup
set tabstop=2                   " Inentation levels every N columns
set softtabstop=2
set shiftwidth=2                " Indent/outdent by N columns
set expandtab                   " Convert all tabs typed to spaces
set shiftround                  " Indent/outdent to nearest tabstop

"set matchpairs+=<:>             " Allow % to bounce between angles too

" The iab command (also ia, iabbr and iabbrev) is an abbreviation in Insert mode.
" see
"   help iabbrev
" The abbreviation text is typed followed by "a non-keyword character" like
" CR, TAB or space.
"
" These abbreviations are Perl specific - should check if they are included in
" a perl module else move them to perl specific file in .vim directory. - TODO
" Inserting these abbreviations inserts the corresponding Perl statement...
iab phbp    #! /usr/bin/perl -w
iab pdbg    use Data::Dumper 'Dumper';^Mwarn Dumper [];^[hi
" hmmm... haven't typed the rest in - need to think abou them more
" and work out what the control codes are at the end - the last one
" is surely wrong as I just typed the ASCII charaters.
" The perl abbreviations should only be done in perl mode anyhow...

" Abbreviations for rails development
" these should only be added when in rails mode too...
"
" This one is for entering model files - instead of typing :e app/models/
" just type :eam/
cab eam e app/models
cab eac e app/controllers
cab eav e app/views
"  The cab is abbreviations in command mode,
"  see
"    :help cabbrev


" These were autocommands I needed circa 2001 when I was doing work with mason
" but I guess the mason.vim command didn't exist then. I've had them commented
" out for years, but didn't delete them since I wanted to know how they
" worked.  Now I now that "au" is an autocommand; see
"   :help autocmd
" and also
"   :help autocommand
" for the whole manual.
"
"au BufNewFile,BufRead *.mas set ft=mason
"au BufNewFile,BufRead *.mpl set ft=mason

set hlsearch
" Searching for a term leaves all those terms highlighted.
" This sets a function key to unhighlight
map <F8> :nohlsearch<CR>

" Turn on incremental search
set incsearch


" Markdown mode, from http://plasticboy.com/markdown-vim-mode/
augroup mkd
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END

" Can't remember what these are for...
cnoremap <C-L> <Right>
cnoremap <C-H> <Left>
cnoremap <C-J> <Down>
cnoremap <C-K> <Up>


" Default recipient for creating gpg encrypted files
let g:GPGDefaultRecipients=["steve@ganly.com"]

