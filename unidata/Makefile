SimpleUnicodeData.txt: UnicodeData.txt CustomNames.txt iso-3166.csv
	awk -f filterdata.awk UnicodeData.txt > SimpleUnicodeData.txt
	cat CustomNames.txt >> SimpleUnicodeData.txt
	awk -f flags.awk iso-3166.csv >> SimpleUnicodeData.txt
