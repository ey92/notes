Elizabeth Yam ey92 <br>
CS 4744 HW3

## Files
| problem | filename(s) |
| ------- | ----------- | 
| #1 | p1-bad.sent p1-good.sent <br> p1.lex p1.gram p1.start    p1.oc   p1.OC |
| #2 | p2.bad p2.good <br> p2.lex   p2.gram p2.start    p2.oc   p2.OC |
| #3 | p3.bad p3.good <br> p3.lex   p3.gram p3.start    p3.oc   p3.OC |
| #4 | p4a.bad p4b.bad p4c.bad p4d.bad <br> p4a.good p4b.good p4c.good p4d.good <br> p4a.lex p4a.gram    p4a.start   p4a.oc  p4a.OC <br> p4b.lex p4b.gram    p4b.start   p4b.oc  p4b.OC <br> p4c.lex p4c.gram    p4c.start   p4c.oc  p4c.OC <br> p4d.lex p4d.gram    p4d.start   p4d.oc  p4d.OC |
| #5 | p5.bad p5.good <br> p5.lex   p5.gram p5.start    p5.oc   p5.OC |

- NOTE: when using test files, need to translate spaces into newline characters <br> for example, `cat p3.good | tr ' ' '\n' | lopar -in p3`

### P1
#### Part A
p1-bad.sent
```
people need*
[people]* [need people]*
[people need]+
[people need people]*
[people]* [who people]*
[people]* [need who]*
[need people]*
people who need
```

#### Part B
p1-good.sent
```
people need people
people who need people need people
people who people need need people
people need people who need people
people who people who need people need need people
# people who people who people need need people
--
people need people who need people who need people who need people
people need people who need people who need people
people who need people who need people need people
people who people need need people who need people
people who people need need people who people need
people need people who need people who people need
```
- I removed the bad sentence (from piazza discussion), so the sentence marked with a '#' is no longer in the test cases

#### Part C
p1.lex
```
people  N   1.0
need    V   1.0
who     P   1.0
```

p1.gram
```
1.0     S N' V N
1.0     N N' P V N
1.0     N N' P N V
```

Chomsky Normal Form version:
```
1.0     S NP' VP
1.0     VP VB' NP
1.0     NP NP' NP1
1.0     NP1 WP' VP
1.0     NP1 WP' NP2
1.0     NP2 NP' VB
```

p1.start
```
S       1.0
```

