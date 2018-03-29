| # | rule | good test case | bad test case | 0 or 3 |
| - | ---- | -------------- | ------------- | ------ |
| 1 | 2nd letter consonant | chip, school, the | water | 0 |
| 2 | every vowel adj 3rd letter | cat, sake | tea | 0 |
| 3 | some vowel is cap | cAt, Aim | cat, The | 0 |
| 4 | every capV precedes 3rd letter | hAll, tAle, Shell | scAle, sevEr | 3 |
| 5 | every vowel adj to 2nd letter | Cake, Ant | create | 0 |
| 6 | 1st is initial and is a consonant | cat | eat | 3 |
| 7 | no cap glide | why, eat | Why | 0 |
| 8 | 3rd letter is final | eat | ship | 3 |
| 9 | every consonant adj 4th letter  
| 10 | some consonant adj to all cons is adj to 2nd letter | an, ire | ant, can, palm, eat | 0 |
| 11 | no vowel follows 2nd letter | eat | ate | 3 |
| 12 | some vowel immediately precedes 3rd letter | eats | tree, ant | 3 |
| 12b | some vowel immediately follows 3rd letter | care, tarot, almost | cache, ant, plate | 3 |
| 14 | letter four precedes no consonant | cache, artsy, brace, cart | stack, trash, banana | 3 |

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

```define no : LPLR.Lx.Ay[P(y) -> ~[R(y)(x)]]```
```[result [.S  [letter four] [.VP [.V precedes] [.A [no consonant]]]]]```

I used a similar definition of ```no``` that I had of ```every``` from #10, except I negated the result to make it a negative. Using this, I could just build the logical tree as if it were a sentence, grouping keywords by "phrases."

good test cases:
- cache
- artsy
- brace
- cart

bad test cases:
- stack
- trash
- banana