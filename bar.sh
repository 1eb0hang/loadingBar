#! /bin/sh

init(){
    percent=$1
    bar_count=0
    printf "\033[s" # cursor position will be saved
}

update(){
    bar_count=$(($bar_count + 100))
    if [ $(($bar_count % $percent)) -lt 100 ] ; then
        bar="${bar}#"
    fi
    printf "\033[u [${bar}\033[u \033[100C] $(($bar_count / $percent))%%"

    ## \033[u       - restore cursor position to beginning  of line
    ## \033[100C    - move cursor 100 spaces
}

init 500

count=0
while [ $count -lt 500 ]; do
    sleep .05
    count=$((count + 1))
    update
done
printf "\n"
