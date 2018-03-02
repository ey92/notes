# Elizabeth Yam ey92
# CS 4744 HW2

# PROBLEM 4 - Doublets Phonology
load defined ANV.fsb
load defined cmu2.fsb

def upper [a<->{A}, b<->B, c<->C, d<->D, e<->E, f<->F, g<->G, h<->H, i<->I, j<->J, k<->K, l<->L, m<->M, n<->{N}, o<->O, p<->P, q<->Q, r<->R, s<->S, t<->T, u<->U, v<->{V}, w<->W, x<->X, y<->Y, z<->Z];

def Consonants [ B | CH | D | DH | F | G | HH | JH | K | L | M | N | NG | P | R | S | SH | T | TH | V | W | Y | Z | ZH ];

def v0 [AA0 | AE0 | AH0 | AO0 | AW0 | AY0 | EH0 | ER0 | EY0 | IH0 | IY0 | OW0 | OY0 | UH0 | UW0];
def v1 [AA1 | AE1 | AH1 | AO1 | AW1 | AY1 | EH1 | ER1 | EY1 | IH1 | IY1 | OW1 | OY1 | UH1 | UW1];
def v2 [AA2 | AE2 | AH2 | AO2 | AW2 | AY2 | EH2 | ER2 | EY2 | IH2 | IY2 | OW2 | OY2 | UH2 | UW2];
def Vowels [v0 | v1 | v2];

def markInit [ AA0->AA0IN , AA1->AA1IN , AA2->AA2IN , AE0->AE0IN , AE1->AE1IN , AE2->AE2IN , AH0->AH0IN , AH1->AH1IN , AH2->AH2IN , AO0->AO0IN , AO1->AO1IN , AO2->AO2IN , AW0->AW0IN , AW1->AW1IN , AW2->AW2IN , AY0->AY0IN , AY1->AY1IN , AY2->AY2IN , EH0->EH0IN , EH1->EH1IN , EH2->EH2IN , ER0->ER0IN , ER1->ER1IN , ER2->ER2IN , EY0->EY0IN , EY1->EY1IN , EY2->EY2IN , IH0->IH0IN , IH1->IH1IN , IH2->IH2IN , IY0->IY0IN , IY1->IY1IN , IY2->IY2IN , OW0->OW0IN , OW1->OW1IN , OW2->OW2IN , OY0->OY0IN , OY1->OY1IN , OY2->OY2IN , UH0->UH0IN , UH1->UH1IN , UH2->UH2IN , UW0->UW0IN , UW1->UW1IN , UW2->UW2IN];

def initVowels [Vowels .o. markInit].l;

def toZero1 [AA1IN -> AA0 , AE1IN -> AE0 , AH1IN -> AH0 , AO1IN -> AO0 , AW1IN -> AW0 , AY1IN -> AY0 , EH1IN -> EH0 , ER1IN -> ER0 , EY1IN -> EY0 , IH1IN -> IH0 , IY1IN -> IY0 , OW1IN -> OW0 , OY1IN -> OY0 , UH1IN -> UH0 , UW1IN -> UW0 ];

def toOne0 [AA0IN -> AA1 , AE0IN -> AE1 , AH0IN -> AH1 , AO0IN -> AO1 , AW0IN -> AW1 , AY0IN -> AY1 , EH0IN -> EH1 , ER0IN -> ER1 , EY0IN -> EY1 , IH0IN -> IH1 , IY0IN -> IY1 , OW0IN -> OW1 , OY0IN -> OY1 , UH0IN -> UH1 , UW0IN -> UW1];
def toOne2 [AA2IN -> AA1 , AE2IN -> AE1 , AH2IN -> AH1 , AO2IN -> AO1 , AW2IN -> AW1 , AY2IN -> AY1 , EH2IN -> EH1 , ER2IN -> ER1 , EY2IN -> EY1 , IH2IN -> IH1 , IY2IN -> IY1 , OW2IN -> OW1 , OY2IN -> OY1 , UH2IN -> UH1 , UW2IN -> UW1 ];

