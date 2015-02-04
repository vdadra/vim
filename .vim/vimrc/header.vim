" Vim File
" AUTHOR:   Agapo (fpmarias@google.com)
" FILE:     /usr/share/vim/vim70/plugin/header.vim
" CREATED:  21:06:35 05/10/2004
" MODIFIED: 22:15:16 19/12/2013
" TITLE:    header.vim
" VERSION:  0.1.3
" SUMMARY:  When a new file is created a header is added on the top too.
"           If the file already exists, the pluging update the field 'date of
"           the last modification'.
" INSTALL:  Easy! Copy the file to vim's plugin directory (global or personal)
"           and run vim.


" FUNCTION:
" Detect filetype looking at its extension.
" VARIABLES:
" comment = Comment symbol associated with the filetype.
" type = Path to interpreter associated with file or a generic title
" when the file is not a script executable.


function s:filetype ()

  let s:file = expand("<afile>:t")
  if match (s:file, "\.sh$") != -1
    let s:scomment = "#"
    let s:mcomment = "#"
    let s:ecomment = "#"
    let s:type = s:mcomment . "!" . system ("whereis -b bash | awk '{print $2}' | tr -d '\n'")
  elseif match (s:file, "\.py$") != -1
    let s:scomment = "#"
    let s:mcomment = "#"
    let s:ecomment = "#"
    let s:type = s:mcomment . "!" . system ("whereis -b python | awk '{print $2}' | tr -d '\n'")
  elseif match (s:file, "\.pl$") != -1
    let s:scomment = "#"
    let s:mcomment = "#"
    let s:ecomment = "#"
    let s:type = s:mcomment . "!" . system ("whereis -b perl | awk '{print $2}' | tr -d '\n'")
  elseif match (s:file, "\.vim$") != -1
    let s:scomment = "\""
    let s:mcomment = "\""
    let s:ecomment = "\""
    let s:type = s:mcomment . " Vim File"
  elseif match (s:file, "\.c$") != -1
    let s:scomment = "/*"
    let s:mcomment = " *"
    let s:ecomment = " */"
    let s:type = s:mcomment . " c file"
  elseif match (s:file, "\.cpp$") != -1
    let s:scomment = "/*"
    let s:mcomment = " *"
    let s:ecomment = " */"
    let s:type = s:mcomment . " C++ file"
  elseif match (s:file, "\.cc$") != -1
    let s:scomment = "/*"
    let s:mcomment = " *"
    let s:ecomment = " */"
    let s:type = s:mcomment . " C++ file"
  elseif match (s:file, "\.h$") != -1
    let s:scomment = "/*"
    let s:mcomment = " *"
    let s:ecomment = " */"
    let s:type = s:mcomment . " C/C++ header file"
  elseif match (s:file, "\.hpp$") != -1
    let s:scomment = "/*"
    let s:mcomment = " *"
    let s:ecomment = " */"
    let s:type = s:mcomment . " C/C++ header functions file"
  else
    let s:scomment = "#"
    let s:mcomment = "#"
    let s:ecomment = "#"
    let s:type = s:mcomment . " Text File"
  endif
  unlet s:file

endfunction


" FUNCTION:
" Insert the header when we create a new file.
" VARIABLES:
" author = User who create the file.
" file = Path to the file.
" created = Date of the file creation.
" modified = Date of the last modification.

function s:insert ()

  call s:filetype ()

  let s:author = s:mcomment . " AUTHOR:   " . system ("id -un | tr -d '\n'")
  let s:created = s:mcomment . " CREATED:  " . strftime ("%H:%M:%S %d/%m/%Y")
  let s:modified = s:mcomment . " MODIFIED: " . strftime ("%H:%M:%S %d/%m/%Y")
  let s:end_line = s:ecomment

  call append (0, s:scomment)
  call append (1, s:type)
  call append (2, s:author)
  call append (3, s:created)
  call append (4, s:modified)
  call append (5, s:end_line)

  unlet s:scomment
  unlet s:mcomment
  unlet s:ecomment
  unlet s:type
  unlet s:author
  unlet s:created
  unlet s:modified
  unlet s:end_line

endfunction


" FUNCTION:
" Update the date of last modification.
" Check the line number 5 looking for the pattern.

function s:update ()

  call s:filetype ()

  let s:pattern = s:mcomment . " MODIFIED: [0-9]"
  let s:line = getline (5)

  if match (s:line, s:pattern) != -1
    let s:modified = s:mcomment . " MODIFIED: " . strftime ("%H:%M:%S %d/%m/%Y")
    call setline (5, s:modified)
    unlet s:modified
  endif
  
  unlet s:mcomment
  unlet s:pattern
  unlet s:line

endfunction


autocmd BufNewFile * call s:insert ()
autocmd BufWritePre * call s:update ()
