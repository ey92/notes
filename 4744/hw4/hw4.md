Elizabeth Yam ey92 <br>
CS 4744 HW4

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
_letter two is a consonant_<br>
**tree:** ```[result [.S [letter two] [.VP [.V is] [.AP a [.A consonant]]]]]```<br><br>
This one was an easy question as a starting point. After understanding the tree structure from class and the example _e0_, this taught me how to begin recognizing what types each expression would produce. 'letter' is _ee_, 'two' is _e_, 'is' is _<et,et>_, 'a' is _<et,et>_, and 'consonant' is _et_.<br>

good test cases:
- chip
- school
- the
- askew

bad test cases:
- water
- swear
- sync
- real

![e1 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e1tree.png)

### 2
_every vowel is adjacent to letter three_<br>
**tree:** ```[result [.S [every vowel] [.VP [.V is] [.AP adjacent [.AP to [.A [letter three]]]]]]]```<br><br>
Again, this was an introduction to playing with types, and learning to adapt trees to take _et_ as an argument, as opposed to _e_.

good test cases:
- cat
- sake
- towed

bad test cases:
- tea
- stark
- teal

![e2 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e2tree.png)

### 3
_some vowel is capitalized_<br>
**define cap**: ```Lx[Pos(x) & Cap(C(x))]```<br>
**define capV**: ```Lx[[Pos(x) & Vow(C(x))] & Cap(C(x))]```<br>
**tree:** ```[result [.S [some vowel] [.VP [.V is] [.A [a cap] ]]]]```<br><br>
I created a class 'cap' that uses the 'Cap' function in the program to define all of the capital letters. I then created the class 'capV', consisting of all capital vowels, which is the intersection of all vowels and all capital letters. Passing in the parameter 'some vowel' of type _et_ to this predicate testing for a capital vowel yields a simple statement.<br>

good test cases:
- cAt
- Aim
- sAmE

bad test cases:
- cat
- The
- SaMe


![e3 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e3tree.png)

