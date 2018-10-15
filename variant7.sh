#! /bin/bash 
lines=$(cut -f4 -d" " log.txt | grep -v '"-"' | wc -l);
echo $lines;
for i in `cut -f4 -d" " log.txt| cut -d: -f1 | tr --delete [  | grep -v '"-"' | sort -t" " -k1 | uniq -c | sort --reverse -k1 -n | head`;
do if [[ $i =~ ^[0-9]+$ ]]; then
	 printf "$i -  0$(echo "scale=4; $i / $lines" | bc)%%" ;
   else printf " - $i \n"; fi  
done
