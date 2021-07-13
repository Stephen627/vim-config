" Replaces given placeholders in a template file
" @param string     templateFile - the absolute path to the template file
" @param dictionary toReplace    - a dictionary of key to questions
"   e.g. {
"     'name' : 'Enter the name of the class',
"     'namespace' : 'Enter the namespace of the class'
"   }
function ReplaceTemplatePlaceholders(templateFile, toReplace)
    call inputsave()
    let replacements = {}
    for key in keys(a:toReplace)
        let replacements[key] = input(a:toReplace[key] . ': ')
    endfor
    call inputrestore()

    execute "-1read " . a:templateFile
    :call ReplaceParameters(replacements)
    :1
endfunction

" Replaces all keys with values in the given dictionary
" @param dictionary replace - the key value paris in template in the current file
function ReplaceParameters(replace)
    for key in keys(a:replace)
        execute "%s/{" . key . "}/" . a:replace[key] . "/g"
    endfor
endfunction

function ToggleLineNumbers()
    if (&relativenumber == 1)
        set norelativenumber
        echom "Absolute Line Numbers"
    else
        set relativenumber
        echom "Relative Line Numbers"
    endif
endfunction

function ToggleTabSpaces()
    if (&sts > 3)
        setlocal ts=2 sts=2 sw=2
        echom "2 Spaces For Tabs"
    else
        setlocal ts=4 sts=4 sw=4
        echom "4 Spaces For Tabs"
    endif
endfunction

command! MakeTags !echo '' > .vim/tags && find . -type f -regex "^.*\.php\|.*[^\.min]\.js$" -print0 | xargs -0 ctags -f - >> .vim/tags
