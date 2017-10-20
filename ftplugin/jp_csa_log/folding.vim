setlocal foldmethod=expr
setlocal foldexpr=GetLogFold(v:lnum)
setlocal foldtext=LogFoldText()

function! GetLogFold(lnum)
  let this_indent = indent(a:lnum) / 2
  let next_indent = NextIndent(a:lnum)

  if (next_indent > this_indent)
    return '>' . next_indent
  else
    return this_indent
endfunction

function! NextIndent(lnum)
  let numlines = line('$')
  if (a:lnum < numlines)
    let nextlnum = a:lnum+1
    return (indent(nextlnum) / 2)
  else
    return -2
endfunction

function! LogFoldText()
  let numlines = v:foldend - v:foldstart + 1
  let linetext = getline(v:foldstart)
  return linetext . " (" . numlines . " folded lines)"
endfunction
