#regex [P3NounsAndVerbs .o. [Syllable AA1 [\Vowel]*]].u;

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

define Consonant [
B | CH | D | DH | F | G | HH | JH |
K | L | M | N | NG | P | R | S | SH |
T | TH | V | W | Y | Z | ZH
];

define Underlying [
                  [IMPORT .x. IH1 M P AO0 R T] |
                  [FINANCE .x. F AY1 N AE2 N S] |
                  [ANNEX .x. AE1 N EH2 K S] |
                  [ESSAY .x. EH1 S EY2] |
                  [EXTRACT .x. EH1 K S T R AE2 K T] |
                  [CONDUCT .x. K AA1 N D AH0 K T] |
                  [REBEL .x. R EH1 B AH0 L] |

                  #AA1 IS -> AH0;
                  [CONCERT .x. K AA1 N S ER0 T] |

                  #AE1 IS -> AH0;
                  [ACCENT .x. AE1 K S EH2 N T] |
                  [ADDICT .x. AE1 D IH2 K T] |

                  #AE1 IS -> AE0;
                  [ABSTRACT .x. AE1 B S T R AE2 K T] |

                  #AH1 IS -> AH0;
                  [SUBJECT .x. S AH1 B JH IH0 K T] |
                  [SUSPECT .x. S AH1 S P EH2 K T] |

                  #AO1 IS -> AO0;
                  [TORMENT .x. T AO1 R M EH2 N T] |

                  #AY1 IS -> AY0; #AY0 FS -> AY1
                  [DIGEST .X. D AY1 JH EH0 S T] |

                  #AY1 IS -> AH0 | IH0;
                  [FINANCE .X. F AY1 N AE2 N S] |

                  #EH1 IS -> EH0
                  [ESSAY .x. EH1 S EY2] |

                  #EH1 IS -> IH0
                  [EXTRACT .x. EH1 K S T R AE2 K T] |

                  #EH1 IS -> AH0, IH0
                  [REFUSE .x. R EH1 F Y UW2 Z] |

                  #ER1 IS -> ER0
                  [SURVEY .x. S ER1 V EY2] |
                  [PERFECT .x. P ER1 F IH2 K T] |

                  #EY1 IS -> EY0
                  [DEBUT .x. D EY1 B Y UW0] |

                  #IH1 IS -> IH0
                  [DISCOUNT .x. D IH1 S K AW0 N T] |
                  [IMPACT .x. IH1 M P AE0 K T] |

                  #IY1 IS -> IH0, AH0
                  [EFFECT .x. IY1 F EH1 K T] |

                  #IY1 IS -> IH0
                  [DECREASE .x. D IY1 K R IY2 S] |

                  #IY1 IS -> IY0
                  [REFILL .x. R IY1 F IH0 L] |

                  #OW1 IS -> OW0
                  [ROMANCE .x. R OW1 M AE0 N S] |

                  #OW1 IS -> AH0
                  [PROTEST .x. P R OW1 T EH2 S T] |

                  #AH0 IS -> AH1
                  [CONSTRUCT .x. K AA1 N S T R AH0 K T] |

                  #AH0 IS -> EY1
                  [BUFFET .x. B AH1 F AH0 T] |

                  #AH0 IS -> EY1
                  [REBEL .x. R EH1 B AH0 L] |

                  #AO0 IS -> AO1
                  [TRANSPORT .x. T R AE1 N S P AO0 R T] |
                  [IMPORT .x. IH1 M P AO0 R T] |

                  #AW0 IS -> AW1
                  [DISCOUNT .x. D IH1 S K AW0 N T] |

                  #AY0 IS -> AY1
                  [ALLY .x. AE1 L AY0] |
                  [INCLINE .x. IH1 N K L AY0 N] |

                  #EH0 IS -> EH1
                  [DEFECT .x. D IY1 F EH0 K T] |
                  [CONTEST .x. K AA1 N T EH0 S T] |
                  [CONTENT .x. K AA1 N T EH0 N T] |

                  #ER0 IS -> A01
                  [RECORD .x. R EH1 K ER0 D] |

                  #ER0 IS -> ER1
                  [CONVERT .x. K AA1 N V ER0 T] |
                  [CONVERSE .x. K AA1 N V ER0 S] |

                  #EY0 IS -> EY1
                  [DETAIL .x. D IY1 T EY0 L] |

                  #IH0 IS -> IH1
                  [CONFLICT .x. K AA1 N F L IH0 K T] |
                  [IMPRINT .x. IH1 M P R IH0 N T] |

                  #IY0 IS -> IY1
                  [INTRIGUE .x. IH1 N T R IY0 G] |

                  #OW0 IS -> OW1
                  [CONSOLE .x. K AA1 N S OW0 L] |

                  #UH0 IS -> UH1
                  [DETOUR .x. D IY1 Y UH0 R] |

                  #UW0 IS -> UW1
                  [COMMUNE .x. K AA1 M Y U UW0 N] |
                  [PRODUCE .x. P R OW1 D UW0 S] |

                  #AE2 IS -> AE1
                  [CONTRACT .x. K AA1 N T R AE2 K T] |

                  #AH2 IS -> AH1
                  [INSULT .x. IH1 N S AH2 L T] |

                  #EH2 IS -> EH1
                  [UPSET .x. AH1 P S EH2 T] |

                  #ER2 IS -> ER1
                  [INSERT .x. IH1 N S ER2 T] |

                  #IH2 IS -> IH1
                  [CONSCRIPT .x. K AA1 N S K R IH2 P T] |

                  #AE0 FS -> AE1
                  [TRANSFER .x. T R AE0 N S F ER1] |

                  #AH0 FS -> AA1
                  [CONVICT .x. K AH0 N V IH1 K T] |

                  #AH0 FS -> AE1
                  [ANNEX .x. AH0 N EH1 K S] |

                  #AO0 FS -> AO1
                  [OFFSET .x. AO0 F S EH1 T] |

                  #AY0 FS -> IH1
                  [DIGEST .x. D AY0 JH EH1 S T] |

                  #EH0 FS -> EH1
                  [EXCISE .x. EH0 K S AY1 Z] |

                  #ER0 FS -> ER1
                  [PURPORT .x. P ER0 P AO1 R T] |

                  #IH0 FS -> IY1
                  [REJECT .x. R IH0 JH EH1 K T] |

                  #IH0 FS -> IH1
                  [INCENSE .x. IH0 N S EH1 N S] |

                  #OW0 FS -> AA1
                  [PROGRESS .x. P R AA1 G R EH2 S] |

                  #AE1 FS -> AE2
                  [RECAP .x. R IH0 K AE1 P] |

                  #AE1 FS -> AE0
                  [COMBAT .x. K AH0 M B AE1 T] |
                  [COMPACT .x. K AH0 M P AE1 K T] |

                  #AH1 FS -> AH0
                  [CONDUCT .x. K AH0 N D AH1 K T] |

                  #AH1 FS -> AH2
                  [REFUND .x. R IH0 F AH1 N D] |

                  #AO1 FS -> AO0
                  [ESCORT .x. EH0 S K AO1 R T] |

                  #AO1 FS -> AO2
                  [RECALL .x. R IH0 K AO1 L] |

                  #AW1 FS -> AW0
                  [COMPOUND .x. K AH0 M P AW1 N D] |

                  #AY1 FS -> AY2
                  [REWRITE .x. R IY0 R AY1 T] |

                  #AY1 FS -> AY0
                  [COMBINE .x. K AH0 M B AY1 N] |

                  #EH1 FS -> EH2
                  [ADDRESS .x. AH0 D R EH1 S] |

                  #EH1 FS -> EH0
                  [RECESS .x. R IH0 S EH1 S] |

                  #ER1 FS -> ER0
                  [TRAVERSE .x. T R AE1 V ER0 S] |

                  #EY1 FS -> EY2
                  [DICTATE .x. D IH0 K T EY1 T] |

                  #EY1 FS -> EY0
                  [DETAIL .x. D IH0 T EY1 L] |

                  #IH1 FS -> IH2
                  [PERMIT .x. P ER0 M IH1 T] |

                  #IH1 FS -> IH0
                  [AFFIX .x. AH0 F IH1 K S] |

                  #IY1 FS -> IY2
                  [INCREASE .x. IH0 N K R IY1 S] |

                  #IY1 FS -> IY0
                  [CONCRETE .x. K AH0 N K R IY1 T] |

                  #Missing stress doublets
                  [TRANSPLANT .x. T R AE0 N S P L AE1 N T] |
                  [MANDATE .x. M AE1 N D EY2 T] |
                  [CONSORT .x. K AH0 N S AO1 R T] |
                  [DISCARD .x. D IH0 S K AA1 R D] |
                  [FRAGMENT .x. F R AE1 G M AH0 N T]
                  ];

