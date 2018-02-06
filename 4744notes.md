| foma | meaning |
| ---- | ------- |
| 0 | empty string |
| & | intersect |
| \| | union |
| ^ | concatenate |
| * | 0 or more |
| + | 1 or more |
| ?^10 | set of 10-char strings|
| ?^{10,20} | set of 10-20-char strings|
| view | fsm |
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

caron

Nstem = [
	[ POND .x. {prud}] |
	[COLOR .x. {cvet}]
];

define U = P2;
define Upcase(X) [X .o. U].l;
define Shorter [?:?]* 0:?+;
define Longest (X) X - [Shorter .o. X].u;
# also works
define Longest (X) X 0 [X .o. Shorter .o. X].u;

regex Longest (N-$[" " | "-"]);
# electroencephalograph
interdominational
contradistinguish

/// right quotient
[A /// B] is a element of A with element B chopped off
regex [[A /// e] & [N /// {ity}]] e;

Contains
regex [N & $[{bat} | {bit}]] - $[" " | "-"];
$A 		contains A
$.A 	exactly one substring
$?A 	zero or one substring

i->I || b_t
i target of substitution
I substitute
b left context
t right context
regex i->I || b i* _ i* t;

regex [{bitter} .o. [[i t+] -> [I T] || b _]].;
[it+]	target of substitution
[I T] 	substitute
b 		left context
		no right context