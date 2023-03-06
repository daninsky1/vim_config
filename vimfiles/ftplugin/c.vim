
" C BUILD INTEGRATION ON WINDOWS NMAKE:
" Configure the QuickFixFormat command, for now I will not append other default
" msbuild
" set errorformat=\\\ %#%f(%l\\\,%c):\ %m
set errorformat+=\\\ %#%f(%l\\\,%c):\ %m
" set makeprg=build.bat
set makeprg=nmake
" | botright cwindow 10
command -nargs=* Make make! <args> | botright cwindow 10
map <F5> :Make /nologo run<CR>
map <F6> :Make /nologo<CR>