# ***** Define the parts of speech
define Pos [VERB | NOUN];

# ***** Define underlying phrases (inflected words)
define PHRASE Underlying.u "+" Pos;

# ***** Define the morphology MOR, mapping a sequence of morphemes to an
# ***** underlying phone spelling
define M Underlying | "+":"+" | Pos;
define MOR M+;

define Syllable [\Vowel]*[Vowel][\Vowel]*;

define Flags AA0 -> AA0IS, AE0 -> AE0IS, AH0 -> AH0IS, AO0 -> AO0IS,
             AW0 -> AW0IS, AY0 -> AY0IS, EH0 -> EH0IS, ER0 -> ER0IS,
             EY0 -> EY0IS, IH0 -> IH0IS, IY0 -> IY0IS, OW0 -> OW0IS,
             OY0 -> OY0IS, UH0 -> UH0IS, UW0 -> UW0IS || Syllable_[\Vowel] + VERB ,,

             AA1 -> AA1IS, AE1 -> AE1IS, AH1 -> AH1IS, AO1 -> AO1IS,
             AW1 -> AW1IS, AY1 -> AY1IS, EH1 -> EH1IS, ER1 -> ER1IS,
             EY1 -> EY1IS, IH1 -> IH1IS, IY1 -> IY1IS, OW1 -> OW1IS,
             OY1 -> OY1IS, UH1 -> UH1IS, UW1 -> UW1IS || [\Vowel]*_Syllable + VERB ,,

             AA2 -> AA2IS, AE2 -> AE2IS, AH2 -> AH2IS, AO2 -> AO2IS,
             AW2 -> AW2IS, AY2 -> AY2IS, EH2 -> EH2IS, ER2 -> ER2IS,
             EY2 -> EY2IS, IH2 -> IH2IS, IY2 -> IY2IS, OW2 -> OW2IS,
             OY2 -> OY2IS, UH2 -> UH2IS, UW2 -> UW2IS || Syllable_[\Vowel] + VERB ,,

             AA0 -> AA0FS, AE0 -> AE0FS, AH0 -> AH0FS, AO0 -> AO0FS,
             AW0 -> AW0FS, AY0 -> AY0FS, EH0 -> EH0FS, ER0 -> ER0FS,
             EY0 -> EY0FS, IH0 -> IH0FS, IY0 -> IY0FS, OW0 -> OW0FS,
             OY0 -> OY0FS, UH0 -> UH0FS, UW0 -> UW0FS || [\Vowel]*_Syllable + NOUN ,,

             AA1 -> AA1FS, AE1 -> AE1FS, AH1 -> AH1FS, AO1 -> AO1FS,
             AW1 -> AW1FS, AY1 -> AY1FS, EH1 -> EH1FS, ER1 -> ER1FS,
             EY1 -> EY1FS, IH1 -> IH1FS, IY1 -> IY1FS, OW1 -> OW1FS,
             OY1 -> OY1FS, UH1 -> UH1FS, UW1 -> UW1FS || Syllable_[\Vowel] + NOUN;

