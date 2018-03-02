#regex [uAdj .o. CMU .o. [?*AH0[\Vowel]*]].u;

define Consonant [
B | CH | D | DH | F | G | HH | JH |
K | L | M | N | NG | P | R | S | SH |
T | TH | V | W | Y | Z | ZH
];

define Vowel [
AA0 | AA1 | AA2 |
AE0 | AE1 | AE2 |
AH0 | AH1 | AH2 |
AO0 | AO1 | AO2 |
AW0 | AW1 | AW2 |
AY0 | AY1 | AY2 |
EH0 | EH1 | EH2 |
ER0 | ER1 | ER2 |
EY0 | EY1 | EY2 |
IH0 | IH1 | IH2 |
IY0 | IY1 | IY2 |
OW0 | OW1 | OW2 |
OY0 | OY1 | OY2 |
UH0 | UH1 | UH2 |
UW0 | UW1 | UW2
];

define Syllable [\Vowel]*[Vowel][\Vowel]*;

define Underlying [
                  # -IOUS
                  [CAPACIOUS .x. K AH0 P EY1 SH AH0 S] |
                  [COMMODIOUS .x. K AH0 M OW1 D IY0 AH0 S] |

                  # -UOUS
                  [CONTINUOUS .x. K AH0 N T IH1 N Y UW0 AH0 S] |
                  [AMBIGUOUS .x. AE0 M B IH1 G Y UW0 AH0 S] |
                  [PROMISCUOUS .x. P R OW1 M IH1 S K W AH0 S] |

                  # -OUS
                  [CREDULOUS .x. K R EH1 JH AH0 L AH0 S] |
                  [BARBAROUS .x. B AA1 R B ER0 AH0 S] |
                  [ANONYMOUS .x. AH0 N AA1 N AH0 M AH0 S] |

                  [AUDACITY .x. AA0 D AE1 S AH0 T IY0] |
                  [ACID .x. AE1 S AH0 D] |
                  [HUMAN .x. HH Y UW1 M AH0 N] |
                  [TRANQUIL .x. T R AE1 NG K W AH0 L]
];

define Pos [NOUN | ADJ];
define PHRASE Underlying.u "+" Pos;
define M Underlying | "+":0 | Pos;
define MOR M+;

define ITY [AH0 T IY0 | IH0 T IY0];

define verifyNoun NOUN -> 0 || ITY _ ;
define verifyAdj ADJ -> 0 || [?^3 - ITY] _ ;

define iousEnding SH AH0 S | IY0 AH0 S;
define iousFlags AO0 -> AO0ious, EY1 -> EY1ious, OW1 -> OW1ious || _ ?* iousEnding NOUN;
define removeiousEnding [SH AH0 S NOUN] -> S NOUNM,
                        [IY0 AH0 S NOUN] -> NOUNM;
define applyious iousFlags .o. removeiousEnding;

define uousEnding [UW0 AH0 S | W AH0 S];
define uousFlags AA0 -> AA0uous, AE0 -> AE0uous, AH0 -> AH0uous,
                 IH1 -> IH1uous, OW1 -> OW1uous || _ ?* uousEnding NOUN;
define removeuousEnding [UW0 AH0 S NOUN] -> UW1 NOUNM,
                        [W AH0 S NOUN] -> Y UW1 NOUNM;
define applyuous uousFlags .o. removeuousEnding;

define ousEnding [AH0 S | IH0 S];
define ousFlags AH0 -> AH0ous, ER0 -> ER0ous, IH0 -> IH0ous,
                UW0 -> UW0ous, AA1 -> AA1ous, AE1 -> AE1ous,
                EH1 -> EH1ous, IH1 -> IH1ous || _ ?* ousEnding NOUN;
define removeousEnding [uousEnding NOUN] -> NOUNM;
define applyous ousFlags .o. removeousEnding;

define PreProcess verifyNoun .o. verifyAdj .o. applyious .o. applyuous .o.
                  applyous;


