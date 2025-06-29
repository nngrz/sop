count=0;
for file in ./[a-zA-Z]*; do
    if [ -f $file ]; then
        ((count++))
        echo "File $count: $(basename $file)"
    fi
done
