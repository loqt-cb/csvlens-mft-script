#!/bin/bash

if [ -z "$1" ]; then
	# if there is no file
	echo -e "MFT as CSV Script by loqt. Requires csvlens.\nUsage: mftcsvtool <filename>"
	echo -e "find: --find <regex>"
	echo -e "filter --filter <regex>"
	exit

elif [ -z "$2" ]; then
	csvlens $1 --columns "EntryNumber|FileName|SecurityId|ParentEntryNumber|ParentPath|Filename|Extension|FileSize|ReferenceCount|Created0x10|Created0x30|LastModified0x10|LastModified0x30|LastAccess0x10|LastAccess0x30" --colorful --prompt "loqt mft viewer"

elif [ "$2" == "--find" ]; then
	csvlens mftcsv.csv --columns "EntryNumber|FileName|SecurityId|ParentEntryNumber|ParentPath|Filename|Extension|FileSize|ReferenceCount|Created0x10|Created0x30|LastModified0x10|LastModified0x30|LastAccess0x10|LastAccess0x30" --colorful --prompt "loqt mft viewer" --find "$3"
elif [ "$2" == "--filter" ]; then
	csvlens mftcsv.csv --columns "EntryNumber|FileName|SecurityId|ParentEntryNumber|ParentPath|Filename|Extension|FileSize|ReferenceCount|Created0x10|Created0x30|LastModified0x10|LastModified0x30|LastAccess0x10|LastAccess0x30" --colorful --prompt "loqt mft viewer" --filter "$3"
elif [ "$2" == "--columns" ]; then
	csvlens $1 --columns "$3" --colorful --prompt "loqt mft viewer"
fi


