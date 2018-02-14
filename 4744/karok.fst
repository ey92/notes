# Karok

# Verb stems
def VStem [ [ SHOOT .x. {pasip} ] | [ STEAL .x. {si:tva} ] | [ STOOP .x. {kifnuk} ] | [ MEASURE .x. {suprih} ] | [ PICKUP .x. {ʔifik} ] | [ PLUCKAT .x. {ʔaktuv} ] | [ FILL .x. {axyar} ] | [ JUMP .x. {iškak} ] | [ LAUGH .x. {ikšah} ] | [ SHOOTATTARGET .x. {išriv} ] | [ POINT .x. {uksup} ]];

def V [ {a} | {i} | {u} ];
def C [ {f} | {h} | {k} | {n} | {p} | {r} | {s} | {š} | {t} | {v} | {x} | {y} | {ʔ} ];

# Morphology
def Infl [IMP : 0] | [FSTSG : ni] | [THRDSG : ʔu];

def Phrase VStem.u "+" Infl.u;

def M VStem | "+":0 | Infl;
def Morph M+;

def Word [Phrase .o. Morph].l;


# Phonology
# prepend ʔ
def glottalPrepend [..] -> {ʔ} || .#. _ V ;

# palatalize first s after i
def palatalize s -> š || i_, i ? _ ;

# depalatalize
def depalatalize š -> s;


def Phone glottalPrepend .o. depalatalize .o. palatalize;

def Karok Phrase .o. Morph .o. Phone;
def Karok2 Word .o. Phone;
