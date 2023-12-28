funi
====

A simple and stupid unicode lookup tool and filter (_Find UNIcode characters_).

funi _per se_
-----------

A zsh* script that uses (the one true) awk to query a text file for characters with a certain unicode name and print them out. (`funi -h` for more usage information.)

inuf
----

A filter written in (the one true) awk to replace {unicode names} in a text.

funic
-----

A shell script that pipes funi to pbcopy*.

unidata/
--------

A folder that should be put next to funi that contains the text file `SimpleUnicodeData.txt` for character lookup as well as source files, a script and a makefile to make it.

unidata/CustomNames.txt
-----------------------
A file you can put arbitrary utf-8 strings and names separated by `|` that gets appended to `SimpleUnicodeData.txt`.

There is no character named RED HEART in the Unicode standard, only BLUE HEART, GREEN HEART, YELLOW HEART, PURPLE HEART, BLACK HEART, and ORANGE HEART, therefore i created this file to fix it.

unidata/UnicodeData.txt
-----------------------

A file available at https://www.unicode.org/Public/UNIDATA/UnicodeData.txt that contains all official unicode names.

unidata/filterdata.awk
----------------------

A filter written in (the one true) awk to process `UnicodeData.txt`, simplify its format and remove characters with automatically generated names as well as language tags that this script does not support.

unidata/Makefile
----------------

A makefile that allows you to simply run make to execute the `filterdata.awk` script.


* this was only tested on macos and therefore it uses zsh and pbcopy.
