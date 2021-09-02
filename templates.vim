function ReactTypescriptFunction()
    :call ReplaceTemplatePlaceholders("$VIMHOME/templates/react-typescript.tsx", {'name': 'Enter the name of the function'})
endfunction
function ReactFunction()
    :call ReplaceTemplatePlaceholders("$VIMHOME/templates/react-function.js", {'name': 'Enter the name of the function'})
endfunction
function PHPClass()
    :call ReplacePHPTemplatePlaceholders("$VIMHOME/templates/php-class.php")
endfunction
function PHPFunction()
    :call ReplaceTemplatePlaceholders("$VIMHOME/templates/php-class-no-namespace.php", {'name': 'Enter the name of the class' })
endfunction
function HTML()
    :-1read $VIMHOME/templates/skeleton.html
endfunction

nnoremap <leader>tt :call OpenTemplatePopup()<cr>

function OpenTemplatePopup()
    lua require('template-picker.init').setup()
endfunction

