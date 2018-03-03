need to include good/bad samples & screenshots for all

Elizabeth Yam ey92
CS 4744 HW3

## Files
| problem | filename(s) |
| ------- | ----------- | 
| #1 | p1-bad.sent <br> p1-good.sent <br> p1.lex    p1.gram     p1.start    p1.oc   p1.OC |
| #2 | p2.lex   p2.gram   p2.start  p2.oc    p2.OC |
| #3 |  |
| #4 | p4a.lex  p4a.gram     p4a.start   p4a.oc    p4a.OC <br> p4b.lex     p4b.gram    p4b.start  p4b.oc   p4b.OC <br> p4c.lex    p4c.gram   p4c.start     p4c.oc  p4c.OC <br> p4d.lex   p4d.gram  p4d.start    p4d.oc     p4d.OC |
| #5 |  |

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
--
people [who need people]* [who people need]* need people [who need people]* [who people need]*
people [who people]^{n} [need]^{n} need people [ who people need]*
```

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

p1.oc

p1.OC

#### Part D
```
people [who need people]* [who people need]* need people [who need people]* [who people need]*
people [who people]^{n} [need]^{n} need people [ who people need]*
```

#### Part E
No, it isn't licensed by my grammar, and no, it is intuitively possible.
- with square brackets grouping valid noun phrases: <br> `[people who [people who [people who people need] need] need] people`
- it is intuitively easy to understand the meaning in the smallest set of square brackets <br> `people who people need` <br> as a noun phrase
- replace that smallest noun phrase with another noun to continue simplifying: <br> `[people who [people who [monkeys] need] need] people`
- keep replacing and it will be clear that the sentence is not a valid English sentence:
    - `[people who [monkeys] need] people`
    - `[monkeys] people`
- the sentence is missing a verb

#### Part F
(optional)

---

### P2
Finding Patterns: First, I looked for groups of predicate endings that began the same way and found four groups (see columns in table below). I then looked for common ways sentence predicates began (see rows in table below). After that, it was just connecting which pieces went together and whether or not additional auxiliary verbs needed to be added.

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
1.0     HB BEN' VPD     // may/should have been discussed
1.0     MDP AUX' VPP    // may/should have discussed it

1.0     S NP' H         // goes to has/had
1.0     H VBH' VPP      // has/had discussed it
1.0     H VBH' HB       // has/had been
1.0     HB BEN' MDB     // has/had been discussingit/beingdiscussed
1.0     HB BEN' VPD     // has/had been discussed

1.0     S NP' BP        // goes to is/was
1.0     BP BES' MDB     // is/was discussingit/beingdiscussed
1.0     BP BES' VPD     // is/was discussed
```

---

### P4
#### Part A
`a^{m} b^{m}     m > 0` <br>
p4a.gram
```
1.0     S C'
1.0     C A' C B
1.0     C A' B
```
- make sure every iteration inserts one A and one B before and after the recursive component respectively

#### Part B
`a^{m} b^{n}     n > m` <br>
p4b.gram
```
1.0     S C'
1.0     C A' C B
1.0     C C' B
1.0     C B
```
- make sure recursive element ends on B
- allow recursive element to only produce A if there is also a B
- allow recursive element to allow addition of only B within iteration

#### Part C
`[a b]^{n}      n > 0` <br>
p4c.gram
```
1.0     S C'
1.0     C A' C
1.0     C B' C
1.0     C A'
1.0     C B'
```
- allow recursive element to add A or B
- force recursive element to end on A or B so string length is greater than 0

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