" folding for Markdown headers, both styles (atx- and setex-)
" http://daringfireball.net/projects/markdown/syntax#header
"
" this code can be placed in file
"   $HOME/.vim/after/ftplugin/markdown.vim
"
" original version from Steve Losh's gist: https://gist.github.com/1038710

func! Foldexpr_vcl(lnum)
    if (a:lnum == 1)
        let l0 = ''
    else
        let l0 = getline(a:lnum-1)
    endif

    let l1 = getline(a:lnum)

    if l1 =~ '\v^\s*#*\s*(director|acl|sub)'
        " current line is blank (level 1 end)
        return '>1'
    else
        " keep previous foldlevel
        return '='
    endif
endfunc

setlocal foldexpr=Foldexpr_vcl(v:lnum)
setlocal foldmethod=expr

function! Foldtext_vcl()
      let foldsize = (v:foldend-v:foldstart)
        return getline(v:foldstart).' ('.foldsize.' lines)'
    endfunction
    setlocal foldtext=Foldtext_vcl()

"---------- everything after this is optional -----------------------
" change the following fold options to your liking
" see ':help fold-options' for more
"setlocal foldenable
setlocal foldlevel=0
setlocal foldcolumn=0
set foldmethod=expr
set foldopen-=search
"set foldcolumn=3
