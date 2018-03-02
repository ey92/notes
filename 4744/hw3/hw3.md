## P1
### Part A
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

### Part B
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

### Part C
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

p1.start
```
S       1.0
```

p1.oc
p1.OC

### Part D

### Part E
No, it isn's licensed by my grammar, and no, it is intuitively possible.
- with square brackets grouping valid noun phrases: `[people who [people who [people who people need] need] need] people`
- it is intuitively easy to understand the meaning in the smallest set of square brackets _people who people need_ as a noun phrase
- replace that smallest noun phrase with another noun to find that it is still  valid: `[people who [people who [monkeys] need] need] people`
- keep replacing and it will be clear that the sentence is not a valid English sentence:
    - `[people who [monkeys] need] people`
    - `[monkeys] people`
- the sentence is missing a verb

### Part F
(optional)