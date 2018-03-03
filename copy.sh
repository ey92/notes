#!/bin/bash
cp ../1101/*.txt ./1101/
cp ../2668/notes.txt 2668notes.md
cp ../4744/notes.txt ./4744/4744notes.md
cp ../4660/notes.txt 4660notes.md
cp ../6010/notes.txt 6010notes.md

for file in ./1101/*.txt
do
 mv "$file" "${file%.txt}.md"
done

mv ./1101/vocab.md ./1101/1101vocab.md
mv ./1101/notes.md ./1101/1101notes.md

cp ../4744/hw3/*.txt ./4744/hw3/
cp ../4744/hw3/*.sent ./4744/hw3/
cp ../4744/hw3/*.lex ./4744/hw3/
cp ../4744/hw3/*.gram ./4744/hw3/
cp ../4744/hw3/p1/*.* ./4744/hw3/p1/
cp ../4744/hw3/p2/*.* ./4744/hw3/p2/
cp ../4744/hw3/p4/*.* ./4744/hw3/p4/

mv ./4744/hw3/hw3.txt ./4744/hw3/hw3.md