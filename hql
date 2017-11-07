#!/bin/bash
# from: https://stackoverflow.com/questions/3625725/can-i-add-custom-colors-to-mercurial-command-templates
hg log --limit 25 --graph --template "{label('custom.rev',rev)} {branch}  {label('custom.message',desc|firstline)}  [{date|age} by {label('custom.author',author)}]\n"
