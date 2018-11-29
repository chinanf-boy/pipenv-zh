cat './.mds-zh' | while read line
do
	pandoc -f markdown -t rst -o ${line//.md/.rst} $line
done
