| foma | meaning |
| ---- | ------- |
| 0 | empty string |
| & | intersect |
| \| | union |
| ^ | concatenate |
| * | 0 or more |
| + | 1 or more |
| ?&10 | set of 10-char strings|
| ?&{10,20} | set of 10-20-char strings|
| view | fms |
| print words | |
| print words > syl.out | output to file |
| print random-words | |
| print net | displays states and outgoing paths |

| Ss0 | starting state |
| --- | -------------- |
| s1 | state |
| fs3 | potential final state |

singular denotes single-element set
one-from rule tends to multiply sets
empty string ~ identity in concatenation
@ = any character not included in machine

```
define C p|t|k;
define V [i|u|e|o];
define Syl [V | [C V] | [V C] | [C V C]];
regex syl
```

one of each set
> define N C V

*boolean operations
> regex [a b*] - a;

define VerbUpper Root Inflection;
read regex VerbUpper;

define eElision e -> 0 || _%+[e|i];
define Tag [VG|VBD|VBZ];
define symbolElision [Tag|%+] -> 0;

> apply down
apply down > file+ed
fil+ed

set print-space ON

regex [[b:p] | a]+;		turns b into p

Relation Composition
|| R .o. S|| = 

inverting operation
define verbi verb.i

take one side of form
verb.l (lower)
verb.u (upper)

define verb VerbUpper.o. eElision .o. symbolElision

irregular verbs must be defined