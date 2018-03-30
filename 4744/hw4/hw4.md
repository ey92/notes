| # | rule | good test case | bad test case | .in/.out or .in3/.out3 |
| - | ---- | -------------- | ------------- | ------ |
| 1 | 2nd letter consonant | chip, school, the | water | 0 |
| 2 | every vowel adj 3rd letter | cat, sake | tea | 0 |
| 3 | some vowel is cap | cAt, Aim | cat, The | 0 |
| 4 | every capV precedes 3rd letter | hAll, tAle, Shell | scAle, sevEr | 3 |
| 5 | every vowel adj to 2nd letter | Cake, Ant | create | 0 |
| 6 | 1st is initial and is a consonant | cat | eat | 3 |
| 7 | no cap glide | why, eat | Why | 0 |
| 8 | 3rd letter is final | eat | ship | 3 |
| 9 | every consonant adj 4th letter | aura, wore | snack, went, sway | 0 |
| 10 | some consonant adj to all cons is adj to 2nd letter | an, ire | ant, can, palm, eat | 0 |
| 11 | no vowel follows 2nd letter | eat | ate | 3 |
| 12 | some vowel immediately precedes 3rd letter | eats | tree, ant | 3 |
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
![e9 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e9tree.png)

### 10
![e10 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e10tree.png)

### 11
![e11 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e11tree.png)

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
Answered Challenge Problem on Piazza
post @208

_letter four precedes no consonant_

```define no : LPLR.Lx.Ay[P(y) -> ~[R(y)(x)]]```<br>
```[result [.S  [letter four] [.VP [.V precedes] [.A [no consonant]]]]]```

I used a definition of ```no``` that was similar to what I had of ```every``` in #10, except I negated the result. Using this, I could just build the logical tree as if it were a sentence, grouping keywords by "phrases."

good test cases:
- cache
- artsy
- brace
- cart

bad test cases:
- stack
- trash
- banana