" ============================================================================
" File:        git.vim
" Description: Expt. plugin to add git flags to the UI
" Maintainer:
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" Limitations:
"   * nerdtree root must contain the .git repo
"
" Features:
"   * git status flags beside file nodes
"   * "dirty"/"clean" directory flags beside dir nodes with modified children
"   * syntax highlighting for the above flags
"   * automatically update the tree whenever a buffer is saved
"   * update all tree flags on cursorhold
"
" ============================================================================
if exists("g:loaded_nerdtree_git")
    finish
endif
let g:loaded_nerdtree_git = 1

let s:NERDTreeIndicatorMap = {
            \ " M"        : "✹",
            \ "M "        : "✔︎",
            \ "A "        : "✚",
            \ "??"        : "✭",
            \ "R "        : "➜",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ }

call g:NERDTreePathNotifier.AddListener("init", "g:NERDTreeGitPathListener")
call g:NERDTreePathNotifier.AddListener("refresh", "g:NERDTreeGitPathListener")
call g:NERDTreePathNotifier.AddListener("refreshFlags", "g:NERDTreeGitPathListener")

function! g:NERDTreeGitPathListener(event)
    let path = a:event.subject

    if !isdirectory(a:event.nerdtree.root.path.str() . '/.git')
        return
    end

    call path.flagSet.clearFlags('git_plugin')

    let gitstatus = s:GitStatusFor(path)
    if !empty(gitstatus)
        call path.flagSet.addFlag("git_plugin", s:NERDTreeIndicatorMap[gitstatus])
    endif

    let dirState = s:GetDirStatusFor(path)
    if !empty(dirState)
        call path.flagSet.addFlag("git_plugin", s:NERDTreeIndicatorMap[dirState])
    endif

endfunction

function! s:GitStatusFor(path)
    return get(s:GitStatusCache(), a:path.str(), '')
endfunction

let s:gitStatusCacheTimeExpiry = 2
function! s:GitStatusCache()
    if !exists('s:gitStatusCache') || (localtime() - s:gitStatusCacheTime > s:gitStatusCacheTimeExpiry)
        let gitOutput = split(system('git -C ' . b:NERDTree.root.path.str() . ' status -s'), "\n")
        let s:gitStatusCacheTime = localtime()

        let s:gitStatusCache = {}
        for line in gitOutput

            "rewrite the output for renames from:
            "    R  old -> new
            "to
            "    R  new
            "so that we can treat it the same as the other lines of output
            let line = substitute(line, '^R  .* -> \(.*\)', 'R  \1', '')

            let gitFlag = strpart(line, 0, 2)
            let file = b:NERDTree.root.path.str() . '/' . strpart(line, 3)
            let s:gitStatusCache[file] = gitFlag
        endfor
    endif

    return s:gitStatusCache
endfunction

"returns 'Dirty', 'Clean', or ''
function s:GetDirStatusFor(path)
    if !a:path.isDirectory
        return ''
    endif

    let s = s:GitStatusCache()
    let dir = a:path.str()
    let isClean = 0

    for file in keys(s)
        if stridx(file, dir) != 0
            continue
        endif

        if s[file] == ' M'
            return "Dirty"
        elseif s[file] == 'M '
            let isClean = 1
        endif
    endfor

    if isClean
        return "Clean"
    endif

    return ""
endfunction

autocmd filetype nerdtree call s:AddHighlighting()
function! s:AddHighlighting()
    syn match NERDTreeGitStatusModified #✹# containedin=NERDTreeFlags
    syn match NERDTreeGitStatusAdded #✚# containedin=NERDTreeFlags
    syn match NERDTreeGitStatusUntracked #✭# containedin=NERDTreeFlags
    syn match NERDTreeGitStatusRenamed "➜" containedin=NERDTreeFlags
    syn match NERDTreeGitStatusDirDirty "✗" containedin=NERDTreeFlags
    syn match NERDTreeGitStatusDirClean "✔︎" containedin=NERDTreeFlags

    hi def link NERDTreeGitStatusModified Special
    hi def link NERDTreeGitStatusAdded Function
    hi def link NERDTreeGitStatusRenamed Title
    hi def link NERDTreeGitStatusUnmerged Label
    hi def link NERDTreeGitStatusUntracked Comment
    hi def link NERDTreeGitStatusDirDirty Tag
    hi def link NERDTreeGitStatusDirClean DiffAdd
endfunction

autocmd cursorhold * silent! call s:CursorHoldUpdate()
function! s:CursorHoldUpdate()
    if !nerdtree#isTreeOpen()
        return
    endif

    let winnr = winnr()
    call nerdtree#putCursorInTreeWin()
    let node = b:NERDTree.root.refreshFlags()
    call NERDTreeRender()
    exec winnr . "wincmd w"
endfunction

"when a buffer is saved, refresh it in nerdtree
autocmd bufwritepost * silent! call s:FileUpdated(expand("%"))
function! s:FileUpdated(fname)
    if !nerdtree#isTreeOpen()
        return
    endif

    call nerdtree#putCursorInTreeWin()
    let node = b:NERDTree.root.findNode(g:NERDTreePath.New(a:fname))

    while !empty(node)
        call node.refreshFlags()
        let node = node.parent
    endwhile

    call NERDTreeRender()
endfunction