def toTwo1 [AA1IN -> AA2 , AE1IN -> AE2 , AH1IN -> AH2 , AO1IN -> AO2 , AW1IN -> AW2 , AY1IN -> AY2 , EH1IN -> EH2 , ER1IN -> ER2 , EY1IN -> EY2 , IH1IN -> IH2 , IY1IN -> IY2 , OW1IN -> OW2 , OY1IN -> OY2 , UH1IN -> UH2 , UW1IN -> UW2];


def Generated [ [EXTRACT .x. {IH0KSTRAE1KT}] | [IMPACT .x. {IH0MPAE1KT}] | [IMPRESS .x. {IH0MPREH1S}] | [IMPORT .x. {IH0MPAO1RT}] | [EFFECT .x. {IH0FEH1KT}] | [EFFECT .x. {IY1FEH0KT}] | [ADDRESS .x. {AH0DREH1S}] | [ADDICT .x. {AH0DIH1KT}] | [OBJECT .x. {AH0BJHEH1KT}] | [UPSET .x. {AH0PSEH1T}] | [EFFECT .x. {AH0FEH1KT}] | [AFFIX .x. {AH0FIH1KS}] | [ALLY .x. {AH0LAY1}] | [EXTRACT .x. {EH1KSTRAE2KT}] | [EXCISE .x. {EH1KSAY0Z}] | [ESCORT .x. {EH1SKAO0RT}] | [ESSAY .x. {EH1SEY2}] | [EXCISE .x. {EH0KSAY1S}] | [ESCORT .x. {EH0SKAO1RT}] | [ESSAY .x. {EH0SEY1}] | [DECREASE .x. {DIH0KRIY1S}] | [DICTATE .x. {DIH0KTEY1T}] | [DISCHARGE .x. {DIH0SCHAA1RJH}] | [DEFECT .x. {DIH0FEH1KT}] | [DETAIL .x. {DIH0TEY1L}] | [DETOUR .x. {DIH0TUH1R}] | [DESERT .x. {DIH0ZER1T}] | [DECREASE .x. {DIY1KRIY2S}] | [DEFECT .x. {DIY1FEH0KT}] | [DETAIL .x. {DIY1TEY0L}] | [DETOUR .x. {DIY1TUH0R}] | [DESERT .x. {DEH1ZER0T}] | [DICTATE .x. {DIH1KTEY2T}] | [DISCHARGE .x. {DIH1SCHAA2RJH}] | [DIGEST .x. {DAY1JHEH0ST}] | [DIGEST .x. {DAY0JHEH1ST}] | [DEBUT .x. {DEY1BYUW0}] | [DEBUT .x. {DEY0BYUW1}] | [COMBAT .x. {KAH0MBAE1T}] | [COMPACT .x. {KAH0MPAE1KT}] | [COMPRESS .x. {KAH0MPREH1S}] | [COMBAT .x. {KAA1MBAE0T}] | [COMPACT .x. {KAA1MPAE0KT}] | [COMPRESS .x. {KAA1MPREH0S}] | [CHAUFFEUR .x. {SHOW1FER0}] | [CHAUFFEUR .x. {SHOW0FER1}] | [BUFFET .x. {BAH0FEY1}] | [BUFFET .x. {BAH1FAH0T}] | [ADDRESS .x. {AE1DREH2S}] | [ADDICT .x. {AE1DIH2KT}] | [ABSTRACT .x. {AE1BSTRAE2KT}] | [AFFIX .x. {AE1FIH0KS}] | [ALLY .x. {AE1LAY0}] | [ABSTRACT .x. {AE0BSTRAE1KT}] | [UPSET .x. {AH1PSEH2T}] | [SUBJECT .x. {SAH0BJHEH1KT}] | [SUSPECT .x. {SAH0SPEH1KT}] | [SUBJECT .x. {SAH1BJHIH0KT}] | [SUSPECT .x. {SAH1SPEH2KT}] | [SURCHARGE .x. {SER1CHAA2RJH}] | [SURCHARGE .x. {SER0CHAA1RJH}] | [REDRESS .x. {RIH0DREH1S}] | [RECAP .x. {RIH0KAE1P}] | [RECORD .x. {RIH0KAO1RD}] | [RECALL .x. {RIH0KAO1L}] | [REBEL .x. {RIH0BEH1L}] | [RECESS .x. {RIH0SEH1S}] | [REFUSE .x. {RIH0FYUW1Z}] | [REJECT .x. {RIH0JHEH1KT}] | [REDRESS .x. {RIY1DREH0S}] | [RECAP .x. {RIY1KAE2P}] | [RECALL .x. {RIY1KAO2L}] | [RECESS .x. {RIY1SEH0S}] | [RESEARCH .x. {RIY1SER0CH}] | [REWRITE .x. {RIY1RAY2T}] | [REFILL .x. {RIY1FIH0L}] | [REJECT .x. {RIY1JHEH0KT}] | [RECORD .x. {RAH0KAO1RD}] | [REFUSE .x. {RAH0FYUW1Z}] | [RECORD .x. {REH1KER0D}] | [REBEL .x. {REH1BAH0L}] | [REFUSE .x. {REH1FYUW2Z}] | [RESEARCH .x. {RIY0SER1CH}] | [REWRITE .x. {RIY0RAY1T}] | [REFILL .x. {RIY0FIH1L}] | [PRODUCE .x. {PRAH0DUW1S}] | [PROJECT .x. {PRAH0JHEH1KT}] | [PROTEST .x. {PRAH0TEH1ST}] | [PROGRESS .x. {PRAH0GREH1S}] | [PROJECT .x. {PRAA1JHEH0KT}] | [PROGRESS .x. {PRAA1GREH2S}] | [PRODUCE .x. {PROW1DUW0S}] | [PROTEST .x. {PROW1TEH2ST}] | [PROGRESS .x. {PROW0GREH1S}] | [PURPORT .x. {PER1PAO2RT}] | [PERMIT .x. {PER1MIH2T}] | [PERFECT .x. {PER1FIH2KT}] | [PURPORT .x. {PER0PAO1RT}] | [PERMIT .x. {PER0MIH1T}] | [PERFECT .x. {PER0FEH1KT}] | [FOREARM .x. {FAO1RAA2RM}] | [FOREARM .x. {FAO0RAA1RM}] | [OFFSET .x. {AO1FSEH2T}] | [OFFSET .x. {AO0FSEH1T}] | [MISMATCH .x. {MIH1SMAH2TCH}] | [MISMATCH .x. {MIH2SMAH1TCH}] ];

