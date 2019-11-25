#!/bin/bash
if [ -f "./cscope.files" ];then
	rm ./cscope*
fi
find ./ -path "./arch" -prune -o -path "./include" -prune -o -name "*.[chS]" > cscope.files
sed -i "/./arch/d;/./include/d" cscope.files > cscope.files
find ./arch/i386 -name "*.[chS]" >> cscope.files
find ./include/asm-i386 -name "*.[chS]" >> cscope.files
cscope -bqk
echo "finished!"
