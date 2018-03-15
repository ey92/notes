### Phonology Problem
surface form

| D AW G | dog sg |  
| ----| ---- |
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

foma > apply up EngN
apply up > D AW G Z
dog + PL
foma > apply down EngN
apply down > dog + PL
D AW G Z

foma > [[dog "+" PL] .o. EngN].l;
R.l is the reduced range or the set of outputs co-domain of R (relation)
```

### fst and CMU
CMU is relation between orthographic forms and phonological forms

sets: Noun, Adjective, Verb

[Noun .o. CMU].l
- check hw problems for examples

### Strategy formatting CFG
- spines that require meddling
- {a<sup>n</sup>b<sup>n</sup> | n ε N+ } string in formal language
    - N+ positive natural numbers

{a<sup>m</sup>}b<sup>n</sup> | n ε N+, n >= m } string in formal language

p5.lex

```
a   A
b   B
```

p5.gram
```
S A B
S A S B
```

p5.start
```
S
```
{a<sup>m</sup>}b<sup>n</sup> | n ε N+, m >= n } string in formal language
p5.gram

```
S A S B
S A S B B
S A B
S A B B
```

[trees]

### encoding lexical information
speak to him
converse with him
converse to him
speak with him

lex
```
speak       V+to    V+with
converse    V+with
with        P+with
to          P+to

VP V+to PP+to
VP V+with PP+with
PP+to P+to VP
PP+with P+with NP
```

### Parsing and shared forests