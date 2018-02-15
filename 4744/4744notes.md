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

- singular denotes single-element set
- one-from rule tends to multiply sets
- empty string ~ identity in concatenation
- @ = any character not included in machine

```
define C p|t|k;
define V [i|u|e|o];
define Syl [V | [C V] | [V C] | [C V C]];
regex syl
```

one of each set
```define N C V;```

boolean operations
```regex [a b*] - a;```

```
define VerbUpper Root Inflection;
read regex VerbUpper;

define eElision e -> 0 || _%+[e|i];
define Tag [VG|VBD|VBZ];
define symbolElision [Tag|%+] -> 0;

> apply down
apply down > file+ed
fil+ed

set print-space ON

regex [[b:p] | a]+;		# turns b into p
```

Relation Composition
```|| R .o. S|| = ```

inverting operation
```define verbi verb.i```

take one side of form
- verb.l (lower)
- verb.u (upper)

```define verb VerbUpper.o. eElision .o. symbolElision```

irregular verbs must be defined

caron

```
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
```

/// right quotient
```[A /// B]``` is a element of A with element B chopped off
```regex [[A /// e] & [N /// {ity}]] e;```

#### Contains
regex [N & $[{bat} | {bit}]] - $[" " | "-"];

| | |
| - | - |
| $A | contains A |
| $.A |	exactly one substring |
| $?A | zero or one substring |

```i->I || b_t```
i target of substitution
I substitute
b left context
t right context
```regex i->I || b i* _ i* t;```

```regex [{bitter} .o. [[i t+] -> [I T] || b _]].;```
[it+]	target of substitution
[I T] 	substitute
b 		left context
		no right context

## 8/2 CFGs
---
CFG ant Nuts-and-Bolts Parsing
- ambiguities corresponding with tree structure
- difference in reading/meaning results in difference in tree structure

he saw [a man with a telescope]
- [a man with a telescope] was seen -> NP
- [what man with a telescope] did he see? -> (WH movement)
- [a man with a telescope] he saw
	- implications for tree shape?
- movement diagnostics: wen prases "move", they do so as units, and transform the semantics in a - systematic way
	- in NP reading, PP forms unit with "a man"

```
a man was seen with a telescope
what man did he see with a telescope?
a man he saw with a telescope
	- all intuitively ambiguous
	PP can move right
a man was seen with a telescope
a man with a telescope was seen
```
many sentences can be sytactically ambiguous

#### Grammar for tree language:
- CFGs
- Categorical grammar
- Minimalist movement grammar

#### Productivity
speakers can use many phrases in this family, of seemingly unbounded size
[titles of books on tables near windows in gardens by rivers in kingdoms]

#### Ambiguity
..?

### CFG: tree-licensing interpretation - all local trees must be in the grammar
1. set of rules/productions/local trees constructed form vocabularies
	NP -> NP PP
	PP -> PP NP
	NP -> noun (lexicon)
2. Terminals: ?
3. ?

### Tree Licensing (acceptance)
/t/ is licensed as an NPl because local tree at each non-terminal vertex is production of the grammar, root is з

**parsing**: given a terminal string and grammar, find all the trees that have the given terminal string and are licensed by the grammar as a start symbol of the grammar

```
cat sentA.in | lopar -in pp -trees | vpf
vpf #view in tree form
# sentA.in is sentence in textfile, each word on new line, blank line between new sentences
```

#### Tree domains and Gorn Trees
Gorn trees to define derivation trees
- def: tree domain D is a nonempty subset of strings in N* satisfying conditions
```
1. for all u,v ϵ N*+, if uv ϵ D, then u ϵ D
2. for all u ϵ N*+, for every i ϵ N+, if ui ϵ D, then uj ϵ D for every j, 1 <= j <= i
```
domain of tree t is dom(t), tree address or node

syntax trees

```tgrep -c 2010.crp.gz 'NN' | sort -nr | uniq -C | sort -nr | head```

PP classes
temporal
locative
path

---
questions:
1. how to prefix using morphological substitutions?





---
Karok
s -> sh | i_s
#V -> #ʔV | #V_



https://www.quora.com/What-words-can-act-as-both-nouns-and-verbs
envelope
research
indent
recoil
invite
discard
compost

theta
	- shows up on cmu site, but not in given cmu2.fsb file
entrance
consort
discharge
	- shows up on cmu site, but not in given cmu2.fsb file
transpose

https://en.wikipedia.org/wiki/Deverbal_noun
https://en.wikipedia.org/wiki/List_of_English_homographs

http://www.speech.cs.cmu.edu/cgi-bin/cmudict