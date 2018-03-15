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

regex [[b:p] | a]+;     # turns b into p
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
| $.A | exactly one substring |
| $?A | zero or one substring |

```i->I || b_t```
i target of substitution
I substitute
b left context
t right context
```regex i->I || b i* _ i* t;```

```regex [{bitter} .o. [[i t+] -> [I T] || b _]].;```
[it+]   target of substitution
[I T]   substitute
b       left context
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
many sentences can be syntactically ambiguous

#### Grammar for tree language:
- CFGs
- Categorical grammar
- Minimalist movement grammar

#### Productivity
- speakers can use many phrases in this family, of seemingly unbounded size
- [titles of books on tables near windows in gardens by rivers in kingdoms]

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

`tgrep -c 2010.crp.gz 'NN' | sort -nr | uniq -C | sort -nr | head`

PP classes
temporal
locative
path


### CKY algorithm: parsing
- t labeled tree
- a address in dom(t)
- yield (t,a): sequence of terminal words
- span (t,a): index before first word, index after last word
- Chomsky normal form or two form

### Shared Forest Algorithms
data structure that compactly represents the trees that have a given yield (terminal string) and licensed by a given grammar

- span shared forest: CFG where symbols are span symbols 
- span symbol - tuple of symbol from old grammar and interval in terminal string
- e.g. NPL 0 1
- tabular parsing together with shared forests makes CFGs efficient or natural language syntax
- tree: N \Sigma P R(roots) L

count inside trees pseudocode
```
init integer array i [N U L U P] with zeros
for x in L
    do 
        i,x. <- 1
for p in P in bottom-up order
    do 
        i[p] <- PRODUCT over y in rhs(p) ^i[y]
        i[lhs(p)] <- i[lhs(p)] + i[p]
return i
```
- ensure children are visited before parents
    - by row bottop to top and left to in right in row
    - by column from left to right and top to bottom in column

- CKY bottom-up: will build components that will never become part of a tree
- filter out roots not used in licensed trees