define Conditional   AE1IS -> AH0 || .#. _ [? - "B"]?* ,,
                     AY1IS -> AY0 || D _ G ?* ,,
                     EH1IS -> AH0 || R _ [F | K] ,,
                     EH1IS -> IH0 || R _ [B | K | F], .#. _ K S T ,,
                     OW1IS -> OW0 || R _ M ,,

                     AH0IS -> AH1 || ?* _ K T ,,
                     AH0IS -> EY1 || B _ F ,,
                     ER0IS -> AO1 || K _ R D ,,

                     AH0FS -> AA1 || K _ [N | M], P R _ ,,
                     AH0FS -> AE1 || .#. [T R] _ ,,
                     AH0FS -> AY1 || F _ N ,,
                     AH0FS -> EH1 || R _ K ,,
                     AY0FS -> IH1 || D _ JH ,,
                     IH0FS -> IY1 || .#. R _ , D _ [F | K R | T | S] ,,
                     IH0FS -> AY1 || F _ N ,,
                     IH0FS -> EH1 || R _ B ,,

                     AE1FS -> AE0 || [P | B] _ ,,
                     AH1FS -> AH0 || _ K T .#. ,,
                     AO1FS -> AO0 || Consonant^2 _ R T .#. ,,
                     AO1FS -> ER0 || K _ R D ,,
                     AY1FS -> AY2 || R _ T ,,
                     EH1FS -> AH0 || R _ B ,,
                     EY1FS -> EY0 || T _ L ,,
                     IH1FS -> IH2 || M _ , D _ ,,
                     IY1FS -> IY2 || R _ S ,,
                     UW1FS -> UW2 || _ Z;






