# PART A
def add [N /// {ity}] & A;
def adde [[N /// {ity}] e] & A;
def ous [[N /// {ity}] {ous}] & A;
def ious [[N /// {ity}] {ious}] & A;
def al [[N /// {ity}] {al}] & A;
def ist [[N /// {ity}] {ist}] & A;

def uous [[N /// {ity}] {uous}] & A;

# PART B
see 5b.fst file

# PART C
def upper [a<->{A}, b<->B, c<->C, d<->D, e<->E, f<->F, g<->G, h<->H, i<->I, j<->J, k<->K, l<->L, m<->M, n<->{N}, o<->O, p<->P, q<->Q, r<->R, s<->S, t<->T, u<->U, v<->{V}, w<->W, x<->X, y<->Y, z<->Z];

regex [add .o. upper].l & ~CMU.u;
regex [adde .o. upper].l & ~CMU.u;
regex [ous .o. upper].l & ~CMU.u;
regex [ious .o. upper].l & ~CMU.u;
regex [al .o. upper].l & ~CMU.u;
regex [ist .o. upper].l & ~CMU.u;

def missing [[EFFECTUAL .x. {IH2 F EH1 K CH AH0 W AH0 L}] | [TURBID .x. {T AH1 R B AH0 D}] | [TUMID .x. {T UW1 M AH0 D}] | [PROLIX .x. {P R OW1 L IH0 K S}] | [LIMPID .x. {L IH1 M P AH0 D}] | [JOCUND .x. {JH AA1 K AH0 N D}] | [INSIPID .x. {IH2 N S IH1 P AH0 D}] | [ILLIBERAL .x. {IH2 L IH1 B ER0 AH0 L}] | [FECUND .x. {F IY1 K AH0 N D}] | [VERBOSE .x. {V AH1 R B OW0 Z}] | [VIVACE .x. {V IH1 V AH2 CH AY0}] | [JOCOSE .x. {JH OW0 K OW1 S}] | [INDOCILE .x. {IH0 N D AA1 S AH0 L}] | [DEXTEROUS .x. {D EH1 K S T R AH0 S}] | [DISCONTINUOUS .x. {D IH0 S K AH0 N T IH1 N Y UW0 AH0 S}] | [CONGRUOUS .x. {K AA1 NG G R AH0 W AH0 S}] | [PERSPICUOUS .x. {P AH0 R S P IH1 K UW0 AH0 S}] | [OVER-CREDULOUS .x. {OW1 V ER0 K R EH1 JH AH0 L AH0 S}] | [VERACIOUS .x. {V AH0 R EY1 SH AH0 S}] | [SALUBRIOUS .x. {S AH0 L UW1 B R IY AH0 S}] | [SAGACIOUS .x. {S EY0 JH AH1 S IY AH S}] | [PERTINACIOUS .x. {P ER0 T IH0 N AH1 S IY AH0 S}] | [RATIONALIST .x. {R AE1 SH AH0 N AE0 L IH0 S T}] | [PLURALIST .x. {P L UH1 R AH0 L IH0 S T}] | [EFFECTUALITY .x. {IH2 F EH1 K CH AH0 W AH L AH0 T IY}] | [TURBIDITY .x. {T ER2 B IH1 D AH0 T IY0}] | [TUMIDITY .x. {T UW1 M AH0 D AH0 T IY0}] | [PROLIXITY .x. {P R OW1 L IH0 K S AH0 T IY0}] | [LIMPIDITY .x. {L IH1 M P AH0 D AH0 T IY0}] | [JOCUNDITY .x. {JH AA1 K AH0 N D AH0 T IY0}] | [INSIPIDITY .x. {IH1 N S IH0 P AH0 D AH0 T IY0}] | [ILLIBERALITY .x. {IH0 L IH1 B AH0 R AE0 L AH0 T IY}] | [FECUNDITY .x. {F AY0 K AH1 N D IH0 T IY0}] | [VERBOSITY .x. {V ER0 B AA1 S AH0 T IY0}] | [VIVACITY .x. {V IH0 V AE1 S AH0 T IY0}] | [JOCOSITY .x. {JH OW0 K AH1 S IH0 T IY0}] | [INDOCILITY .x. {IH0 N D AA1 S IH0 L AH0 T IY0}] | [DEXTERITY .x. {D EH0 K S T EH1 R AH0 T IY0}] | [DEXTERITY .x. {D EH0 K S T EH1 R IH0 T IY0}] | [DISCONTINUITY .x. {D IH0 S K AA2 N T IH0 N UW1 IH0 T IY0}] | [CONGRUOUS .x. {K AA1 NG G R UW0 AH0 S}] | [PERSPICUOUS .x. {P ER0 S P IH1 C UW0 W AH0 S}] | [OVER- CREDULITY .x. {OW1 V ER0 K R IH0 D UW1 L AH0 T IY0}] | [VERACITY .x. {V EH0 R AE1 S IH0 T IY0}] | [SALUBRITY .x. {S AH2 L AH1 B R AH0 T IY0}] | [SAGACITY .x. {S AA2 G AH1 S IH0 T IY0}] | [PERTINACITY .x. {P ER1 T IH0 N EY2 S AH0 T IY0}] | [RATIONALITY .x. {R AE2 SH AH0 N AE1 L IH0 T IY0}] | [PLURALITY .x. {P L ER2 AE1 L IH0 T IY0}]];