define NStem [ [WATER .x. {haa}] |
              [SLOTH .x. {pahiitu}] |
              [PAN .x. {pay}] |
              [SKIN .x. {hay}]
              ];

define VStem [ [FIT .x. {caa}] |
               [GIVE .x. {caay}] |
               [FRY .x. {ruye}]
               ];

# ***** Define the inflections
define PossessivePronoun [HIS : {ca}] | [MY : {ra}];
define Pronoun  [HE : {ca}] | [I : {ra}];
define Preposition [TO : {hu}];
define DirectObject [IT : {ra}];

define Infl PossessivePronoun | Pronoun | Preposition | DirectObject;

# ***** Define underlying phrases (inflected words)
define PHRASE [[PossessivePronoun.u "+"]^{0, 1} NStem.u ["+" Preposition.u]^{0,1}] |
              [[Pronoun.u "+"]^{0, 1} VStem.u ["+" DirectObject.u]^{0,1}];

# ***** Define the morphology MOR, mapping a sequence of morphemes to an
# ***** underlying phone spelling
define M Infl | "+":0 | NStem | VStem;
define MOR M+;

define SWAP {yhu} -> {hyu} || _ .#. ,,
            {yra} -> {rya} || _ .#. ;

define ADDEE {aa} -> {ee} || r a ? _ y;

define ADDE {a} -> {e} || r a ? _ y;

define YINSERT [..] -> y || r a [h | c | r | p] _ [a | u] ,,
               [..] -> y || e r _ a .#.;

define YDELETE y -> 0 || e _ .#.;

define PHON ADDEE .o. ADDE .o. SWAP .o. YINSERT .o. YDELETE;

# ***** Define a finite state lexicon in terms of Phon, Mor, and Phrase.
define Yagua PHRASE .o. MOR .o. PHON;