### 4
_every capitalized vowel precedes letter three_
**define cap**: ```Lx[Pos(x) & Cap(C(x))]``` (from #3)<br>
**define capV**: ```Lx[[Pos(x) & Vow(C(x))] & Cap(C(x))]``` (from #3)<br>
**tree:** ```[result [.S [every capV] [.VP [.V is] [.AP precedes [[.A [letter three]]]]]]]```<br><br>
Borrowing the 'cap' and 'capV' classes from #3, this statement become very easy to create, setting 'every capV' as the _et_ subject and the 'precedes letter three' predicate takes it as an argument to produce a truth.<br>

good test cases:
- hAll
- tAle
- Shell
- Art

bad test cases:
- scAle
- sevEr
- ArtisAn


![e4 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e4tree.png)

### 5
_every vowel that is adjacent to letter two is capitalized_<br>
**define 'cap'**: ```Lx[Pos(x) & Cap(C(x))]``` (from #3)<br>
**tree:** ```[result [.S [every [vowel [[adjacent [to [letter two]]]]]] [.VP [.V is] [.A [cap]]]]]```<br><br>
To make this easier, I borrowed the class 'cap' from #3 and avoided having to define the preposition 'that', since it doesn't provide extra meaning to the statement. It can easily be restated as _every vowel adjacent to letter two is capitalized_, which is what the tree represents.<br>

good test cases:
- Cake
- Ant
- tart
- TATER

bad test cases:
- create
- creAte
- bEar


![e5 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e5tree.png)

### 6
_letter one is initial and is a consonant_<br>
**define 'initial'**: ```Lx.Ay[~D(y,x)]```<br>
**tree:** ```[result [.S [letter one] [[.VP [[.V is] [.A initial]]] [and-et [.VP [.V is] [.A [a consonant]]]]] ] ]```<br><br>
We can define 'initial' by saying nothing 'precedes' _x_. Then, to complete the problem, the two predicates can be combined with an 'and-et' and then be passed 'letter one' of type _e_ to produce a truth value.<br>

good test cases:
- cat
- rasp
- fish

bad test cases:
- eat
- apron
- incite

![e6 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e6tree.png)

### 7
_no glide is capitalized_<br>
**define 'cap'**: ```Lx[Pos(x) & Cap(C(x))]``` (from #3)<br>
**define 'not'**: ```LPLQ.Ax.[P(x) -> ~Q(x)]```<br>
**tree:** ```[result [.S  [.S [not glide] [.VP [.V is] [.A a cap]]]]]```<br><br>
For 'not', I just copied the definition of 'every' but manipulated it. I negated result of the function it takes in, since "none" is the complement of "every". Combining this with the 'cap' class of letters from #3 creates a simple predicate that follows the same pattern as previous problems.<br>

good test cases:
- why
- eat
- wine

bad test cases:
- Why
- tawnY
- LAWN


![e7 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e7tree.png)

### 8
_letter three is final_<br>
**define 'final'**: ```Lx.Ay[~D(x,y)]```<br>
**tree:** ```[result [.S [letter three] [.VP [[.V is] [.A final]]] ] ]```<br><br>
Similarly to how 'inital' was defined to mean nothing precedes _x_, we can define a certain letter to be 'final' as meaning _x_ does not precede anything else. This is accomplished by the negation of the 'precedes' function for all _y_.<br>
- As a result of letter three being final, all of the positive examples had to be 3-letter words<br>

good test cases:
- eat
- tin
- oar
bad test cases:
- ship
- slime
- cabin

![e8 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e8tree.png)

### 9
_letter four is adjacent to every consonant_<br>
**redefine 'to' as 'to-r'**: ```LP.P```<br>
**tree:** ```[result [.S  [.S [[[letter four] [.VP [.V is] [.A adjacent]]] [.AP to-r ]] [every consonant]]]]```<br><br>
Previously, 'to' was used to apply to a specific letter (of type _e_). However, now that its object is 'every consonant' (type _et_), the 'to' must be redefined to take in _et_ as its argument. This is done by taking in a function instead of a variable.<br>
- It was hard to find positive test cases, since first two letters had to be a glide or vowel, followed by a consonant, and the word had to have at least 4 letters.<br>

good test cases:
- aura
- wore
- wine
- yoyo

bad test cases:
- snack
- went
- sway
- wean

![e9 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e9tree.png)

### 10
_some vowel adjacent to every consonant is adjacent to letter two_<br>
**redefine 'every'**: ```LPLR.Lx.Ay[P(y) -> R(x)(y)]```<br>
**redefine 'to' as 'to-q'**: ```LR.R```<br>
**tree:** ```[result [.S  [some [vowel  [.VP [.AP [.AP [adjacent to-q] [.A [every consonant]]]]]]] [.VP [.V is] [.AP adjacent [.AP to [.A [letter two]]]]] ]]```<br><br>
In this problem, we are adding a whole relative clause into the subject, further restricting it. However, it still needs to simplify to type _et,t_ to be able to combine with the predicate as the subject would for any other sentence. we had to partially apply the "adjacent" function, every had to be modified to use a function that takes two parameters, and "to" had to take in a 2-parameter function instead of a single-parameter function the way it did in the previous problem.<br><br>
- It was hard to find positive examples for this problem as well. The word could only have 1 or 2 consonants, with either the vowel in position 1 and the consonant in position 2, or the vowel in position 3 and consonants in positions 2 and 3. By limiting the number of consonants and their positions respective of vowels, there were very few words I could come up with.
- Since 'you' doesn't have any consonant ('y' is a glide), the word's spelling don't break this rule<br>

good test cases:
- an
- ire
- you

bad test cases:
- ant
- can
- palm
- eat

![e10 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e10tree.png)

### 11
_no vowel follows letter two_<br>
**define 'follows'**: ```LyLx[D(y,x)]```<br>
**define 'not'**: ```LPLQ.Ax.[P(x) -> ~Q(x)]``` (from #7)<br>
**tree:** ```[result [.S  [not vowel] [.VP [.V follows] [.A [letter two]]]]]```<br><br>
To define 'follows', I just reversed the inputs into the 'precedes' function, since they check for the opposite ordering. Combining the definition of 'not' from #7 makes a simple statement.
<br>
- Finding positive examples up to 3 letters long was fine, but it was difficult to find positive examples longer than that - must end in a consonant cluster.<br>

good test cases:
- eat
- tin
- sing
- cysts

bad test cases:
- ate
- tear
- table

![e11 Tree](https://github.com/ey92/notes/blob/master/4744/hw4/e11tree.png)

### 12
_some vowel immediately precedes letter three_ (designated as e12)<br>
_some vowel immediately follows letter three_ (designated as e12b)<br>
**define 'follows'**: ```LyLx[D(y,x)]``` (from #11)<br>
**define 'immediately'**: ```LRLxLy[R(x)(y) & ~Ez_e.[~[~[D(x,z) & D(z,y)] & ~[D(y,z) & D(z,x)]]]]```<br>
12 **tree:** ```[result [.S [.VP [.NP [.D some] [.N vowel]] [.VP [.VP [.ADV immediately] [.V precedes]] [.N letter three]]]]]```<br>
12b **tree:** ```[result [.S [.VP [.NP [.D some] [.N vowel]] [.VP [.VP [.ADV immediately] [.V follows]] [.N letter three]]]]]```<br><br>
Defining immediately was one of the trickiest definitions for this homework. I had to use 3 variables as function parameters as well declare R as a 2-parameter function as another argument. When simplified, immediately is defined in terms of 3 terms x,y, and z such that x only _immediately_ precedes z if it does not precede anything else that also precedes z. Since there are 3 variables being handled, we must list the cases for either x or y immediately preceding z.<br>
The only difference between _e12_ and _e12b_ is that 'precedes' was replaced with 'follows', a term defined in a previous problem.

good test cases:
- eats
- meal
- water

bad test cases:
- tree
- ant
- cheese


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
**redefine 'no'**: ```LPLR.Lx.Ay[P(y) -> ~[R(y)(x)]]```<br>
**tree:** ```[result [.S  [letter four] [.VP [.V precedes] [.A [no consonant]]]]]```<br><br>
I used a definition of ```no``` that was similar to what I had of ```every``` in #10, except I negated the result. Using this, I could just build the logical tree as if it were a sentence, grouping keywords by "phrases."<br>

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

---
Although it took me a while to understand what was going on, I found it interesting that we can come up with a formula to represent any valid statement of a language. Just as mathematical formulas must follow predefined rules and conventions, the sentences of a language must follow the definitions we wrote for each word and eventually evaluate to a truth value. This (lambda expressions for semantics) was the most difficult topic for me by far, but once I began to understand it, I could see why it is interesting and how much it contributes to the understanding of how languages work.<br><br>
More closely related to the homework, I found the definition of "every" particularly interesting. In mathematical logic, the negation of "every"/"for all" is strictly "there exists" something of the opposite condition. However, since it was defined as a conditional _Ax[P(x)->Q(x)]_, there were multiple ways to negate its definition. We could create the conventional negation _Ex[P(x)->~Q(x)]_. But we can also just negate the implication _Ax[P(x)->~Q(x)]_, which became my definition for "no" (as a determinative).<br><br>
Also, when I had to redefine some of the words, such as "every" or "to," I initially just made up expressions just to make the types match. However, I began to realize that the overall formula for each statement could actually be understood and connected to the linguistic statement I had started with. Once I understood what each argument for each lambda expression meant, it became much easier to produce what I needed and understand what was going on.