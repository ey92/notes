Elizabeth Yam ey92
CS 4744 HW2

## Files
| filename(s) | problem |
| ----------- | ---------- |
| karok.fst | #1 |
| yagua.fst | #2 |
| doublets.fst | #3 |
| | #4 |
| ITYnouns.fst <br> 5b.fst | #5 |

## \#1 Karok
### Verb stems
```
def VStem [ 
[ SHOOT .x. {pasip} ] | 
[ STEAL .x. {ši:tva} ] | 
[ STOOP .x. {kifnuk} ] | 
[ MEASURE .x. {šuprih} ] | 
[ PICKUP .x. {ʔifik} ] | 
[ PLUCKAT .x. {ʔaktuv} ] | 
[ FILL .x. {axyar} ] | 
[ JUMP .x. {iškak} ] | 
[ LAUGH .x. {ikšah} ] | 
[ SHOOTATTARGET .x. {išriv} ] | 
[ POINT .x. {ukšup} ]];
```

### Defining the alphabet used
```
def V [ {a} | {i} | {u} ];
def C [ {f} | {h} | {k} | {n} | {p} | {r} | {s} | {š} | {t} | {v} | {x} | {y} | {ʔ} ];
```

### Morphology
```
def Infl [IMP : 0] | [FSTSG : ni] | [THRDSG : ʔu];  # define inflections
def Phrase Infl.u "+" VStem.u;                      # define inflected words
def M VStem | "+":0 | Infl;                         # map mopheme sequence to phone spelling
def Morph M+;
def Word [Phrase .o. Morph].l;                      # words in spelling form
```

### Phonology
```def glottalPrepend [..] -> {ʔ} || .#. _ V ;      # prepend a glottal stop if starts with vowel
def delV [V -> 0 || [.#. ni | .#. ʔu] _];           # delete the second of two consecutive vowels
def palatalize  s -> š || .#. [ ʔi | ni ] k* _;     # palatalize s if preceeding vowel is i
def depalatalize š -> s || .#. [ʔu k*]* _;          # depalatalize s if preceeding vowel is not i

def Phone glottalPrepend .o. delV .o. palatalize .o. depalatalize;
```

### Karok Phrase Relation and Set
```
def Karok Phrase .o. Morph .o. Phone;
def Karok2 [Word .o. Phone].l;
```

#### Choosing Verb Stems
- If the root starts with a consonant, take the first person singular form without the "ni" prefix. (first set of words)
- If the root starts with a vowel, take the imperative form without the "ʔ" prefix. (second set of words)

#### Determining Morphological and Phonological Rules
I noticed that anytime a word form seemed to have a root starting with a vowel, a glottal stop ʔ was prepended to it in the imperative form. However some roots didn't lose their initial glottal stop when conjugated for the first person singular form. From that, I postulated that the roots of those words must have originally had the glottal stop as part of their root form while the other imperatives beginning with the glottal only had theirs as a result of being conjugated into the imperative form. This gave rise to the rule that the imperative form only results in a change if the word root begins with a vowel. This became the morphological rule [IMP : 0] and the phonological rule _glottalPrepend_.  For the other two conjugation forms, the morphological rules were rather simple: just prepend the prefix "ni" for first person singular ([FSTSG : ni]) or "ʔu" for third person singular ([THRDSG : ʔu]).

Thanks to the pointers from the question, the other two phonological rules were relatively easy to the determine: 
- _second vowel deletion_: Karok doesn't allow consecutive vowels, so the second vowel after a morphological change will be deleted, expressed in the rule _delV_. The only time this would happen is when a prefix causes there to be an extra vowel in front when the word root already begins with a vowel.
- _palatalization of "s"_: the letter "s" ws palatalized into "š" whenever the vowel before it was an "i". If there was no "i" preceeding the "s" or if there was another vowel between an "s" and a preceeding "i", then it would remain unpalatalized. This is expressed in the rules _palatalize_ and _depalatalize_.

