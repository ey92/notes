| # | rule | good test case | bad test case | .in/.out or .in3/.out3 |
| - | ---- | -------------- | ------------- | ------ |
| 1 | 2nd letter consonant | chip, school, the, askew | water, swear, sync, real | 0 |
| 2 | every vowel adj to 3rd letter | cat, sake, towed | tea, stark, teal | 0 |
| 3 | some vowel is cap | cAt, Aim, sAmE | cat, The, SaMe | 0 |
| 4 | every capV precedes 3rd letter | hAll, tAle, Shell, Art | scAle, sevEr, ArtisAn | 3 |
| 5 | every vowel adj to 2nd letter is cap | Cake, Ant, tart, TATER | create, creAte, bEar | 0 |
| 6 | 1st letter is initial and is a consonant | cat, rasp, fish | eat, apron, incite | 3 |
| 7 | no cap glide | why, eat, wine | Why, tawnY, LAWN | 0 |
| 8 | 3rd letter is final | eat, tin, oar | ship, slime, cabin | 3 |
| 9 | every consonant adj to 4th letter | aura, wore, wine, yoyo | snack, went, sway, wean | 0 |
| 10 | some vowel adj to all cons is adj to 2nd letter | an, ire, you | ant, can, palm, eat | 0 |
| 11 | no vowel follows 2nd letter | eat, tin, sing, cysts | ate, tear, table | 3 |
| 12 | some vowel immediately precedes 3rd letter | eats, meal, water | tree, ant, cheese | 3 |
| 12b | some vowel immediately follows 3rd letter | care, tarot, almost | cache, ant, plate | 3 |
| 14 | letter four precedes no consonant | cache, artsy, brace, cart | stack, trash, banana | 3 |

### 1
![e1 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e1tree.png)

### 2
![e2 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e2tree.png)

### 3
![e3 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e3tree.png)

### 4
![e4 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e4tree.png)

### 5
![e5 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e5tree.png)

### 6
![e6 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e6tree.png)

### 7
![e7 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e7tree.png)

### 8
![e8 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e8tree.png)

### 9
_letter four is adjacent to every consonant_<br>
redefine 'to':<br>
```define to-r: LP.P```<br>
tree: <br>
```[result [.S  [.S [[[letter four] [.VP [.V is] [.A adjacent]]] [.AP to-r ]] [every consonant]]]]```<br>
Previously, 'to' was used to apply to a specific letter (of type _e_). However, now that its object is 'every consonant' (type _et_), the 'to' must be redefined to take in _et_ as its argument. This is done by taking in a function instead of a variable.


![e9 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e9tree.png)
- It was  hard to find positive test cases, since first two letters had to be a glide or vowel, followed by a consonant, and the word had to have at least 4 letters.

### 10
![e10 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e10tree.png)
- also hard to find positive examples
- since "you" doesn't have any consonant, the word's spelling don't break this rule

### 11
![e11 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e11tree.png)
- hard to find positive examples longer than 3 letters - must end in a consonant cluster

### 12
![e12 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e12tree.png)

![e12b Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e12btree.png)

### 13
Challenge Problems posed on Piazza
post @202
- Some capital follows the final consonant
- Some capital is adjacent to every consonant that immediately follows a vowel
- No glide precedes the initial vowel
- Every vowel is not adjacent to a consonant
- There is no capital glide preceding letter two

### 14
Answered Challenge Problem on Piazza<br>
post @208<br>
_letter four precedes no consonant_<br>
redefine 'no':<br>
```define no : LPLR.Lx.Ay[P(y) -> ~[R(y)(x)]]```<br>
tree:<br>
```[result [.S  [letter four] [.VP [.V precedes] [.A [no consonant]]]]]```<br><br>
I used a definition of ```no``` that was similar to what I had of ```every``` in #10, except I negated the result. Using this, I could just build the logical tree as if it were a sentence, grouping keywords by "phrases."<br><br>

good test cases:
- cache
- artsy
- brace
- cart

bad test cases:
- stack
- trash
- banana

![e12 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e12tree.png)