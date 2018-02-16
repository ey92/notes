define zeroStress [
AA0 | AE0 | AH0 | AO0 |
AW0 | AY0 | EH0 | ER0 |
EY0 | IH0 | IY0 | OW0 |
OY0 | UH0 | UW0
];

define firstStress [
AA1 | AE1 | AH1 | AO1 |
AW1 | AY1 | EH1 | ER1 |
EY1 | IH1 | IY1 | OW1 |
OY1 | UH1 | UW1
];

define secondStress [
AA2 | AE2 | AH2 | AO2 |
AW2 | AY2 | EH2 | ER2 |
EY2 | IH2 | IY2 | OW2 |
OY2 | UH2 | UW2
];

define Vowel [zeroStress | firstStress | secondStress];

define Capitals ["A" | "B" | "C" | "D" | "E" | "F" |
"G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" |
"P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" |
"Y" | "Z"];

define upper [\Capitals]* .o.
["a" -> "A",
"b" -> "B",
"c" -> "C",
"d" -> "D",
"e" -> "E",
"f" -> "F",
"g" -> "G",
"h" -> "H",
"i" -> "I",
"j" -> "J",
"k" -> "K",
"l" -> "L",
"m" -> "M",
"n" -> "N",
"o" -> "O",
"p" -> "P",
"q" -> "Q",
"r" -> "R",
"s" -> "S",
"t" -> "T",
"u" -> "U",
"v" -> "V",
"w" -> "W",
"x" -> "X",
"y" -> "Y",
"z" -> "Z"];

define lower upper.i;

#final stress
define zeroToFirst [\Vowel]*zeroStress[\Vowel]*firstStress[\Vowel]*;

#initial stress
define firstToSecond [\Vowel]*firstStress[\Vowel]*secondStress[\Vowel]*;
define firstToZero [\Vowel]*firstStress[\Vowel]*zeroStress[\Vowel]*;

define Syllable [\Vowel]*Vowel[\Vowel]*;

define twoSyllable CMU .o. [Syllable^2];
define ambTwoSyllable _ambpart(twoSyllable);
define finalStress ambTwoSyllable .o. zeroToFirst;
define initialStress ambTwoSyllable .o. [firstToSecond | firstToZero];
define P3 [initialStress.u & finalStress.u] .o. CMU;
define P3NounsAndVerbs [V .o. upper].l & [N .o. upper].l .o. P3;

define nounToAdjective [[N /// {ity}] [e | {al} | {ary}]^{0,1} ] & A;
define adjectiveToNoun [A /// [e | 0 | {al} | {ary}]] {ity} & N;

define adjectiveToNounCont [A /// {ble}] {bility} & N;
define adjectiveToNounCont2 [A /// {osity}] {ous} & N;

define P5cont [[N /// {bility}] {ble}] & A;
define P5cont2 [[N /// {ous}] {osity}] & A;

define P5missing [nounToAdjective .o. upper].l | [adjectiveToNoun .o. upper].l - CMU.u;
define P5contains [[nounToAdjective .o. upper].l | [adjectiveToNoun .o. upper].l] & CMU.u;
