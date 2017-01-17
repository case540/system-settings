function! ReviewFold()
    let thisline = getline(v:lnum)
    if thisline =~ '20\d\d-\d\d-\d\d'
        return ">1"
    elseif thisline =~ '^###'
        return ">4"
    elseif thisline =~ '^##'
        return ">3"
    elseif thisline =~ '^#'
        return ">2"
    else
        return "="
    endif
endfunction
setlocal foldmethod=expr
setlocal foldexpr=ReviewFold()


function! ReviewFoldText()
    return getline(v:foldstart)
endfunction
setlocal foldtext=ReviewFoldText()
