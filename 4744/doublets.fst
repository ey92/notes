# Elizabeth Yam ey92
# CS 4744 HW2

# PROBLEM 3 - Stress Doublets
load defined ANV.fsb
load defined cmu2.fsb

# PART 3A
def upper [a<->{A}, b<->B, c<->C, d<->D, e<->E, f<->F, g<->G, h<->H, i<->I, j<->J, k<->K, l<->L, m<->M, n<->{N}, o<->O, p<->P, q<->Q, r<->R, s<->S, t<->T, u<->U, v<->{V}, w<->W, x<->X, y<->Y, z<->Z];

def Consonants [ B | CH | D | DH | F | G | HH | JH | K | L | M | N | NG | P | R | S | SH | T | TH | V | W | Y | Z | ZH ];
def v0 [AA0 | AE0 | AH0 | AO0 | AW0 | AY0 | EH0 | ER0 | EY0 | IH0 | IY0 | OW0 | OY0 | UH0 | UW0];
def v1 [AA1 | AE1 | AH1 | AO1 | AW1 | AY1 | EH1 | ER1 | EY1 | IH1 | IY1 | OW1 | OY1 | UH1 | UW1];
def v2 [AA2 | AE2 | AH2 | AO2 | AW2 | AY2 | EH2 | ER2 | EY2 | IH2 | IY2 | OW2 | OY2 | UH2 | UW2];
def Vowels [v0 | v1 | v2];


# consider 01, 10, 12 stress patterns
def zeroOne Consonants* v0 Consonants* v1 Consonants*;
def oneZero Consonants* v1 Consonants* v0 Consonants*;
def oneTwo Consonants* v1 Consonants* v2 Consonants*;

def Syl Consonants* Vowels* Consonants*;
def twoSyl CMU .o. [Syl^Syl];

# disambiguate
def ambTwoSyl _ambpart(twoSyl);


def finalStress ambTwoSyl .o. zeroOne;
def initStress [ambTwoSyl .o. oneZero] | [ambTwoSyl .o. oneTwo];

# push through CMU dictionary and only get Noun/Verb doublets
def doublet [finalStress.u .o. initStress.u] .o. CMU;
def NVdoublets [N .o. upper].l & [V .o. upper].l .o. doublet;

# PART 3B
def missingDoublets [[THETA .x. {THEY1TAH0}|{THIY1TAH0}] ] | [ENTRANCE .x. {EH2NTRAH1NS}|{EH1NTRAH0NS}] | [CONSORT .x. {KAA1NSAO0RT}|{KAH0NSAO1RT}] | [DISCHARGE .x. {DIH1SCHAA2RJH}|{DIH0SCHAA1RJH}] | [TRANSPOSE .x. {TRAE1NSPOW2Z}|{TRAE0NSPOW1Z}] ];

def CMU CMU | missingDoublets;

# PART 3C
# Most doublets seem to be noun/verb pairs, where the meanings are related and the noun forms were likely derived from the verb forms, known as deverbal nouns, as opposed to gerundives. Similarly to how we use gerundives, English speakers probably began using verbs as nouns.  However, since English seems to have different stress rules for different categories of words, these deverbal nouns ended up being pronounced differently when used as nouns, leading to these stress doublets that we have found.  However, nouns can also turn into verbs, which was probably the case with the word "forecast".