def Noun [NOUN:]
def PoS [Noun | Verb];

def Phrase Generated.u "+" PoS;

def M Generated | "+":0 | PoS;
def Mor M+;

def Syl Consonants* Vowels* Consonants*;

def zero Consonants* v0 Consonants*;
def one Consonants* v1 Consonants*;
def two Consonants* v2 Consonants*;

# consider 01, 10, 12 stress patterns
def zeroOne Consonants* v0 Consonants* v1 Consonants*;
def oneZero Consonants* v1 Consonants* v0 Consonants*;
def oneTwo Consonants* v1 Consonants* v2 Consonants*;


# rules
def markers [[..] -> "01" || zeroOne _ .#.] .o. [[..] -> "10" || oneZero _ .#.] .o. [[..] -> "12" || oneTwo _ .#.];

def convert01to10 [toOne0 || Consonants* _ Consonants* initVowels Consonants* "01"] .o. [toZero1 || Consonants* Vowels Consonants* _ Consonants* "01"];
def convert10to01 [toZero1 || Consonants* _ Consonants* initVowels Consonants* "10"] .o. [toOne0 || Consonants* Vowels Consonants* _ Consonants* "10"];
def convert12to01 [toZero1 || Consonants* _ Consonants* initVowels Consonants* "12"] .o. [toOne2 || Consonants* Vowels Consonants* _ Consonants* "12"];

def remMarkers ["01" -> 0 || _ .#.] | ["10" -> 0 || _ .#.] || ["12" -> 0 || _.#.];


def remPoS ["+" Noun | "+" Verb] -> 0;

def Phone markInit .o. markers .o. convert01to10 .o. convert10to01 .o. convert12to01 .o. remMarkers .o. remPoS;
def stressDoublets Phrase .o. Mor .o. Phone;
