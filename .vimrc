" update work dir ctags
function! UpdateCtags()
    let curdir=getcwd()
    while !filereadable("./tags")
        cd ..
        if getcwd() == "/"
            break
        endif
    endwhile

    " update ctags
    if filewritable("./tags")
        silent !ctags -R -I __THROWNL -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q 
    endif
    execute ":cd " . curdir
endfunction

" update tags path
function! SetTagsPath()
    let curdir=getcwd()
    let reldir=curdir
    while !filereadable("./tags")
        cd ..
        let reldir=getcwd()
        if reldir == "/"
            break
        endif
    endwhile

    " tags 
    if filereadable("./tags") 
        " first call UpdateCtags
        call UpdateCtags()
        execute ":set tags+=" . reldir . "/tags"
    endif
    
    " dep tags
    if filereadable("./dep_tags")
        let tags_list = readfile("" . reldir . "/dep_tags")
        let i = 0
        let size = len(tags_list)
        while i<size 
            let tags_path = get(tags_list, i)
            execute ":set tags+=" . tags_path
            let i += 1
        endwhile 
    endif 
    execute ":cd " . curdir
endfunction

" init tags path
call SetTagsPath()

" auto update ctags while saving files
autocmd BufWritePost *.c,*.h,*.cpp call UpdateCtags()
