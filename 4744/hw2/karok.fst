# Elizabeth Yam ey92
# CS 4744 HW2

# Problem 1 - Karok

# Verb stems
def VStem [ [ SHOOT .x. {pasip} ] | [ STEAL .x. {ši:tva} ] | [ STOOP .x. {kifnuk} ] | [ MEASURE .x. {šuprih} ] | [ PICKUP .x. {ʔifik} ] | [ PLUCKAT .x. {ʔaktuv} ] | [ FILL .x. {axyar} ] | [ JUMP .x. {iškak} ] | [ LAUGH .x. {ikšah} ] | [ SHOOTATTARGET .x. {išriv} ] | [ POINT .x. {ukšup} ]];

def V [ {a} | {i} | {u} ];
def C [ {f} | {h} | {k} | {n} | {p} | {r} | {s} | {š} | {t} | {v} | {x} | {y} | {ʔ} ];

# Morphology
def Infl [IMP : 0] | [FSTSG : {ni}] | [THRDSG : {ʔu}];
def Phrase Infl.u "+" VStem.u;
def M VStem | "+":0 | Infl;
def Morph M+;
def Word [Phrase .o. Morph].l;

# Phonology
def glottalPrepend [..] -> ʔ || .#. _ V ;
def delV [V -> 0 || [.#. {ni} | .#. {ʔu}] _];
def palatalize  s -> š || .#. [ {ʔi} | {ni} ] k* _;
def depalatalize š -> s || .#. [{ʔu} k*]* _;
def Phone glottalPrepend .o. delV .o. palatalize .o. depalatalize;

# Define lexicon based on Phones, Morphology, and Phrase
def Karok Phrase .o. Morph .o. Phone;

# Define relation mapping underlying to surface phonological forms
def Karok2 [Word .o. Phone];