tgrep search trees
```
>kuno:tgrep>which tgrep
/resources/corpus/tgrep
>kuno:tgrep> tgrep -c <corpus=web.crp> 'NP <2 DT' | tail
<trees>
>kuno:tgrep> tgrep -c web.crp 'NP <-1 NN <-2 NN <-3 DT'
<trees>
>kuno:tgrep> tgrep -c web.crp 'NP <-1 (NP <-2 NN)' | tail -3 | vpf
<popup tree>
>kuno:tgrep> tgrep -c web.crp 'NP <: DT' | tr 'A-Z' 'a-z' | sort | unique -C | sort -nr
    # upper to lower, sort, count unique, sort in descending freq
>kuno:tgrep> tgrep -c web.crp '__ < (VP <<. DT)' | tr 'A-Z' 'a-z' | sort | unique -C | sort -nr
>kuno:tgrep> tgrep -c web.crp '__ < (NP , PP-CLR)' | tr '$' '-'
>kuno:tgrep> tgrep -c 2007.crp 'S < (NP <- `NN) < (VP <1 `VBD <-1 VBD)' | awk -f /resources/H/HW3/two.awk | sort | uniq-c | sort -nr | less
>kuno:tgrep> tgrep -c 2007.crp 'S < (NP <- `NN) < (VP  <: `VBD)' | awk -f /resources/H/HW3/two.awk | sort | uniq -c | sort -nr | less
```

---
## CFGs in parser
- can be regex if purely left-branching or purely right-branching
- e.g. for the language `[a | b]+ b`

### Grammar Files
ab.lex
```
a   A   1.0
b   B   1.0
```

ab.gram
```
1.0     S A' T
1.0     S B' T
1.0     T A' T
1.0     T B' T
1.0     T B'
```
RHS of productions has to have a "head" (arbitrarily assign)

ab.start
```
S 1.0
```
ab.oc       # empty

ab.OC       # empty

### Input Files
ab.good

ab.bad
```
echo 'a b b b a b' | tr ' ' '\12'   # replace space to newline
echo 'a b b b a b' | tr ' ' '\12' | lopar -in ab -trees
echo 'a b b b a b' | tr ' ' '\12' | lopar -in ab -trees | vpf
```
- multiple sentences in same file
- separate sentences by blank line

#### include screenshots of results on pdf
- corpora under /resources/corpus
- translate '$' to '-'
- \`VBD prints the verb
- n.b. "if" ~ "whether" so counts as wh word

```
> cqp -D <corpus>
NYT 2005 > questioned 
NYT 2005 > "questioned";
NYT 2005 > [word="questioned"] [pos="DT"]
NYT 2005 > [lemma="question""] [pos="DT"]
```

```
>cwb-scan-corpus NYT2006 word+0="/questioned/" word+1 | unique -C | sort -nr | less
>cwb-scan-corpus NYT2006 pos+0="/VBD/" word+1 word+!="/whether/" | unique -C | sort -nr | less
>cwb-scan-corpus NYT2006 pos+0="/VBD/" ?word+1 lemma+0 word+1="/whether/" | unique -C | sort -nr | less
```

lopar tables

cols represent spans (1st col -> span 1)
```
cheese  N   1.0
behind  N   1.0
fish    N   1.0
near    P   1.0
on      P   1.0
```
```
1.0     PP  P' N
1.0     N   N' PP
```

| behind |  N |    | N |    | N |
| ------ | -- | -- | - | -- | - |
| behind |  P | PP |   | PP | |
| behind |  N |    | N |    | |
| near   |  P | PP |   |    | |
| cheese |  N |    |   |    | |

| n | a,A | i | length | left  | right | split |
| - | --- | - | ------ | ----- | ----- | ----- |
| 5 |     | 1 |   2    |   0   |   2   |  1    |
| 5 |     | 1 |   3    |   0   |   3   |  2    |
| 5 |     | 1 |   3    |   0   |   5   |  1    |
| 5 |     | 1 |   4    |   0   |   4   |  1    |

|   |  1  |  2  |   3   |    4     | 5 |
| - | --- | --- | ----- | -------- | - |
| 0 | N P | PP  |   N   | -- -- -- | N |
| 1 | N P | PP  | -- -- |    PP    |   |
| 2 | N P |     | N  -- |          |   |
| 3 |  P  | PP  |       |          |   |
| 4 |  N  |     |       |          |   |

- has labels not used in tree
- need to filter


- chomsky normal form grammar
    - min production length 2
    - don't need to check 1st col again

# Semantics
- use functional programming
- has ocaml types/type inferencing
    - n->n is < n, n >
- successor function?
- definition - identity functional
    LP.P
- referents?
- truths

- sentence produces truth values < n, nt >
- currying (turn 1-arg fn into multi-arg fn)
- < e t > set of values (value to truth value)
    - < et, et > is mapping set to set
- predicate logic 

- XBAR theory
    - phrases (NP,VP,DPetc)
- check if function can combine function and argument
    - intersection - apply each arg to dummy predicate z

- characteristic function
e.g. cornell ontology
undergrad: E -> {0,1}
    x |-> 1 if x is a member of the AD group rg.cuniv.student.undergrad
    x |-> 0 otherwise

logical language

| expressions | type labels  |  def | symbol |
| ------------| ------------ | ---- | ------ |
| b            |  e          | individual constant | element of E |
| undergrad    |  et         | truth constant      | characteristic function |
| undergrad(b) |  t          | formula             |  truth value |
| admire       |  (e*e)t     | two-place relation symbol | two-place relation symbol
| admire (j,k) |  t          | formula  | formula |

#### currying using \lambda
| function                            | type |
| ----------------------------------- | ---- |
| admire                              | (e\*e)t |
| {\lambda}y{\lambda}x.admire(x,y)    | eet |
| {\lambda}x.admire(x,k)              | et |
| {\lambda}x.admire(j,k)              | t |

function application
tree    type    logical term
F       ab      f
X       a       x

then
tree            type    logical term
[X Y]           a       f(x)
[Y X]           b       f(x)

[VP is]          et      {\lambda}.green(x) AND yeti(x)
[NP beelzebub]   e       b
[S beelzebub]    t       [{\lambda}.green(x) AND yeti(x)](b)
simplification           [green(b) AND yeti(b)]

lambda conversion
[{\lambda}x.green(x) AND yet(x)](b)   -> [green(b) AND yeti(b)]

b substitutes for x in the body of the lambda term
- only substitute for free (unbound) variables
- avoid variables becoming bound when substituting

intersection
X               at      f       // at is set of a's
Y               at      g
then
[X Y]           at      {\lambda}z[f(z) AND g(z)]
[Y X]           at      {\lambda}z[f(z) AND g(z)]

[A green]       et      {\lambda}x.green(x)
[N green]       et      {\lambda}x.yeti(x)
[NP green yeti] et      [[{\lambda}x.green(x)] (z) AND [{\lambda}x.yeti(x)] (z)]

tree shapes -> logical formulas

go back: logical formulas -> tree shapes

resources lecture folder:
`java -jar ./Lambdap.jar`
    basic: 3/6
    quantifiers: 3/13
    - lambda calculator GUI
"try running this on the server, but i really don't recommend it"

predicate modification: intersection
lambda abstraction


---
prelim 3/20
prelim review 3/15 (Shohini will be out)

#### Phonology Problem
surface form
| D AW G | dog sg |  
| D AW G Z | dog pl |
| K AE T | cat sg |
| K AE T S | cat pl |
1. underlying morphemes and morpheme sequences
```
define NSTEM [dog | cat];
define NUM [SG | PL];
define PHRASE  NSTEM "+" NUM;
```
2. underlying spelling of each morpheme
```
define M [[dog .x. {D AW G}] | [cat .x. {K AE T}] | [PL .x. {S}] | [SG .x. {0}]];
def MOR [NSTEM "+" NUM] .o. M+;
```
3. phonological rules
```
def voices S -> Z || [B|D|G] "+" _.#.
def boundary "+" -> 0;
# def Phone <phonological rule> .o. voices;
def Phone voices .o. boundary;
```
4. how to compose to give a finite state lexicon
```
define EngN MOR .o. Phone;
> apply up EngN
> D AW G Z
dog + PL
> apply down EngN
> dog + PL
D AW G Z

```

#### Parsing and shared forests
#### fst and CMU
#### Strategy formating CFG
#### encoding lexical information

---
questions:
how to read parse tree/chart on slides? (clicker Q A: 5)

---
http://www.speech.cs.cmu.edu/cgi-bin/cmudict