#### IOUS RULES
define conditionalIous AO0ious -> ER0 || .#. ?+ _;
define unconditionalIous AO0ious -> AO0 ,
                         EY1ious -> AE1 ,
                         OW1ious -> AA1;
define iousChange conditionalIous .o. unconditionalIous;

#### UOUS RULES
define conditionaluous IH1uous -> AH0 || T _ N;
define unconditionaluous AA0uous -> AA2,
                         AE0uous -> AE2,
                         AH0uous -> AA2,
                         IH1uous -> IH0,
                         OW1uous -> OW2;
define uousChange conditionaluous .o. unconditionaluous;

#### OUS RULES
define conditionalous AA1ous -> AA0 || R _ S, B _ R,,
                      AH0ous -> IH1 || N _ M,,
                      AH0ous -> AE2 || .#. _ ,,
                      [JH AH0ous] -> [D UW1];

define unconditionalous AH0ous -> AA1,
                        ER0ous -> [EH1 R],
                        IH0ous -> IY1,
                        UW0ous -> UW2,
                        AA1ous -> AH0,
                        AE1ous -> AH0,
                        EH1ous -> IH0,
                        IH1ous -> AH0;
define ousChange conditionalous .o. unconditionalous;



# IGNORE
define StressChangeFinalConditional AH0 -> EH1 ||  _ M NOUN ,,
            AH0 -> AE1 || _ N NOUN;

define StressChangeFinalUnconditional AH0 -> IH1 || _ Consonant* NOUN;

define StressChangeInitial AE1 -> AH0 || .#. Consonant* _ ?* NOUN;

define StressChange StressChangeFinalConditional .o. StressChangeFinalUnconditional
            .o. StressChangeInitial;

define PHON iousChange .o. uousChange .o. ousChange;

define removeNounIfEnding NOUNM -> 0 || ITY _ ;
define AddEnding1 [..] -> IH0 T IY0 || [IH1] [\Vowel]* _ NOUNM;
define AddEnding2 [..] -> AH0 T IY0 || _ NOUNM;
define AddEnding [AddEnding1 .o. removeNounIfEnding .o. AddEnding2 .o. removeNounIfEnding];


#e changes ending
#AA0
#AE0
#AH0 -> IH1 Civil, Acid, Solid, Rapid, Rigid, Liquid, Humid, Versatile, Fluid
#AH0 -> EH1 Solemnity
#AH0 -> AE1 Human, Illegal, municipal
#AO0
#AW0
#AY0
#EH0
#ER0
#EY0
#IH0
#IY0
#OW0
#OY0
#UH0
#UW0

#AA1 -> AA1
#AE1
#AH1
#AO1
#AW1
#AY1
#EH1
#ER1
#EY1
#IH1
#IY1
#OW1
#OY1
#UH1
#UW1

#AA2
#AE2
#AH2
#AO2
#AW2
#AY2
#EH2
#ER2
#EY2
#IH2
#IY2
#OW2
#OY2
#UH2
#UW2

#e changes beginning
#AA0
#AE0
#AH0
#AO0
#AW0
#AY0
#EH0
#ER0
#EY0
#IH0
#IY0
#OW0
#OY0
#UH0
#UW0

#AA1 -> AH0 Solid, Solemn
#AA1 -> AA0 Docile
#AE1 -> AH0 ACID, VALID, RAPID, AGILE
#AE1 -> AE0 Tranquil
#AH1
#AO1
#AW1
#AY1
#EH1
#ER1
#EY1
#IH1 -> AH0 Civil
#IH1 -> IH0 Rigid Liquid
#IH1 -> ER0 Virile
#IY1
#OW1
#OY1
#UH1
#UW1 -> UW0

#AA2
#AE2
#AH2
#AO2
#AW2
#AY2
#EH2
#ER2
#EY2
#IH2
#IY2
#OW2
#OY2
#UH2
#UW2

define Ity PHRASE .o. MOR .o. PreProcess .o. PHON .o. AddEnding;
define Ity2 PHRASE .o. MOR .o. PreProcess .o. PHON;