Finally, since the the vowel delection could delete the initial "i" from some verb stems, influencing palatalization, that rule has to come before palatalization or depalatalization. Because glottal prepending due to phonological rules never occurs at the same time as when "ni" or "ʔu" is prepended from morphology, it doesn't matter when _glottalPrepend_ is applied, relative to the other phonological rules.

## \#2 Yagua
I treated the noun and verb sections as different problems, since I couldn't assume that the same patterns would apply to both nouns and verbs.

### Noun stems
```
def NStem [[ WATER .x. {haa} ] | [ SLOTH .x. {pahiitu} ] | [ PAN .x. {pay} ] | [ SKIN .x. {hay} ]];
```
From other languages I have studied, I assumed the basic noun forms would come from their nominative forms, which proved to work well with Yagua.

### Noun Morphology
```
def Poss [HIS : {ca}] | [MY : {ra}];    # define different possessors (prefixes)
def Decl [DAT : {hu}];                  # define declension (suffix)
def InflN Decl | Poss;                  # possible inflections

def PhraseN [Poss.u "+"]^{0,1} NStem.u [ "+" Decl.u]^{0,1};         # assign prefixes/suffixes to precede/follow stem

def MN InflN | "+":0 | NStem;           # map mopheme sequence to phone spelling
def MorphN MN+;

def Noun [PhraseN .o. MorphN].l;        # Noun in spelling form
```

### Noun Phonology
```
def flipa {ay} -> {e} || .#. r a [p | h] _;             # convert -ay to -e suffix when beginning with ra- prefix
def swap {yhu} -> {hyu} || _ .#.;                       # swap y and h
def inserty [..] -> y || r a [h | p] [{eh}*] _ [a | u]; # insert y after "h", "p", or "heh" when word begins with ra- prefix

def PhoneN flipa .o. swap .o. inserty;
```

### Yagua Noun Phrase Relation and Set
```
def YaguaN PhraseN .o. MorphN .o. PhoneN;   # Define lexicon based on Phones, Morphology, and Phrase
def YaguaN2 [Noun .o. PhoneN];              # Define relation mapping underlying to surface phonological forms
```

---
### Verb stems
```def VStem [[ FIT .x. {caa} ] | [ GIVE .x. {caay} ] | [ FRY .x. {ruye} ]];```

### Morphology
```
def Subj [[HE : {ca}] | [I : {ra}]];    # define subject prefixes
def DO [IT : {ra}];                     # define direct object suffix
def InflV Subj | DO;                    # possible inflections

def PhraseV Subj.u "+" VStem.u ["+" DO.u]^{0,1};        # assign prefixes/suffixes to precede/follow stem

def MV InflV | "+":0 | VStem;           # map mopheme sequence to phone spelling
def MorphV MV+;

def Verb [PhraseV .o. MorphV].l;        # Verb in spelling form
```

### Phonology
```
def flipaa {aay} -> {ee} || .#. r a c _ ;   # convert -aay to -ee when beginning with ra- prefix
def swap2 {yra} -> {rya} || _ .#.;          # swap y and r

# insert y after "c" or "r" when word begins with ra-prefix or if word ends in -era, convert to -erya suffix
def inserty2 [[..] -> y || .#. r a [c | r] _ [a | u]] .o. [{era} -> {erya} || _ .#.];           

def PhoneV flipaa .o. swap2 .o. inserty2;
```


### Yagua Noun Phrase Relation and Set
```
def YaguaV PhraseV .o. MorphV .o. PhoneN;   # Define lexicon based on Phones, Morphology, and Phrase
def YaguaV2 [Verb .o. PhoneV];              # Define relation mapping underlying to surface phonological forms
```

#### Determining Morphological and Phonological Rules
- Unlike Karok, Yagua adds both prefixes and suffixes, so the both the noun and verb phrases had to be defined with prefixes specifically before the stem and suffixes only placed after the stem
- The remaining morphological patterns could be easily observed by comparing each word's new form when adding the same meanings to build similar phrases. From there, the phonological rules for both were rather similar and pretty straightforward to build. 

## \#3 Doublets
### Part A
[TODO]

