# Karok

## Verb stems
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

### Choosing Verb Stems
- If the root starts with a consonant, take the first person singular form without the "ni" prefix. (first set of words)
- If the root starts with a vowel, take the imperative form without the "ʔ" prefix. (second set of words)

## Defining the alphabet used
```
def V [ {a} | {i} | {u} ];
def C [ {f} | {h} | {k} | {n} | {p} | {r} | {s} | {š} | {t} | {v} | {x} | {y} | {ʔ} ];
```


## Morphology
```
def Infl [IMP : 0] | [FSTSG : ni] | [THRDSG : ʔu];
def Phrase Infl.u "+" VStem.u;
def M VStem | "+":0 | Infl;
def Morph M+;
def Word [Phrase .o. Morph].l;
```

## Phonology
```def glottalPrepend [..] -> {ʔ} || .#. _ V ;
def delV [V -> 0 || [.#. ni | .#. ʔu] _];
def palatalize  s -> š || .#. [ ʔi | ni ] k* _;
def depalatalize š -> s || .#. [ʔu k*]* _;
def Phone glottalPrepend .o. delV .o. palatalize .o. depalatalize;
```

### Karok Phrase Relation and Set
```
def Karok Phrase .o. Morph .o. Phone;
def Karok2 [Word .o. Phone].l;
```

### Determining Morphological and Phonological Rules
I noticed that anytime a word form seemed to have a root starting with a vowel, a glottal stop ʔ was prepended to it in the imperative form. However some roots didn't lose their initial glottal stop when conjugated for the first person singular form. From that, I postulated that the roots of those words must have originally had the glottal stop as part of their root form while the other imperatives beginning with the glottal only had theirs as a result of being conjugated into the imperative form. This gave rise to the rule that the imperative form only results in a change if the word root begins with a vowel. This became the morphological rule [IMP : 0] and the phonological rule _glottalPrepend_.  For the other two conjugation forms, the morphological rules were rather simple: just prepend the prefix "ni" for first person singular ([FSTSG : ni]) or "ʔu" for third person singular ([THRDSG : ʔu]).

Thanks to the pointers from the question, the other two phonological rules were relatively easy to the determine: 
- _second vowel deletion_: Karok doesn't allow consecutive vowels, so the second vowel after a morphological change will be deleted, expressed in the rule _delV_. The only time this would happen is when a prefix causes there to be an extra vowel in front when the word root already begins with a vowel.
- _palatalization of "s"_: the letter "s" ws palatalized into "š" whenever the vowel before it was an "i". If there was no "i" preceeding the "s" or if there was another vowel between an "s" and a preceeding "i", then it would remain unpalatalized. This is expressed in the rules _palatalize_ and _depalatalize_.

Finally, since the the vowel delection could delete the initial "i" from some verb stems, influencing palatalization, that rule has to come before palatalization or depalatalization. Because glottal prepending due to phonological rules never occurs at the same time as when "ni" or "ʔu" is prepended from morphology, it doesn't matter when _glottalPrepend_ is applied, relative to the other phonological rules.
