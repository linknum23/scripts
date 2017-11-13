#!/bin/bash
# from: https://stackoverflow.com/questions/3625725/can-i-add-custom-colors-to-mercurial-command-templates
# hg log --graph --template "{label('custom.rev',rev)} {branch}  {label('custom.message',desc|firstline)}  [{date|age} by {label('custom.author',author)}]\n"
# check for git or mercurial repos, do git first because its check is inherently faster
if [[ -d .git ]] || git rev-parse --is-inside-work-tree ; then
    # TODO: make lg1 have a date before the abbreviated commit message
    git lg1
elif [[ -e .hg ]] || hg root &> /dev/null && echo true || echo false ; then
    hg log --graph --template "{label('custom.rev',rev)}{label('custom.branch',ifeq(branch,'default','',' {branch}'))}{if(bookmarks,' {bookmarks}')}{if(tags,' {tags}')} - {label('custom.date',date|age)} - {desc|firstline}"
fi
