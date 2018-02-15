# Yagua

# Noun stems
def NStem [[ WATER .x. {haa} ] | [ SLOTH .x. {pahiitu} ] | [ PAN .x. {pay} ] | [ SKIN .x. {hay} ]];


def Poss [HIS : {ca}] | [MY : {ra}];
def Decl [DAT : {hu}];
def InflN Decl | Poss;

def PhraseN [Poss.u "+"]^{0,1} NStem.u [ "+" Decl.u]^{0,1};

def MN InflN | "+":0 | NStem;
def MorphN MN+;
def Noun [PhraseN .o. MorphN].l;


def flipa {ay} -> {e} || .#. r a [p | h] _;
def swap {yhu} -> {hyu} || _ .#.;
def inserty [..] -> y || r a [h | p] [{eh}*] _ [a | u];

def PhoneN flipa .o. swap .o. inserty;

def YaguaN PhraseN .o. MorphN .o. PhoneN;
def YaguaN2 [Noun .o. PhoneN].l;

#-----------------------------------------

# Verb stems
def VStem [[ FIT .x. {caa} ] | [ GIVE .x. {caay} ] | [ FRY .x. {ruye} ]];

def Subj [[HE : {ca}] | [I : {ra}]];
def DO [IT : {ra}];
def InflV Subj | DO;

def PhraseV Subj.u "+" VStem.u ["+" DO.u]^{0,1};

def MV InflV | "+":0 | VStem;
def MorphV MV+;
def Verb [PhraseV .o. MorphV].l;


def flipaa {aay} -> {ee} || .#. r a c _ ;
def swap2 {yra} -> {rya} || _ .#.;
def inserty2 [[..] -> y || .#. r a [c | r] _ [a | u]] .o. [{era} -> {erya} || _ .#.];

def PhoneV flipaa .o. swap2 .o. inserty2;

def YaguaV PhraseV .o. MorphV .o. PhoneN;
def YaguaV2 [Verb .o. PhoneV].l;
