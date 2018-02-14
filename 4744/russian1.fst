# Russian devoicing example from Kenstowicz and Kisseberth
# p 46
# This version defines moprphological relation Mor
# and phonological relation Phon.  Compose them as
# VMor .o. Phon to map morphology to surface.


# Russian consonants
define C b | č | d | k | g | l | m | n | p | r | s | š | t | ť | v | z | ž;

# Alt-X insert-char (+ name given below)
#Latin Small Letter C with caron č
#Latin Small Letter s with caron š
#Latin Small Letter z with caron ž
#Latin Small Letter t with caron ť

# Noun stems
# xleb bread
# grib mushroom
# grob coffin
# čerep skull
# xolop bondman
# trup corpse
# sad garden
# prud pond
# cvet color
# zakat sunset
# raz time
# zakaz order
# les forest
# us whisker
# storož guard
# duš shower
# rog horn
# porog threshold
# rak crayfish
# porok vice


define Nstem [
 [ BREAD .x. {xleb}] |
 [ MUSHROOM .x. {grib}] |
 [ COFFIN .x. {grob}] |
 [ SKULL .x. {čerep}] |
 [ BONDMAN .x. {xolop}] |
 [ CORPSE .x. {trup}] |
 [ GARDEN .x. {sad}] |
 [ POND .x. {prud}] |
 [ COLOR .x. {cvet}] |
 [ SUNSET .x. {zakat}] |
 [ TIME .x. {raz}] |
 [ ORDER .x. {zakaz}] |
 [ FOREST .x. {les}] |
 [ WHISKER .x. {us}] |
 [ GUARD .x. {storož}] |
 [ SHOWER .x. {duš}] |
 [ HORN .x. {rog}] |
 [ THRESHOLD .x. {porog}] |
 [ CRAYFISH .x. {rak}] |
 [ VICE .x. {porok}] ];


# ***** Define the inflections 
define Infl [NomSg : 0] | [DatSg : u];

# **** Define underlying inflected words
define PHRASE Nstem.u "+" Infl.u;

# ***** Define the morphology MOR, mapping a sequence of morphemes to an 
# ***** underlying phone spelling
define M Nstem | "+":0 | Infl; 
define MOR M+;

# Underlying words in their spelling form
define Uword [PHRASE .o. MOR].l;

# Phonology
# ***** Define LDrop, a rule which deletes l in certain contexts.
define LDrop l -> 0 || C _ .#.;

# ***** Define Devoi, a rule which devoices b,d,g,z,ž in final context.
define Devoi b -> p, d -> t, g -> k, z -> s, ž -> š  || _ .#.;

# ***** Define DSD (dental stop deletion), a rule which deletes t,d
# before an l.
# Be careful here to use the right unicode character ť.
define DSD [ t | d | ť ] -> 0 || _ l;

# ***** Define the relation PHON.
define PHON DSD .o. LDrop .o. Devoi;

# ***** Define a finite state lexicon in terms of Phon, Mor, and Phrase.
define Russian PHRASE .o. MOR .o. PHON;

# Define a relation that maps just between underlying and surface phonological forms.
define Russian2 Uword.o. PHON;

