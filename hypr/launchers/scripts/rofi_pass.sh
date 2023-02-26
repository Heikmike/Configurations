#!/bin/bash
raw=$(rg --no-messages --files --no-ignore --hidden ~/.password-store)
unlocked=$(gpg-connect-agent 'keyinfo --list' /bye | grep 605C5523460814900993BC7A2F76DE507E5D66FD | cut -d ' ' -f 7)

while IFS= read -r line; do

    relatativePath=${line:28:-4}

    if [ $# -eq 0 ]; then
        echo $relatativePath
    else
        if [ "$1" == "$relatativePath" ]; then
            coproc (pass -c "$relatativePath" >/dev/null 2>1)
            exit 0
        fi
    fi

done <<<"$raw"
