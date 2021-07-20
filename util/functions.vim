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

function ReplacePHPTemplatePlaceholders(templateFile)
    if !filereadable($PWD . '/composer.json')
        return
    endif

    let replacements = {}
    let composerFile = json_decode(readfile($PWD . '/composer.json'))
    let autoload = composerFile['autoload']['psr-4']
    let filePath = expand('%:r')
    let fileName = expand('%:t:r')
    let replacements.name = fileName

    for key in keys(autoload)
        " not the correct namespace
        if filePath !~ '^' . autoload[key]
            continue
        endif

        let path = substitute(filePath, autoload[key] . '/', '', '') " removing initial path from string (e.g. src/)
        let path = substitute(path, fileName . '$', '', '') " removing file name from end of path
        let path = split(path, '/') " split the path to get ready to join with the initial namespace
        let key = join(split(key, '\') + path, '\\')
        let replacements.namespace = key
        break
    endfor


    execute "-1read " . a:templateFile
    :call ReplaceParameters(replacements)
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
