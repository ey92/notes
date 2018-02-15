# Yagua

# Noun stems
def NStem [[ WATER .x. {haa} ] | [ SLOTH .x. {pahiitu} ] | [ PAN .x. {pay} ] | [ SKIN .x. {hay} ]];

# Morphology
def Poss [HIS : ca] | [MY : ra];
def Decl [DAT : hu];
def InflN Decl | Poss;

def PhraseN [Poss.u "+"]^{0,1} NStem.u [ "+" Decl.u]^{0,1};

def MN InflN | "+":0 | NStem;
def MorphN MN+;

def Noun [PhraseN .o. MorphN].l;


# Phonology
# swap hyu to word
def swap [yhu -> hyu || _ .#. .o. yra -> rya || _ .#.];

# palatalize after ra-prefix
def flipae a -> e || .#. r a [p | h] _ y;
def inserty [..] -> y || r a ? _ a; 
def deletey y -> 0 || e _ .#.;

def PhoneN flipae .o. swap .o. inserty .o. deletey;

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
