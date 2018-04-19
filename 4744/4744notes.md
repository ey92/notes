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
N* means pos natural numbers?

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

#### function application
| tree |   type  |  logical term |
| - | - | - |
| F    |   ab    |  f |
| X    |   a     |  x |
| --- | --- | --- |
| tree     |  type  |  logical term |
| [X Y]    |  a     |  f(x) |
| [Y X]    |  b     |  f(x) |
| [VP is]         | et   |   {\lambda}.green(x) AND yeti(x) |
| [NP beelzebub]  | e    |   b |
| [S beelzebub]   | t    |   [{\lambda}.green(x) AND yeti(x)](b) <br> simplification: [green(b) AND yeti(b)] |

#### lambda conversion
```[{\lambda}x.green(x) AND yet(x)](b)   -> [green(b) AND yeti(b)]```

b substitutes for x in the body of the lambda term
- only substitute for free (unbound) variables
- avoid variables becoming bound when substituting

#### intersection
| X | at | f |  
| - | - | - |
| Y | at | g |
| --- | --- | --- |
| [X Y] | at | {\lambda}z[f(z) AND g(z)] |
| [Y X] | at | {\lambda}z[f(z) AND g(z)] |
| [A green]    |   et   |   {\lambda}x.green(x) |
| [N green]    |   et   |   {\lambda}x.yeti(x) |
| [NP green yeti] | et  |    [[{\lambda}x.green(x)] (z) AND [{\lambda}x.yeti(x)] (z)] |

- at is set of a's

- tree shapes -> logical formulas

- go back: logical formulas -> tree shapes

resources lecture folder: <br>
`java -jar ./Lambdap.jar`<br>
    basic: 3/6<br>
    quantifiers: 3/13<br>
    - lambda calculator GUI<br>
"try running this on the server, but i really don't recommend it"

- predicate modification: intersection
- lambda abstraction


##### [lambda calculator symbols](https://github.com/ey92/notes/blob/master/4744/lambdacalcsteps.md)

## categorial grammar
make syntax more like semantics (as opposed to being independent of word order)

simple1.gm
```./parse simple1.gm```

installed on kuno
- requires bigloo

```
edge: 4 keisha admires justin (0 3) t
semantics: (admire k j)
proofnet: ((t . t) (keisha (2 . e)) (admires (((2 . e) \ 1.t) / (3 . e))) ( justin (3 . e)) )
; semicolons are comments
; #f is false
; ^ means lambda?
```

```justin admires someone t = (some x ((person x) & (admire j x)))```
```D (1 / (1// (t \\t))) = (^ k (k ( ^ x x)))```
```justin admires someone (t // (t \\ t)) = (^ c (some x ((person x) & (c(admire j x)))))```
- c is variable
- apply lower meaning to identity function to get rid of the c
- continuation? variables over computations
    - continuation in linguistics means variable over meaning of the rest of the tree

- invent multimodal types in grammar?

## Movement Grammar/Minimalist Grammar
- like categorical grammar, but components are allowed to move
- e.g. "wh" movement
- usually move to the left
- "Minimalist Grammar"
- don't have direction of combination

```
['grammars/cat1.pl'].
showParse([she,in,it]).
```

cat1.pl
```
% Combinatory mechanics without movement.
% [inside,it] takes argument on right
% [she,in,it] takes first argument on right, second one on the left.

[it]::[e].
[she]::[d].

% L (Location) with D argument.

[inside]::[=e,t].
[in]::[=e,=d,t].
[f2]::[=d,=d,t].
[f3]::[=d,=d,=d,t].

startCategory(t)        // specify start category
```
- [=d,t] means takes argument of type d, returns t
- a = abort
- x = display
- if it doesn't parse, returns false

# Phonetics
- morpheme seq -> phone seq (underlying) -> phone seq (surface) -> speech signal
- requires _weighted finite state machines_ and weighted transductions
- _vector representation_ of speech signal:
    - each 10ms snippet of sound is represented by a vector of floats
- _multivariate gaussian distributions_ characterize the sounds (vectors) that can be emitted from a state

```
xfst[0]: regex a+;
xfst[1]: print net
Sigma: a
Size: 1.
Flags: deterministic, pruned, minimized, epsiolon_free
Srity: 1
s0: a-> fs1
fs1: a-> fst.

0 1 a 1.0
1 1 a 0.5
1 2 0 0.5
2
```
- negative log weights instead of normal weights
    - caveat: highest weight becomes lowest cost
```
0 1 a 0.0
1 1 a 0.693147182
1 2 0 0.693147182
2
```
- P(a) = 0.5
- P(aa) = 0.25
- P(aaa) = 0.125

- instead of multiplying probabilities, add negative log costs (adding is cheaper)

