# Elizabeth Yam ey92
# CS 4744 HW2

# Problem 2 - Yagua

# Noun stems
def NStem [[ WATER .x. {haa} ] | [ SLOTH .x. {pahiitu} ] | [ PAN .x. {pay} ] | [ SKIN .x. {hay} ]];

# Noun Morphology
def Poss [HIS : {ca}] | [MY : {ra}];
def Decl [DAT : {hu}];
def InflN Decl | Poss;

def PhraseN [Poss.u "+"]^{0,1} NStem.u [ "+" Decl.u]^{0,1};

def MN InflN | "+":0 | NStem;
def MorphN MN+;
def Noun [PhraseN .o. MorphN].l;

# Noun Phonology
def flipa {ay} -> {e} || .#. r a [p | h] _;
def swap {yhu} -> {hyu} || _ .#.;
def inserty [..] -> y || r a [h | p] [{eh}*] _ [a | u];

def PhoneN flipa .o. swap .o. inserty;

# Define lexicon based on Phones, Morphology, and Phrase
def YaguaN PhraseN .o. MorphN .o. PhoneN;

# Define relation mapping underlying to surface phonological forms
def YaguaN2 [Noun .o. PhoneN];

#-----------------------------------------

# Verb stems
def VStem [[ FIT .x. {caa} ] | [ GIVE .x. {caay} ] | [ FRY .x. {ruye} ]];

# Morphology
def Subj [[HE : {ca}] | [I : {ra}]];
def DO [IT : {ra}];
def InflV Subj | DO;

def PhraseV Subj.u "+" VStem.u ["+" DO.u]^{0,1};

def MV InflV | "+":0 | VStem;
def MorphV MV+;
def Verb [PhraseV .o. MorphV].l;

# Phonology
def flipaa {aay} -> {ee} || .#. r a c _ ;
def swap2 {yra} -> {rya} || _ .#.;
def inserty2 [[..] -> y || .#. r a [c | r] _ [a | u]] .o. [{era} -> {erya} || _ .#.];

def PhoneV flipaa .o. swap2 .o. inserty2;

# Define lexicon based on Phones, Morphology, and Phrase
def YaguaV PhraseV .o. MorphV .o. PhoneN;

# Define relation mapping underlying to surface phonological forms
def YaguaV2 [Verb .o. PhoneV];