define Unconditional AA1IS -> AH0,
                     AE1IS -> AE0,
                     AH1IS -> AH0,
                     AO1IS -> AO0,
                     AW1IS -> AW0,
                     AY1IS -> AH0,
                     AY1IS -> IH0,
                     EH1IS -> EH0,
                     ER1IS -> ER0,
                     EY1IS -> EY0,
                     IH1IS -> IH0,
                     IY1IS -> IH0,
                     OW1IS -> AH0,

                     [AA0IS | AA2IS] -> AA1,
                     [AE0IS | AE2IS] -> AE1,
                     AH0IS -> EH1,
                     AH2IS -> AH1,
                     [AO0IS | AO2IS] -> AO1,
                     [AW0IS | AW2IS] -> AW1,
                     [AY0IS | AY2IS] -> AY1,
                     [EH0IS | EH2IS] -> EH1,
                     [ER0IS | ER2IS] -> ER1,
                     [EY0IS | EY2IS] -> EY1,
                     [IH0IS | IH2IS] -> IH1,
                     [IY0IS | IY2IS] -> IH1,
                     [OW0IS | OW2IS] -> OW1,
                     [OY0IS | OY2IS] -> OY1,
                     [UH0IS | UH2IS] -> UH1,
                     [UW0IS | UW2IS] -> UW1,

                     AA0FS -> AA1,
                     AE0FS -> AE1,
                     AH0FS -> AH1,
                     AO0FS -> AO1,
                     AW0FS -> AW1,
                     AY0FS -> AY1,
                     EH0FS -> EH1,
                     ER0FS -> ER1,
                     EY0FS -> EY1,
                     IH0FS -> IH1,
                     IY0FS -> IY1,
                     OW0FS -> AA1,
                     OW0FS -> OW1,
                     OY0FS -> OY1,
                     UH0FS -> UH1,
                     UW0FS -> UW1,

                     AA1FS -> AA2,
                     AE1FS -> AE2,
                     AH1FS -> AH2,
                     AO1FS -> AO2,
                     AW1FS -> AW0,
                     AY1FS -> AY0,
                     EH1FS -> EH0,
                     ER1FS -> ER2,
                     EY1FS -> EY2,
                     IH1FS -> IH0,
                     IY1FS -> IY0,
                     OW1FS -> OW0,
                     UH1FS -> UH0,
                     UW1FS -> UW0;



define RemovePos ["+" NOUN | "+" VERB] -> 0;

define PHON Flags .o. Conditional .o. Unconditional .o. RemovePos;

# ***** Define a finite state lexicon in terms of Phon, Mor, and Phrase.
define StressDoublets PHRASE .o. MOR .o. PHON;
