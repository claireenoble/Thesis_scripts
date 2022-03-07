p#!/bin/bash

for i in *initial.pdb

do
echo $i
x=$(echo ${i} | sed 's/.pdb/_/')

sed 's/HEM/HEB/' $i > ${x}in.pdb
sed 's/HIS     9/HIM     9/' ${x}in.pdb > ${x}in1.pdb
sed 's/HIS   109/HIN   109/' ${x}in1.pdb > ${x}in.pdb

reduce -Trim ${x}in.pdb > noH.pdb
pdb4amber -i noH.pdb -o ${x}input.pdb

rm ${x}in1.pdb
rm ${x}*nonprot.pdb 
rm ${x}*renum.txt 
rm ${x}*sslink 
rm *_in.pdb

rm noH.pbd
done
