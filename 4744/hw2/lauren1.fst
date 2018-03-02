# LING 4424 - Hwk 2
# Lauren Hsu (lch89)

##### Question 1

# NOTE:
# "I" = "i:" combo
# "G" = glottal stop

# Karok consonants
define Con [ G | f | h | k | n | p | s | š | r | t | v | x | y ];

# Karok vowels
define Vow [ a | I | i | u ];

##### Verbs list
# shoot -> pasip
# steal -> sItva
# stoop -> kifnuk
# measure -> suprih
# pick up -> Gifik
# pluck at -> Gaktuv
# fill -> Gaxyar (axyar)
# jump -> Giškak (iškak)
# laugh -> Gikšah (ikšah)
# shoot at a target -> Gišriv (išriv)
# point -> Guksup (uksup)

define Vstem [ ["SHOOT" .x. {pasip}] | ["STEAL" .x. {sItva}] | ["STOOP" .x. {kifnuk}] | ["MEASURE" .x. {suprih}] | ["PICK UP" .x. {Gifik}] | ["PLUCK AT" .x. {Gaktuv} ] | ["FILL" .x. {axyar}] | ["JUMP" .x. {iškak}] | ["LAUGH" .x. {ikšah}] | ["SHOOT AT A TARGET" .x. {išriv}] | ["POINT" .x. {uksup}] ] ;

# For Imperative, stems cannot start with vowel
# define NoVowStart [..] -> G || 0 _ Vow;
define NoVowStart [..] -> G || .#. _ Vow;

# For Singular, no successive vowels
define FstSecondVow Vow -> 0 || ni _;
define ThdSecondVow Vow -> 0 || Gu _;

# For First Singular, palate the s's at the start of the stem or if start with vowel
define FstS s -> š || [.#. | .#. Vow ?* ] _ ;

# For First Singular, add "ni" pre-fix
define FstPre [..] -> ni || .#. _ ;

# For Third Singular, un-palate the s's
define ThdS š -> s;

# For Third Singular, add "Gu" pre-fix
define ThdPre [..] -> Gu || .#. _ ;

# Apply Rules
define Imper [Vstem .o. NoVowStart];
define FstSing [[[Vstem .o. FstS] .o. FstPre] .o. FstSecondVow];
define ThdSing [[[Vstem .o. ThdS] .o. ThdPre] .o. ThdSecondVow];

# Tie together
define Karok [Imper | FstSing | ThdSing];

##### Question 2

##### Question 3

### Part A

### Part B

### Part C

##### Question 4

##### Question 5

### Part A

### Part B

### Part C