### Openfst
- toolkit from google research for weighted finite state transducers
```
$ fstcompile --acceptor --isymbols=a.sym b1.txm > b1.fsm
$ fstprint --isymbols=a.sym b1.fsm          // fsm only has 2 strings: a or b
0   1   a   1   0.693147182
0   1   b   2   0.693147182
$ fstconcat b1.fsm b1.fsm b1b.fsb           // concat fsm with itself to produce another fsm
$ fstprint --isymbols=a.sym b1b.fsm
0   1   a   1   0.693147182
0   1   b   2   0.693147182
1   2   -   0
2   3   a   1   0.693147182
2   3   b   2   0.693147182
3
```
- parse possible utterances & select the shortest path

### Kaldi
- toolkit from JHU for finite state speech recognition
- ~ 30 rows x 39 cols corresponding to a word
- phone alignments: frames for each phone
- sub-phone alignments
- each frame has 2 numbers
- `HList t rain/y1.mfcc | head`
- mel frequency cepstral coefficients
- ark - archive
- `ark:featw3.ark ark,t: - | cut -f1-10 -d' ' | less`'
- can dl from github
- type program name for man 

## Emiting Vectors
- states come with a multivariate gaussian distribution
- produces any vector with different probabilities
- standard use 13-39 dim

### using kaldi for spech recognition
```
> pwd
/projects/speech/sys/kaldi-master/egs/yesno
> cp -R s5 s5b
> cd s5b
> ls
conf input local path.sh run.sh steps utils
> source run.sh         // runs the whole demo
[gather data online]
[%WER = error]
```

#### data files
- data training and testing sets
- `wav.scp`
- key: utterance ID
- value: file location

- encoding of the signal
- `feats.scp`
- signal features
- key: utterance ID
- value: feature file with offset

`copy-feats scp:feats.scp ark,t:-`
- textual tabular representation
- convert archive file to text file
- key: ID
- value: matrix of utterance features
    - rows = 13-val feature vectors for each timeframe

`copy-feats scp:feats.scp ark,t:-:feat.ark`
- copy into binary archive file
`copy-feats scp:feats.scp ark,t:-`
- binary tabular representation

`utt2spk`
- key = utterance ID
- value = speaker ID
- useful to have multiple speakers useful to setup the model & normalize

`cmvn`
- means and standard deviations of features for a speaker
- used for normalizing features across speakers

`text`
- actual labels for what each utterance is

- many test directories with different utterances, short/long, gender, etc
- include `spk2gender` if multiple speakers

### Composition of Language
`lexicon.txt`
- phonetic lexicon similar to CMU
- lexicon from Librispeech demo, based on audiobooks
- trivial for the yesno demo, since each word is spelt with a single phone
- <SIL> "silence phone"
- `.../data/local/dict`

- `.../data/lang`
- `phones.txt`
- map from phone name to integers
- `#0`,`#1` empty string, marking beginning/end of word or phone
- `<s>`,`</s>` sentence start/end
- openfst always uses integers
- `L.fst`

`fstprint L.fst`
- prints fsm 
- `startstate nextstate input output weight`
- combines a lexicon and a grammar

`topo`
- topology
- prototype for how individual phones are modeled as fsms

### Results from Training system
`exp` directory
- training and testing separated
- `mono0a` train directory
- `final.mdl` training data - system learns acoustic model for what each phone is
- `gmm-copy --binary=false final.mdl final.mdl.txt`
    - gaussian mixture model
    - copy trained model into text format
    - has more info than prototype
    - learned theory of what beginning of each word sounds like
    - phones form quasi-steady-states
    - look for mean vector for a sound & std dev on vector -> characterized probability distribution
- 13 dims -> 39 by taking differences at adjacencies
    - called "feature transform"
        - velocity and acceleration (delta transform) of changes
        - adjacent features (sliding window)
    - 11 probability dimesion
- `ali.l.gz`
    - alignment
    - `ali.1` alignment between utterance and phone
- `ali-to-phones final.mdl ark:ali.1 ark,t:- | head -4`
    - pretty prints results, corresponding to assigned integer
- `ali-to-phones --write-lengths final.mdl ark:ali.1 ark,t:- | head -4`
    - includes lengths of each phone


---
final project (can change your mind)
1-2 page idea sketch
- can ask them for ideas
- can drop 1 hw if successful
- extra credit just for writing proposal with commitment
- any language goes
- groups up to 3, no bigger
- final writeup ~ 8 pages


check ldc and scholar
---
questions:
how to read parse tree/chart on slides? (clicker Q A: 5)

how to test final project?
how to use if

---
http://www.speech.cs.cmu.edu/cgi-bin/cmudict