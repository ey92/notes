# Karok

# Verb stems
def VStem [ [ SHOOT .x. {pasip} ] | [ STEAL .x. {ši:tva} ] | [ STOOP .x. {kifnuk} ] | [ MEASURE .x. {šuprih} ] | [ PICKUP .x. {ʔifik} ] | [ PLUCKAT .x. {ʔaktuv} ] | [ FILL .x. {axyar} ] | [ JUMP .x. {iškak} ] | [ LAUGH .x. {ikšah} ] | [ SHOOTATTARGET .x. {išriv} ] | [ POINT .x. {ukšup} ]];

def V [ {a} | {i} | {u} ];
def C [ {f} | {h} | {k} | {n} | {p} | {r} | {s} | {š} | {t} | {v} | {x} | {y} | {ʔ} ];


def Infl [IMP : 0] | [FSTSG : ni] | [THRDSG : ʔu];
def Phrase Infl.u "+" VStem.u;
def M VStem | "+":0 | Infl;
def Morph M+;
def Word [Phrase .o. Morph].l;


def glottalPrepend [..] -> {ʔ} || .#. _ V ;
def delV [V -> 0 || [.#. ni | .#. ʔu] _];
def palatalize  s -> š || .#. [ ʔi | ni ] k* _;
def depalatalize š -> s || .#. [ʔu k*]* _;
def Phone glottalPrepend .o. delV .o. palatalize .o. depalatalize;

def Karok Phrase .o. Morph .o. Phone;
def Karok2 [Word .o. Phone].l;

regex Karok2 & [ni ?*];
print words
regex Karok2 & [ʔu ?*];
print words