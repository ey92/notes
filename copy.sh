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
cp ../4744/midterm_review.md ./4744/midterm_review.md
