#!/bin/bash

mkdir -p ~/.vim;

#change system_include_path to your actual system path
system_include_path=/usr/include/* /usr/lib/gcc/x86_64-linux-gnu/5/include/* /usr/lib/gcc/x86_64-linux-gnu/5/include-fixed/* /usr/include/x86_64-linux-gnu/*
ctags -R -I __THROWNL -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q  -f ~/.vim/systags $(system_include_path)
