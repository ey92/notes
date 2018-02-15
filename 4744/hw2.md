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
def Infl [IMP : 0] | [FSTSG : ni] | [THRDSG : ʔu]; 	# define inflections
def Phrase Infl.u "+" VStem.u; 						# define inflected words
def M VStem | "+":0 | Infl; 						# map mopheme sequence to phone spelling
def Morph M+;
def Word [Phrase .o. Morph].l; 						# words in spelling form
```

### Phonology
```def glottalPrepend [..] -> {ʔ} || .#. _ V ; 		# prepend a glottal stop if starts with vowel
def delV [V -> 0 || [.#. ni | .#. ʔu] _]; 			# delete the second of two consecutive vowels
def palatalize  s -> š || .#. [ ʔi | ni ] k* _; 	# palatalize s if preceeding vowel is i
def depalatalize š -> s || .#. [ʔu k*]* _; 			# depalatalize s if preceeding vowel is not i

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
def Poss [HIS : {ca}] | [MY : {ra}]; 		# define different possessors (prefixes)
def Decl [DAT : {hu}]; 						# define declension (suffix)
def InflN Decl | Poss; 						# possible inflections

def PhraseN [Poss.u "+"]^{0,1} NStem.u [ "+" Decl.u]^{0,1}; 		# assign prefixes/suffixes to precede/follow stem

def MN InflN | "+":0 | NStem; 				# map mopheme sequence to phone spelling
def MorphN MN+;

def Noun [PhraseN .o. MorphN].l;			# Noun in spelling form
```

### Noun Phonology
```
def flipa {ay} -> {e} || .#. r a [p | h] _; 				# convert -ay to -e suffix when beginning with ra- prefix
def swap {yhu} -> {hyu} || _ .#.;							# swap y and h
def inserty [..] -> y || r a [h | p] [{eh}*] _ [a | u]; 	# insert y after "h", "p", or "heh" when word begins with ra- prefix

def PhoneN flipa .o. swap .o. inserty;
```

### Yagua Noun Phrase Relation and Set
```
def YaguaN PhraseN .o. MorphN .o. PhoneN; 	# Define lexicon based on Phones, Morphology, and Phrase
def YaguaN2 [Noun .o. PhoneN];				# Define relation mapping underlying to surface phonological forms
```

---
### Verb stems
```def VStem [[ FIT .x. {caa} ] | [ GIVE .x. {caay} ] | [ FRY .x. {ruye} ]];```

### Morphology
```
def Subj [[HE : {ca}] | [I : {ra}]]; 				# define subject prefixes
def DO [IT : {ra}]; 								# define direct object suffix
def InflV Subj | DO; 								# possible inflections

def PhraseV Subj.u "+" VStem.u ["+" DO.u]^{0,1}; 	# assign prefixes/suffixes to precede/follow stem

def MV InflV | "+":0 | VStem; 						# map mopheme sequence to phone spelling
def MorphV MV+;

def Verb [PhraseV .o. MorphV].l;					# Verb in spelling form
```

### Phonology
```
def flipaa {aay} -> {ee} || .#. r a c _ ; 			# convert -aay to -ee when beginning with ra- prefix
def swap2 {yra} -> {rya} || _ .#.; 					# swap y and r

# insert y after "c" or "r" when word begins with ra-prefix or if word ends in -era, convert to -erya suffix
def inserty2 [[..] -> y || .#. r a [c | r] _ [a | u]] .o. [{era} -> {erya} || _ .#.]; 		

def PhoneV flipaa .o. swap2 .o. inserty2;
```


### Yagua Noun Phrase Relation and Set
```
def YaguaV PhraseV .o. MorphV .o. PhoneN; 			# Define lexicon based on Phones, Morphology, and Phrase
def YaguaV2 [Verb .o. PhoneV];						# Define relation mapping underlying to surface phonological forms
```

#### Determining Morphological and Phonological Rules
- Unlike Karok, Yagua adds both prefixes and suffixes, so the both the noun and verb phrases had to be defined with prefixes specifically before the stem and suffixes only placed after the stem
- The remaining morphological patterns could be easily observed by comparing each word's new form when adding the same meanings to build similar phrases. From there, the phonological rules for both were rather similar and pretty straightforward to build. 
