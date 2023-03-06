" C BUILD INTEGRATION ON WINDOWS NMAKE:
" Run the current python file on a unit test without run the file
autocmd VimEnter * compiler pyunit
set makeprg=python\ %:p
" | botright cwindow 10
command -nargs=* Python make! <args> | botright cwindow 10
map <F5> :compiler pyunit <bar> Python<CR>
