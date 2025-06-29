if [ -z $1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

file=$1
count_word_start_with_digit=0

if [ ! -f $file ]; then
    echo "No regular file"
    exit 1
fi

for token in $(cat "$file"); do
    if [[ "$token" =~ ^[0-9] ]]; then
        ((count_word_start_with_digit++))
        echo "Word $count_word_start_with_digit: $token"
    fi
done
