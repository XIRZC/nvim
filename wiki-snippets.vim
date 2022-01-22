"autocmd Filetype wiki map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype vimwiki inoremap <buffer> .f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype vimwiki inoremap <buffer> .w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
autocmd Filetype vimwiki inoremap <buffer> .n ---<Enter><Enter>
autocmd Filetype vimwiki inoremap <buffer> .b ** <++><Esc>F*i
autocmd Filetype vimwiki inoremap <buffer> .t __ <++><Esc>F_i
autocmd Filetype vimwiki inoremap <buffer> .d `` <++><Esc>F`i
autocmd Filetype vimwiki inoremap <buffer> .c {{{<Enter><++><Enter>}}}<Enter><Enter><++><Esc>4kA
autocmd Filetype vimwiki inoremap <buffer> .t - [ ] 
autocmd Filetype vimwiki inoremap <buffer> .p {{http://cdn.emm.ink/pics/.png<++>}} <++><Esc>F.i
autocmd Filetype vimwiki inoremap <buffer> .a [[]] <++><Esc>F[a
autocmd Filetype vimwiki inoremap <buffer> .F [[file:]] <++><Esc>F:a
autocmd Filetype vimwiki inoremap <buffer> .1 =<Space><Space>=<Enter><++><Esc>k1a
autocmd Filetype vimwiki inoremap <buffer> .2 ==<Space><Space>==<Enter><++><Esc>k2a
autocmd Filetype vimwiki inoremap <buffer> .3 ===<Space><Space>===<Enter><++><Esc>k3a
autocmd Filetype vimwiki inoremap <buffer> .4 ====<Space><Space>====<Enter><++><Esc>k4a
autocmd Filetype vimwiki inoremap <buffer> .l --------<Enter>
