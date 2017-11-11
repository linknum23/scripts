#!/bin/bash
# from: https://stackoverflow.com/questions/3625725/can-i-add-custom-colors-to-mercurial-command-templates
#hg log --graph --template "{label('custom.rev',rev)} {branch}  {label('custom.message',desc|firstline)}  [{date|age} by {label('custom.author',author)}]\n"
if [[ -e .hg ]] ; then
    hg log --graph --template "{label('custom.rev',rev)}{label('custom.branch',ifeq(branch,'default','',' {branch}'))}{if(bookmarks,' {bookmarks}')}{if(tags,' {tags}')} - {label('custom.date',date|age)} - {desc|firstline}"
elif [[ -e .git ]] ; then
    git lg1
fi