![Sentence Parse Tree](https://github.com/ey92/notes/blob/master/4744/hw3/1.1tree.png)
![Sentence Parse Tree](https://github.com/ey92/notes/blob/master/4744/hw3/1.2tree.png)
![Sentence Parse Tree](https://github.com/ey92/notes/blob/master/4744/hw3/1.3tree.png)

#### Part D
```
people [who need people]* [who people need]* need people [who need people]* [who people need]*
people [who people]^{n} [need]^{n} need people [ who people need]*
```

#### Part E
No, it isn't licensed by my grammar, and no, it isn't intuitively possible.
- with square brackets grouping valid noun phrases: <br> `[people who [people who [people who people need] need] need] people`
- it is intuitively easy to understand the meaning in the smallest set of square brackets <br> `people who people need` <br> as a noun phrase
- replace that smallest noun phrase with another noun to continue simplifying: <br> `[people who [people who [monkeys] need] need] people`
- keep replacing and it will be clear that the sentence is not a valid English sentence:
    - `[people who [monkeys] need] people`
    - `[monkeys] people`
- the sentence is missing a verb

![Sentence Parse Tree](https://github.com/ey92/notes/blob/master/4744/hw3/p1esentparsetree.png)


#### Part F
(optional)

---

### P2
Finding Patterns: <br> First, I looked for groups of predicate endings that began the same way and found four groups (see columns in table below). I then looked for common ways sentence predicates began (see rows in table below). After that, it was just connecting which pieces went together and whether or not additional auxiliary verbs needed to be inserted.

| predicates | VPR <br> (verb base present) | MDB <br> (modified base) | VPP <br> (verb predicate past) | VPS <br> (verb predicate present) |
| ---------- | --- | --- | --- | --- |
| represents | discuss it | discussing it <br> being discussed <br> discussed | discussed it | discusses it |
| starts with may/should | VPR | be + MDB <br> have + been + MDB | have + VPP | |
| starts with has/had | | been + MDB | VPP | |
| starts with is/was | | MDB | | |

- each pair got the same label: 
    - may/should(MD)
    - has/had(VBH)
    - is/was(BES)
    - ridicule/discuss(VB)
    - ridicules/discusses(VBS)
    - ridiculed/discussed(VBD)
    - ridiculing/discussing(VBP)

p2.lex
```
he          NP  1.0
she         NP  1.0
may         MD  1.0
should      MD  1.0
have        AUX 1.0
has         VBH 1.0
had         VBH 1.0
be          BE  1.0
been        BEN 1.0
is          BES 1.0
was         BES 1.0
being       BEP 1.0
it          OBJ 1.0
ridicule    VB  1.0
discuss     VB  1.0
ridicules   VBS 1.0
discusses   VBS 1.0
ridiculed   VBD 1.0
discussed   VBD 1.0
ridiculing  VBP 1.0
discussing  VBP 1.0
```

p2.gram
```
1.0     VPR VB' OBJ     // discuss it
1.0     MDB VBP' OBJ    // discussing it
1.0     MDB BEP' VBD    // being discussed
1.0     VPS VBS' OBJ    // discusses it
1.0     VPP VBD' OBJ    // discussed it

1.0     S NP' VPS       // she discusses it
1.0     S NP' VPP       // she discussed it

1.0     S NP' VPM       // goes to may/should
1.0     VPM MD' VPR     // may/should discuss it
1.0     VPM MD' MDP     // may/should other predicates
1.0     MDP BE' MDB     // may/should be discussingit/beingdiscussed
1.0     MDP BE' VBD     // may/should be discussed
1.0     MDP AUX' HB     // may/should have been
1.0     HB BEN' MDB     // may/should have been discussingit/beingdiscussed
1.0     HB BEN' VBD     // may/should have been discussed
1.0     MDP AUX' VPP    // may/should have discussed it

1.0     S NP' H         // goes to has/had
1.0     H VBH' VPP      // has/had discussed it
1.0     H VBH' HB       // has/had been
1.0     HB BEN' MDB     // has/had been discussingit/beingdiscussed
1.0     HB BEN' VBD     // has/had been discussed

1.0     S NP' BP        // goes to is/was
1.0     BP BES' MDB     // is/was discussingit/beingdiscussed
1.0     BP BES' VBD     // is/was discussed
```
- since we are required to use Chomsky Normal Form with binary branching production rules, I separated "discussed"(VBD) from MDB predicates and just duplicated every MDB predicate rule, replacing with VBD.
    - for example `BP BES' MDB` and `BP BES' VBD`

![Sentence Parse Tree](https://github.com/ey92/notes/blob/master/4744/hw3/2.1tree.png)
![Sentence Parse Tree](https://github.com/ey92/notes/blob/master/4744/hw3/2.2tree.png)
![Sentence Parse Tree](https://github.com/ey92/notes/blob/master/4744/hw3/2.3tree.png)

---

### P3
#### Part A
queries: <br>
`tgrep -c 2010.crp 'VBD $. S' | sort -nr | uniq -c | sort -nr | head -50 > ~/VBDS50.txt` <br>
`tgrep -c 2010.crp 'VBD $. SBAR' | sort -nr | uniq -c | sort -nr | head -50 > ~/VBDSBAR50.txt` <br>
the two results in table form: 

| freq | VBD preceding S | freq | VBD preceding SBAR |
| ---- | --------------- | ---- | ------------------ |
| 7979 | had | 119916 | said |
| 7935 | wanted | 5513 | thought |
| 7713 | began | 4097 | was |
| 7032 | called | 4052 | found |
| 5793 | made | 3839 | knew |
| 4782 | tried | 2647 | noted |
| 4571 | declined | 2497 | suggested |
| 3888 | seemed | 2060 | added |
| 3683 | started | 1983 | felt |
| 3515 | was | 1949 | announced |
| 3498 | used | 1856 | showed |
| 3059 | appeared | 1779 | reported |
| 2845 | decided | 1776 | acknowledged |
| 2561 | failed | 1638 | came |
| 2475 | helped | 1458 | argued |
| 2464 | said | 1368 | believed |
| 2447 | found | 1153 | asked |
| 2402 | needed | 1129 | insisted |
| 2352 | agreed | 1062 | realized |
| 2080 | continued | 1039 | warned |
| 1813 | allowed | 1005 | concluded |
| 1707 | left | 961 | decided |
| 1674 | kept | 886 | estimated |
| 1662 | refused | 861 | indicated |
| 1601 | planned | 849 | wrote |
| 1535 | saw | 848 | learned |
| 1420 | expected | 804 | predicted |
| 1363 | let | 730 | confirmed |
| 1330 | sought | 668 | ruled |
| 1152 | got | 656 | claimed |
| 1080 | were | 608 | discovered |
| 1068 | stopped | 603 | wondered |
| 1024 | came | 595 | agreed |
|  992 | vowed | 580 | did |
|  990 | ordered | 567 | complained |
|  983 | managed | 566 | meant |
|  966 | considered | 561 | explained |
|  812 | chose | 501 | admitted |
|  798 | led | 450 | testified |
|  789 | forced | 437 | declared |
|  769 | promised | 435 | determined |
|  749 | threatened | 430 | hoped |
|  733 | intended | 422 | emphasized |
|  711 | hoped | 419 | cautioned |
|  687 | watched | 413 | saw |
|  658 | prompted | 406 | figured |
|  562 | caused | 399 | conceded |
|  559 | voted | 397 | questioned |
|  505 | required | 378 | looked |
|  487 | struggled | 375 | denied |

#### Part B
S/SBAR complement classes
- I mostly came up with example sentences using the verbs from and similar to those found in Part A and tried to generalize some patterns from them.

1. _question_<sup>1</sup> + [WP]<sup>6</sup> +  SBAR <br> _question_<sup>1</sup> + [WRB]<sup>6</sup> + SBAR
    1. he _questioned_ **who** could do such a thing
    2. he _wondered_ **what** was in the box
    3. he _asked_ **why** he deserved this
    4. he _inquired_ **where** the restaurant was
    5. he _speculated_ **how** things worked

2. _question_<sup>1</sup> + [whether] + S
    1. he _questioned_ **whether** he could do such a a thing
    2. he _asked_ **whether** he deserved this
    3. he _inquired_ **whether** the restaurant would be good
    4. he _wondered_ **whether** the prize was in the box
    5. he _speculated_ **whether** things worked out
    6. he _decided_ **whether** the race would happen
    6. he _decided_ **whether** the race would happen

3.  _says_<sup>2</sup> + [that] + S <br> _says (passive)_<sup>3</sup> + [that] + S  
    1. he _said_ **that** he could do such a thing
    2. he _stated_ **that** he deserved this
    3. he _declared_ **that** the restaurant would be good
    4. he _claimed_ **that** the prize was in the box
    5. he _announced_ **that** things worked out
    6. he _believed_ **that** the race would happen
    7. he _acknowledged_ **that** it was possible to finish early
    8. he _revealed_ **that** he had lived there before
    9. he _answered_ **that** he had chosen the location for its weather
    10. he _responded_ **that** snow days rarely happen
    11. he _replied_ **that** it was the only choice
    12. he _read_ **that** it was happiest place in the world
    13. he _conveyed_ **that** he preferred to live frugally
    14. he _asserted_ **that** the bot would respond to all messages
    15. he _thought_ **that** it the bot was happy

4. _order_<sup>3</sup> + [direct object] + [objective infinitive] (VP SBAR)
    1. he _ordered_ the army **to pitch** camp at the base of the mountain
    2. he _told_ the dog **to sit**
    3. he _persuaded_ her **to come** home

5. _try_<sup>4</sup> + [complementary infinitive] (VP SBAR)
    1. he _tried_ **to answer** as many questions as possible
    2. he _attempted_ **to climb** higher than last time
    3. he _endeavored_ **to complete** the fastest runtime
    4. he _aimed_ **to surpass** his teacher
    5. he _aspired_ **to become** the best
    6. he _thought_ **to try** harder
    7. he _wanted_ **to be** happy
    
6. [subject] is _says_<sup>2</sup> + [to have/to be] + (VP SBAR)
    1. he is _said_ **to have** done such a thing
    2. he is _stated_ **to have** deserved this
    3. he is _declared_ **to have** been good
    4. he is _claimed_ **to have** placed the prize in the box
    5. he is _announced_ **to have** worked things out
    6. he is _believed_ **to have** planned the race
    7. he is _acknowledged_ **to have** finish early
    8. he is _revealed_ **to have** lived there before
    9. he is _thought_ **to have** been happy


<sub>

<sup>1</sup> **question verbs**:    asked, inquired, questioned, wondered, speculated, decided

<sup>2</sup> **says verbs**:        said, stated, declared, claimed, announced, believed, acknowledged, revealed, thought

<sup>3</sup> **says passive verbs**: answered, responded, replied, read, conveyed, asserted

<sup>4</sup> **order verbs**:       told, persuaded, ordered

<sup>5</sup> **try verbs**:         tried, attempted, endeavored, aimed, aspired, wanted

<sup>6</sup> **WRB wh-adverb/WP wh-pronoun**: who, what, when, where, why

</sub>


#### Part C
CNF grammar

For this part, I only used a few verbs per category and reconstructed simple versions of sentences, but combined many of the constructions #1-6 from Part B via recursion to test.<br><br>
p3.lex
```
restaurant  NN  1.0     // nouns used for subjects or objects
box     NN  1.0
place   NN  1.0
bot     NN  1.0
dog     NN  1.0
cat     NN  1.0
it      IT  1.0

sit     OBI     1.0     // objective infinitives
send    OBI     1.0

take    CPI     1.0     // complementary infinitives
steal   CPI     1.0


asked       QV  1.0     // question verbs
wondered    QV  1.0

said        SV  1.0     // say verbs
believed    SV  1.0
declared    SV  1.0

asserted    SPV 1.0     // say passive verbs
thought     SPV 1.0

told    OV  1.0         // order verbs
ordered OV  1.0

tried   TV  1.0         // try verbs
wanted  TV  1.0

was     WAS 1.0
been    BEN 1.0

ran     WV  1.0         // normal verb for creating normal sentence
sat     WV  1.0


who     WPV 1.0         // wh-pronoun leading to verb predicates (SBARV)
what    WPV 1.0
which   WPV 1.0
when    WPN 1.0         // wh-adverb leading to sentence recursion 
where   WPN 1.0
why     WPN 1.0

in      P   1.0         // prepositions
before  P   1.0
out     P   1.0
into    P   1.0
about   P   1.0

to      TO  1.0
is      IS  1.0
be      BE  1.0
have    HV  1.0

he      SUB 1.0

a       DET 1.0
the     DET 1.0

whether WHE 1.0
that    THT 1.0

happy   ADJ 1.0
```

p3.gram
```
1.0     PP P' NP        // create prepositional phrase

1.0     NP DET' NN      // the noun
1.0     NP DET ADJ' NP  // the adjective noun

1.0     SUB NP'         // nouns can be subjects in addition to he/it

1.0     DO NP'          // construct direct objects from nouns
1.0     DO IT'          // it is a DO
1.0     DO NP'
1.0     DO NP' PP       // append prepositional phrase to DO

1.0     THV TO' HV      // to have
1.0     TBE TO' BE      // to be

1.0     OI TO' OBI      // objective infinitive "to sit"
1.0     CI TO' CPI      // complementary infinitive "to take"

// to be predicates
1.0     BEP TBE' ADJ    // to be adj
1.0     BEP TBE' DO     // to be NP (+PP)
1.0     HVP THV' BEN ADJ    // to have been adj

1.0     SBARV WV' NP    // SBARV is Verb Predicate of sentence
1.0     SBARV WV' PP    // (replace "S SUB" in all S productions with "SBARV")
1.0     SBARV QVP'
1.0     SBARV SVP'
1.0     SBARV SPVP'
1.0     SBARV OVP'
1.0     SBARV TVP'

1.0     SBARV IS' SV HVP
1.0     SBARV IS' SV BEP
1.0     SBARV IS' SV SBARV

1.0     SBARV WAS'
1.0     SBARV WAS' ADJ
1.0     SBARV WAS' NP
1.0     SBARV QV' NP
1.0     SBARV SV' NP
1.0     SBARV SPV' NP
1.0     SBARV OV' NP
1.0     SBARV TV' NP

// class #1 from Part B
1.0     QVP QV' WPV SBARV   // questionverb who/what/which verb predicate
1.0     QVP QV' WPN WAS DO  // questionverb when/where/why was NP (+PP)
1.0     QVP QV' WPN S       // questionverb when/where/why + S (recurse)

// class #2 from Part B
1.0     QVP QV' WHE S       // questionverb whether + S (recurse)

// class #3 from Part B
1.0     SVP SV' THT S       // sayverb that + S (recurse)
1.0     SVP SV' S           // "that" unnecessary
1.0     SPVP  SPV' THT S    // sayverbpassive that + S (recurse)
1.0     SPVP  SPV' S        // "that" unnecessary

// class #4 from Part B
1.0     OVP OV' NP OI DO    // orderverb + DO (being ordered) + obj inf + DO of inf
1.0     OVP OV' NP OI       // orderverb + DO (being ordered) + obj inf
1.0     OVP OV' DO BEP      // orderverb + DO (being ordered) + tobe predicate

// class #5 from Part B
1.0     TVP TV' TBE NP      // tryverb + tobe a noun
1.0     TVP TV' BEP         // tryverb + tobe predicate
1.0     TVP TV' CI DO       // tryverb + compl inf + DO of inf
1.0     TVP TV' OI PP       // tryverb + obj inf + PP
1.0     TVP TV' TO SBARV    // tryverb + to SBAR beginning with verb (recurse)
1.0     TVP TV' THV NP      // tryverb + to have something


1.0     S SUB' WV NP        // normal verb with NP DO
1.0     S SUB' WV PP        // normal verb with PP
1.0     S SUB' QVP          // applying classes from Part B
1.0     S SUB' SVP          // "
1.0     S SUB' SPVP         // "
1.0     S SUB' OVP          // "
1.0     S SUB' TVP          // "

// class #6 from Part B
1.0     S SUB' IS SV HVP    // subj is said to have been ___
1.0     S SUB' IS SV BEP    // subj is said to be ___
1.0     S SUB' IS SV SBARV  // subj is said to SBAR beginning with verb (recurse)

// basic sentences
1.0     S SUB' WAS          // subj was
1.0     S SUB' WAS ADJ      // subj was adj
1.0     S SUB' WAS NP       // subj was NP
1.0     S SUB' QV NP        // subj verbed NP
1.0     S SUB' SV NP        // "
1.0     S SUB' SPV NP       // "
1.0     S SUB' OV NP        // "
1.0     S SUB' TV NP        // "
```

p3.good
```
class 1
he wondered who was happy 
he asked where the dog was 
he asked who declared that he was happy 
he wondered who believed that he was happy 
he wondered who said he tried to be happy 

class 2
he wondered whether he was happy 
he asked whether he believed that he was happy 
he asked whether he wondered whether he wanted to be happy      // in sample parse below

class 3
he thought that he was happy 
he declared that he was happy 
he believed that he wanted to be happy 
he thought he believed that he was happy 

class 4
he told the dog to be happy 
he told the dog to sit 
he told the dog to send the bot 

class 5
he tried to be happy 
he wanted to be happy 
he wanted to have a dog 

class 6
he is said to be happy 
he is said to have been happy 

S basic
he was happy 
```
- very general classification of test sentences
- sample parse: <br>
![Sentence Parse](https://github.com/ey92/notes/blob/master/4744/hw3/p3sentparse.png)

- sample parse trees: <br>
![Sentence Parse Tree](https://github.com/ey92/notes/blob/master/4744/hw3/3.1tree.png)
![Sentence Parse Tree](https://github.com/ey92/notes/blob/master/4744/hw3/3.2tree.png)
![Sentence Parse Tree](https://github.com/ey92/notes/blob/master/4744/hw3/3.3tree.png)


---

### P4
For the test cases in these grammars, I wrote the good test cases individually and mixed the good test cases for the other 3 languages to form bad test cases, since the formal languages defined in each part should be mutually exclusive.

#### Part A
`a^{m} b^{m}     m > 0` <br>
p4a.gram
```
1.0     S C'
1.0     C A' C B
1.0     C A' B
```
- make sure every iteration inserts one A and one B before and after the recursive component respectively

![4a Sentence Parse Tree](https://github.com/ey92/notes/blob/master/4744/hw3/4atree.png)

#### Part B
`a^{m} b^{n}     n > m` <br>
p4b.gram
```
1.0     S C'
1.0     C A' C B
1.0     C C' B
1.0     C B
```
- assumed m can be 0
- make sure recursive element ends on B
- allow recursive element to only produce A if there is also a B
- allow recursive element to allow addition of only B within iteration

![4b Sentence Parse Tree](https://github.com/ey92/notes/blob/master/4744/hw3/4btree.png)

#### Part C
`[a b]^{n}      n > 0` <br>
p4c.gram
```
1.0     S C'
1.0     C A' B C
1.0     C A' B
```
- allow recursive element to repeat after A B
- force recursive element to end on A B so string has at least one instance of "ab"

![4c Sentence Parse Tree](https://github.com/ey92/notes/blob/master/4744/hw3/4ctree.png)

#### Part D
`a b+` <br>
p4d.gram
```
1.0     S A C'
1.0     C B' C
1.0     C B'
```
- force first production to start with A and never add A again
- recursive element only goes to adding any number of B
- recursive element must end with B to force at lease one B

![4d Sentence Parse Tree](https://github.com/ey92/notes/blob/master/4744/hw3/4dtree.png)

---

### P5
#### Part A
| prepositions | root |
| ------------ | ---- |
| of | rush, smoke,  taste,  layer,  change |
| with | mix,  cover,  talk,  work,  visit  |
| for | report,  test,  push,  scan,  check |

I initially used ANV.fsb to find words that could be a noun or a verb to get a verb to start with.
```
load defined ANV.fsb
regex N & V;
print random-words
```

![NV Intersection](https://github.com/ey92/notes/blob/master/4744/hw3/NVintersect.png)

I found the 3rd form [R p X] to be the hardest to come up with, so I queried the NYT2006 corpus with that, with the format of VB+IN+NN: <br>
`cwb-scan-corpus NYT2006 ?word+0="/rush/" word+0 ?pos+1="/IN/" word+1 ?pos+2="/NN/" word+2 | uniq -c | sort -nr | less` <br>
![rush+IN+NN query](https://github.com/ey92/notes/blob/master/4744/hw3/rushofNN.png) <br>
This gave me a list of prepositions to work with, so I replaced the initial verb with _part of speech (pos)_ as VB or VBD and replaced the _part of speech (pos)_ IN with some of the ones that I found in the query. Eventually, I ran these queries on NYT200x to get as much coverage as possible. <br>

Somehow all 45 verb-preposition pairs formed nominal complements. A few also formed verbal complements, but I chose to use their nominal complements since they were more popular in the corpora.

---
##### of
`cwb-scan-corpus NYT200x ?pos+0="/VB/" word+0 ?word+1="/of/" word+1 ?pos+2="/NN/" word+2 | uniq -c | sort -nr | less` <br>
![VB+of+NN 200x query](https://github.com/ey92/notes/blob/master/4744/hw3/VBofNN200x.png) <br>
From here, I pick an [R p X] phrase that I feel could be used commonly enough.
`cwb-scan-corpus NYT2006 ?word+0="/rush/" word+0 ?word+1="/of/" word+1 ?pos+2="/NN/" word+2 | uniq -c | sort -nr | less` <br>
![rush+of+NN 200x query](https://github.com/ey92/notes/blob/master/4744/hw3/rushofNN.png) <br>
Once I got enough phrases, I picked the ones I believed to be common enough and just searched for the other two required forms manually. <br>
`cwb-scan-corpus NYT2006 ?word+0="/oil/" word+0 ?word+1="/rush/" word+1 | uniq -c | sort -nr | less` <br>
![oil+rush 200x query](https://github.com/ey92/notes/blob/master/4744/hw3/oilrush.png) <br>
`cwb-scan-corpus NYT2006 ?word+0="/oil/" word+0 ?word+1="/rushed/" word+1 | uniq -c | sort -nr | less` <br>
![oil+rushed 200x query](https://github.com/ey92/notes/blob/master/4744/hw3/oilrushed.png) <br>



| | rush | smoke | taste | layer | change |
| - | - | - | - | - | - |
| [X R Tns] | oil rush -ed [1] | tobacco smoke -d [1] | meat taste -d [8] | cake layer -ed [4] | life change -d  [326] |
| [X R] | oil rush [11] | tobacco smoke [195] | meat taste [7] | cake layer [66] | life change [107] |
| [R p X] | rush of oil [4] | smoke of tobacco [2]  | taste of meat [4] | layer of cake [16] | change of life [85] |

---
##### with
`cwb-scan-corpus NYT200x ?pos+0="/VB/" word+0 ?word+1="/with/" word+1 ?pos+2="/NN/" word+2 | uniq -c | sort -nr | less` <br>
![VB+with+NN 200x query](https://github.com/ey92/notes/blob/master/4744/hw3/VBwithNN.png) <br>
`cwb-scan-corpus NYT200x ?word+0="/mix/" word+0 ?word+1="/with/" word+1 ?pos+2="/NN/" word+2 | uniq -c | sort -nr | less` <br>
![mix+with+NN 200x query](https://github.com/ey92/notes/blob/master/4744/hw3/mixwithNN.png) <br>
`cwb-scan-corpus NYT200x ?word+0="/milk/" word+0 ?word+1="/mix/" word+1 | uniq -c | sort -nr | less` <br>
![milk+mix 200x query](https://github.com/ey92/notes/blob/master/4744/hw3/milkmix.png) <br>
`cwb-scan-corpus NYT200x ?word+0="/milk/" word+0 ?word+1="/mixed/" word+1 | uniq -c | sort -nr | less` <br>
![milk+mixed 200x query](https://github.com/ey92/notes/blob/master/4744/hw3/milkmixed.png) <br>

| | mix | cover | talk | work | visit |
| - | - | - | - | - | - |
| [X R Tns] | milk mix -ed [10] | plastic cover -ed [5] | child talk -ed [1] | sound work -ed [1] | family visit -ed [76] |
| [X R] | milk mix [1] | plastic cover [63] | child talk [10] | sound work [12] | family visit [79] |
| [R p X] | mix with milk [4] | cover with plastic [16] | talk with child [5] | work with sound [8] | visit with family [22] |

---
##### for
`cwb-scan-corpus NYT200x ?pos+0="/VB/" word+0 ?word+1="/for/" word+1 ?pos+2="/NN/" word+2 | uniq -c | sort -nr | less` <br>
![VB+for+NN 200x query](https://github.com/ey92/notes/blob/master/4744/hw3/VBforNN.png) <br>
`cwb-scan-corpus NYT200x ?word+0="/test/" word+0 ?word+1="/for/" word+1 ?pos+2="/NN/" word+2 | uniq -c | sort -nr | less` <br>
![test+for+NN 200x query](https://github.com/ey92/notes/blob/master/4744/hw3/testforNN.png) <br>
`cwb-scan-corpus NYT200x ?word+0="/drug/" word+0 ?word+1="/test/" word+1 | uniq -c | sort -nr | less` <br>
![drug+test 200x query](https://github.com/ey92/notes/blob/master/4744/hw3/drugtest.png) <br>
`cwb-scan-corpus NYT200x ?word+0="/drug/" word+0 ?word+1="/tested/" word+1 | uniq -c | sort -nr | less` <br>
![drug+tested 200x query](https://github.com/ey92/notes/blob/master/4744/hw3/drugtested.png) <br>

| | report | test | push | scan | check |
| - | - | - | - | - | - |
| [X R Tns] | work report -ed [9] | drug test-ed [26] | reform push -ed [3] | information scan -ned [2] | blood check -ed [4] |
| [X R] | work report [22] | drug test [1318] | reform push [5] | information scan [1] | blood check [1] |
| [R p X] | report for work [71] | test for drug [3] | push for reform [26] | scan for information [3] | check for blood [5] |

#### Part B
p5.lex
```
oil     NN  1.0
tobacco NN  1.0
meat    NN  1.0
cake    NN  1.0
life    NN  1.0
milk    NN  1.0
plastic NN  1.0
child   NN  1.0
sound   NN  1.0
family  NN  1.0
works   NN  1.0
drug    NN  1.0
reform  NN  1.0
information     NN  1.0
blood   NN  1.0

rush    VOF 1.0
smoke   VOF 1.0
taste   VOF 1.0
layer   VOF 1.0
change  VOF 1.0

mix     VWI 1.0
cover   VWI 1.0
talk    VWI 1.0
work    VWI 1.0
visit   VWI 1.0

report  VFO 1.0
test    VFO 1.0
push    VFO 1.0
scan    VFO 1.0
check   VFO 1.0


of      POF 1.0
with    PWI 1.0
for     PFO 1.0

-ed     ED  1.0
the     DT  1.0
there   PO  1.0
was     WAS 1.0
good    JJ  1.0
```

p5.gram
```
1.0     S DT' RPXP      // determiner + [RpX] form phrase
1.0     RPXP RPX' P     // [RpX] phrase = [verb + with + noun] (RpX) + predicate (P)
1.0     RPX VOF' POF NN // build [RpX] form: RPX = base verb + [PP + noun]
1.0     RPX VWI' PWI NN
1.0     RPX VFO' PFO NN

1.0     S DT' XRP       // determiner + [XR] phrase
1.0     XRP XR' P       // [XR] phrase = [XR] form + predicate (P)
1.0     XR NN' VOF      // build [XR] base form as verb + noun
1.0     XR NN' VWI
1.0     XR NN' VFO

1.0     P WAS' JJ       // predicate = form of "to be" (was) + adjective (good)
1.0     SP PO' WAS      // subject phrase there was

1.0     S SP' XRTP      // determiner + XRT phrase
1.0     XRTP NN' VOF ED // XRT phrase = noun + verb + past tense
1.0     XRTP NN' VWI ED
1.0     XRTP NN' VFO ED
```

- the [RpX] and [XR] forms were easy to transform into sentences by prepending a determiner and appending a simple sentence predicate ("was good")
- however, not all the [X R Tns] forms could be transformed into sentences the same way. There seemed to be a pattern, depending on the preposition used.
    - the verbs paired with "of" could be turned into a complete sentence by prepending a determiner to the phrase.
        - e.g. [the] oil rushed
    - some of the verbs paired with "with" and "for" sounded strange when used in the active voice, so I prepended "there was" to turn them into the passive voice. This also applied to the "of" verbs, so I just used this one rule to simplify the grammar.

#### Part C
To help simplify the grammar for this problem, I made sure none of the verbs were paired with multiple prepositions.  This way, I didn't have to worry about whether or not the verb agreed with the preposition - instead, the verbs were classified into 3 groups, depending on which preposition they were paired with in the example.  Each preposition was also given its own tag. From there, I realized that the [X R Tns] phrase could be used as a predicate, only missing a noun phrase to be the subject of the verb.  The other two forms, [X R]  and [R p X], could be treated as noun phrases when a determiner was prepended. Afterwards, I just needed a simple predicate to turn them into sentences, so I just added "was good" to complete it. The remaining word components were just labeled as they would be in a normal lexicon (NN for noun, JJ for adjective, DT for determiner).

![p5 tree](https://github.com/ey92/notes/blob/master/4744/hw3/5.1tree.png) 
![p5 tree](https://github.com/ey92/notes/blob/master/4744/hw3/5.2tree.png) 
![p5 tree](https://github.com/ey92/notes/blob/master/4744/hw3/5.3tree.png) <br>
![p5 tree](https://github.com/ey92/notes/blob/master/4744/hw3/5.4tree.png) 
![p5 tree](https://github.com/ey92/notes/blob/master/4744/hw3/5.5tree.png) 
![p5 tree](https://github.com/ey92/notes/blob/master/4744/hw3/5.6tree.png) <br>
![p5 tree](https://github.com/ey92/notes/blob/master/4744/hw3/5.7tree.png) 
![p5 tree](https://github.com/ey92/notes/blob/master/4744/hw3/5.8tree.png) 
![p5 tree](https://github.com/ey92/notes/blob/master/4744/hw3/5.9tree.png)