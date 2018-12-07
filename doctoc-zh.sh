cat './.mds-zh' | while read line
do
	doctoc $line --maxlevel 2
done
