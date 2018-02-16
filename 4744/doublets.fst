# Elizabeth Yam ey92
# CS 4744 HW2

# PROBLEM 3 - Stress Doublets

# PART 3B
def missingDoublets [[THETA .x. {THEY1TAH0}|{THIY1TAH0}] |] | [ENTRANCE .x. {EH2NTRAH1NS}|{EH1NTRAH0NS}] | [CONSORT .x. {KAA1NSAO0RT}|{KAH0NSAO1RT}] | [DISCHARGE .x. {DIH1SCHAA2RJH}|{DIH0SCHAA1RJH}] | [TRANSPOSE .x. {TRAE1NSPOW2Z}|{TRAE0NSPOW1Z}] ];

def CMU CMU | missingDoublets;

# PART 3C
# Most doublets seem to be noun/verb pairs, where the meanings are related and the noun forms were likely derived from the verb forms, known as deverbal nouns, as opposed to gerundives. Similarly to how we use gerundives, English speakers probably began using verbs as nouns.  However, since English seems to have different stress rules for different categories of words, these deverbal nouns ended up being pronounced differently when used as nouns, leading to these stress doublets that we have found.  However, nouns can also turn into verbs, which was probably the case with the word "forecast".


# PART 3A
define vowels ["AA0" | "AA1" | "AA2" | "AE0" | "AE1" | "AE2" | "AH0" | "AH1" | "AH2" | "AO0" | "AO1" | "AO2" | "AW0" | "AW1" | "AW2" | "AY0" | "AY1" | "AY2" | "EH0" | "EH1" | "EH2" | "ER0" | "ER1" | "ER2" | "EY0" | "EY1" | "EY2" | "IH0" | "IH1" | "IH2" | "IY0" | "IY1" | "IY2" | "OW0" | "OW1" | "OW2" | "OY0" | "OY1" | "OY2" | "UH0" | "UH1" | "UH2" | "UW0" | "UW1" | "UW2"];
def twoSyl CMU.l & [$.vowels^[$.vowels]];


def upper [a<->{A}, b<->B, c<->C, d<->D, e<->E, f<->F, g<->G, h<->H, i<->I, j<->J, k<->K, l<->L, m<->M, n<->{N}, o<->O, p<->P, q<->Q, r<->R, s<->S, t<->T, u<->U, v<->{V}, w<->W, x<->X, y<->Y, z<->Z];



def letters ["A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z"];

def consonants ["B" | "C" | "D" | "F" | "G" | "H" | "J" | "K" | "L" | "M" | "N" | "P" | "Q" | "R" | "S" | "T" | "V" | "W" | "X" | "Y" | "Z"];

---
