if [ -z $1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

file=$1
count_word=0

if [ ! -f $file ]; then
    echo "No regular file"
    exit 1
fi

while read -r line; do
    for token in $line; do
        ((count_word++))
        echo "Word $count_word: $token"
    done
done < "$file"

