#!/bin/bash


validate() {
    description="$1"
    (eval "$2" &> /dev/null && echo -e "\e[32m[OK]\e[0m $description") || echo -e "\e[31m[KO]\e[0m $description" > /dev/stderr
}

is_hash() {
    sum=`md5sum "$1" 2> /dev/null`
    if [ ! "$sum" ]; then
        return 1
    fi
    hash=`echo $sum | cut -d ' ' -f1`
    if [ $hash = $2 ]; then
        return 0
    fi
    return 1
}

has_content() {
    content=`cat $params "$1" 2> /dev/null`
    if  [ ! "$content" ]; then
        return 1
    elif [ "$content" == "$2" ]; then
        return 0
    fi
    return 1
}

for dir in `find . -maxdepth 1 -type d -not -name '.*' | sort`; do
    cd "$dir"
    if [ -f ".validate" ]; then
        validator=`cat .validate`
        echo "---- $dir ----"
        eval "$validator"
    fi
    cd - > /dev/null
 done
