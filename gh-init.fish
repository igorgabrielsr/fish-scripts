#!/usr/bin/env fish

function gh-init
    if test (count $argv) -eq 0
        echo "usage: gh-init <name>"
        return 1
    end

    set name $argv[1]

    if test -d $name
        echo "error: directory exists"
        return 1
    end

    mkdir $name
    cd $name

    echo "# $name" > README.md

    git init -q
    git add README.md
    git commit -q -m "Initial commit"

    echo "done: $PWD"
end

gh-init $argv