### Part B
```
def missingDoublets [
[THETA .x. {THEY1TAH0}|{THIY1TAH0}] ] | 
[ENTRANCE .x. {EH2NTRAH1NS}|{EH1NTRAH0NS}] | 
[CONSORT .x. {KAA1NSAO0RT}|{KAH0NSAO1RT}] | 
[DISCHARGE .x. {DIH1SCHAA2RJH}|{DIH0SCHAA1RJH}] | 
[TRANSPOSE .x. {TRAE1NSPOW2Z}|{TRAE0NSPOW1Z}] ];
```

### Part C
Most doublets seem to be noun/verb pairs, where the meanings are related and the noun forms were likely derived from the verb forms, known as deverbal nouns, as opposed to gerundives. Similarly to how we use gerundives, English speakers probably began using verbs as nouns.  However, since English seems to have different stress rules for different categories of words, these deverbal nouns ended up being pronounced differently when used as nouns, leading to these stress doublets that we have found.  However, nouns can also turn into verbs, which was probably the case with the word "forecast".

## \#4 

## \#5 ITY Nouns
### Part A
```
def add [N /// {ity}] & A;              # found 167 adjectives/ITY nouns (provided)
def adde [[N /// {ity}] e] & A;         # found 97 adjectives/ITY nouns (provided)
def ous [[N /// {ity}] {ous}] & A;      # found 33 adjectives/ITY nouns
def ious [[N /// {ity}] {ious}] & A;    # found 22 adjectives/ITY nouns
def al [[N /// {ity}] {al}] & A;        # found 13 adjectives/ITY nouns
def ist [[N /// {ity}] {ist}] & A;      # found 11 adjectives/ITY nouns

def uous [[N /// {ity}] {uous}] & A;    # found 0 adjectives/ITY nouns
```
I looked up common adjective endings and tested them against ITY nouns to see how many more I could find.

### Part B
see _5b.fst_ file

I used the following regexes to find which words from Part A were in the CMU dictionary and to find their phonological forms:
```
regex [[add .o. upper].l & CMU.u].l;
regex [[adde .o. upper].l & CMU.u].l;
regex [[ous .o. upper].l & CMU.u].l;
regex [[ious .o. upper].l & CMU.u].l;
regex [[al .o. upper].l & CMU.u].l;
regex [[ist .o. upper].l & CMU.u].l;

# put words through CMU to get phonological forms
regex [[[add .o. upper].l & CMU.u].l .o. CMU].l;
regex [[[adde .o. upper].l & CMU.u].l .o. CMU].l;
regex [[[ous .o. upper].l & CMU.u].l .o. CMU].l;
regex [[[ious .o. upper].l & CMU.u].l .o. CMU].l;
regex [[[al .o. upper].l & CMU.u].l .o. CMU].l;
regex [[[ist .o. upper].l & CMU.u].l .o. CMU].l;
```
I also observed that there was a pattern with how the phonological endings of adjectives became -ity nouns, usually ending with the vowels IH0 and AH0.  I then applied the same morphological-phonological structure from problems 1 and 2. However, it was very difficult to find any other patterns. This is likely due to English having so many influences from different language families and loaning foreign words into our vocabulary.

### Part C
I used similar regexes to those from Part B to find which words _weren't_ in the CMU dictionary.
```
def upper [a<->{A}, b<->B, c<->C, d<->D, e<->E, f<->F, g<->G, h<->H, i<->I, j<->J, k<->K, l<->L, m<->M, n<->{N}, o<->O, p<->P, q<->Q, r<->R, s<->S, t<->T, u<->U, v<->{V}, w<->W, x<->X, y<->Y, z<->Z];
regex [add .o. upper].l & ~CMU.u;
regex [adde .o. upper].l & ~CMU.u;
regex [ous .o. upper].l & ~CMU.u;
regex [ious .o. upper].l & ~CMU.u;
regex [al .o. upper].l & ~CMU.u;
regex [ist .o. upper].l & ~CMU.u;
```
I then manually created the phonological forms and created a set to append to the given CMU dictionary, deciding on stresses by sounding them out and comparing to similar words that are in the CMU dictionary. (See ITYnouns.fst to view the list of adjective/noun words missing from the CMU dictionary).