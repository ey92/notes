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

