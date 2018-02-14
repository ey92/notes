# Yagua

# Noun stems
def NStem [[ WATER .x. {haa} ] | [ SLOTH .x. {pahiitu} ] | [ PAN .x. {pay} ] | [ SKIN .x. {hay} ]];

# Morphology
def InflN [NOM : 0] | [DAT : hu] | [POSS3M : ca] | [POSS1 : ra];

def PhraseN NStem.u "+" InflN.u;

def MN NStem | "+":0 | InflN;
def MorphN MN+;

def Noun [PhraseN .o. MorphN].l;


# Phonology
# swap hyu to word
def swaphyu yhu -> hyu;

# palatalize after ra-prefix
def palatalizera rahaa -> rahyaa, rapah -> rapya, pay -> -> rahe || .#._;

def PhoneN swaphyu .o. palatalizera;


def YaguaN PhraseN .o. MorphN .o. PhoneN;
def YaguaN2 Noun .o. PhoneN;

#-----------------------------------------

# Verb stems
def VStem [[ FIT .x. {caa} ] | [ GIVE .x. {caay} ] | [ FRY .x. {ruye} ]];

# Morphology
def InflV [V3 : ca] | [V1 : ra] | [DO : ra]

def PhraseV VStem.u "+" InflV.u;

def MV VStem | "+":0 | InflV;
def MorphV MV+;

def Verb [PhraseV .o. MorphV].l;


# Phonology
# various palatalizations of root first consonant
def palatalizeaa aa -> yaa || a .#.;
def palatalizeay aay -> ee || aay .#.;
def palatalizeruye ruye -> ryuye || ruye .#.;
def palatalize palatalizeaa .o. palatalizeay .o. palatalizeruye;

# variations of adding direct object
def addy ee -> eey;
def swapyera yera -> yerya || _.#.;
def swapyra yra -> rya || _.#.;

def DO addy .o. swapyera .o. swapyra;


def PhoneV palatalize .o. DO;

def YaguaV PhraseV .o.MorphV .o. PhoneV;
def YaguaV2 Verb .o. PhoneV;
