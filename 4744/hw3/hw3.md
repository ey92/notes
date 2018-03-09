need to include good/bad samples & screenshots for all <br>
`cat $input | lopar -in $grammar`

Elizabeth Yam ey92
CS 4744 HW3

## Files
| problem | filename(s) |
| ------- | ----------- | 
| #1 | p1-bad.sent p1-good.sent <br> p1.lex	p1.gram	p1.start	p1.oc	p1.OC |
| #2 | p2-bad.sent <br> p2-good.sent <br> p2.lex	p2.gram	p2.start	p2.oc	p2.OC |
| #3 |  |
| #4 | <br> p4a.lex	p4a.gram	p4a.start	p4a.oc	p4a.OC <br> p4b.lex	p4b.gram	p4b.start	p4b.oc	p4b.OC <br> p4c.lex	p4c.gram	p4c.start	p4c.oc	p4c.OC <br> p4d.lex	p4d.gram	p4d.start	p4d.oc	p4d.OC |
| #5 | p5.lex	p5.gram	p5.start	p5.oc	p5.OC |

### P1
#### Part A
p1-bad.sent
```
people need*
[people]* [need people]*
[people need]+
[people need people]*
[people]* [who people]*
[people]* [need who]*
[need people]*
people who need
```

#### Part B
p1-good.sent
```
people need people
people who need people need people
people who people need need people
people need people who need people
people who people who need people need need people
# people who people who people need need people
--
people need people who need people who need people who need people
people need people who need people who need people
people who need people who need people need people
people who people need need people who need people
people who people need need people who people need
people need people who need people who people need
```

#### Part C
p1.lex
```
people  N   1.0
need    V   1.0
who     P   1.0
```

p1.gram
```
1.0     S N' V N
1.0     N N' P V N
1.0     N N' P N V
```

Chomsky Normal Form version:
```
1.0     S NP' VP
1.0     VP VB' NP
1.0     NP NP' NP1
1.0     NP1 WP' VP
1.0     NP1 WP' NP2
1.0     NP2 NP' VB
```

p1.start
```
S       1.0
```

#### Part D
```
people [who need people]* [who people need]* need people [who need people]* [who people need]*
people [who people]^{n} [need]^{n} need people [ who people need]*
```

#### Part E
No, it isn't licensed by my grammar, and no, it is intuitively possible.
- with square brackets grouping valid noun phrases: <br> `[people who [people who [people who people need] need] need] people`
- it is intuitively easy to understand the meaning in the smallest set of square brackets <br> `people who people need` <br> as a noun phrase
- replace that smallest noun phrase with another noun to continue simplifying: <br> `[people who [people who [monkeys] need] need] people`
- keep replacing and it will be clear that the sentence is not a valid English sentence:
	- `[people who [monkeys] need] people`
	- `[monkeys] people`
- the sentence is missing a verb

#### Part F
(optional)

---

### P2
Finding Patterns: <br> First, I looked for groups of predicate endings that began the same way and found four groups (see columns in table below). I then looked for common ways sentence predicates began (see rows in table below). After that, it was just connecting which pieces went together and whether or not additional auxiliary verbs needed to be inserted.

| predicates | VPR <br> (verb base present) | MDB <br> (modified base) | VPP <br> (verb predicate past) | VPS <br> (verb predicate present) |
| ---------- | --- | --- | --- | --- |
| represents | discuss it | discussing it <br> being discussed <br> discussed | discussed it | discusses it |
| starts with may/should | VPR | be + MDB <br> have + been + MDB | have + VPP | |
| starts with has/had | | been + MDB | VPP | |
| starts with is/was | | MDB | | |

- each pair got the same label: 
	- may/should(MD)
	- has/had(VBH)
	- is/was(BES)
	- ridicule/discuss(VB)
	- ridicules/discusses(VBS)
	- ridiculed/discussed(VBD)
	- ridiculing/discussing(VBP)

p2.lex
```
he          NP  1.0
she         NP  1.0
may         MD  1.0
should      MD  1.0
have        AUX 1.0
has         VBH 1.0
had         VBH 1.0
be          BE  1.0
been        BEN 1.0
is          BES 1.0
was         BES 1.0
being       BEP 1.0
it          OBJ 1.0
ridicule    VB  1.0
discuss     VB  1.0
ridicules   VBS 1.0
discusses   VBS 1.0
ridiculed   VBD 1.0
discussed   VBD 1.0
ridiculing  VBP 1.0
discussing  VBP 1.0
```

p2.gram
```
1.0     VPR VB' OBJ     // discuss it
1.0     MDB VBP' OBJ    // discussing it
1.0     MDB BEP' VBD    // being discussed
1.0     VPS VBS' OBJ    // discusses it
1.0     VPP VBD' OBJ    // discussed it

1.0     S NP' VPS       // she discusses it
1.0     S NP' VPP       // she discussed it

1.0     S NP' VPM       // goes to may/should
1.0     VPM MD' VPR     // may/should discuss it
1.0     VPM MD' MDP     // may/should other predicates
1.0     MDP BE' MDB     // may/should be discussingit/beingdiscussed
1.0     MDP BE' VBD     // may/should be discussed
1.0     MDP AUX' HB     // may/should have been
1.0     HB BEN' MDB     // may/should have been discussingit/beingdiscussed
1.0     HB BEN' VBD     // may/should have been discussed
1.0     MDP AUX' VPP    // may/should have discussed it

1.0     S NP' H         // goes to has/had
1.0     H VBH' VPP      // has/had discussed it
1.0     H VBH' HB       // has/had been
1.0     HB BEN' MDB     // has/had been discussingit/beingdiscussed
1.0     HB BEN' VBD     // has/had been discussed

1.0     S NP' BP        // goes to is/was
1.0     BP BES' MDB     // is/was discussingit/beingdiscussed
1.0     BP BES' VBD     // is/was discussed
```
- since we are required to use Chomsky Normal Form with binary branching production rules, I separated "discussed"(VBD) from MDB predicates and just duplicated every MDB predicate rule, replacing with VBD.
	- for example `BP BES' MDB` and `BP BES' VBD`

---

### P3
#### Part A
queries: <br>
`tgrep -c 2010.crp 'VBD $. S' | sort -nr | uniq -c | sort -nr | head -50 > ~/VBDS50.txt` <br>
`tgrep -c 2010.crp 'VBD $. SBAR' | sort -nr | uniq -c | sort -nr | head -50 > ~/VBDSBAR50.txt`

| freq | VBD preceding S | freq | VBD preceding SBAR |
| ---- | --------------- | ---- | ------------------ |
| 7979 | had | 119916 | said |
| 7935 | wanted | 5513 | thought |
| 7713 | began | 4097 | was |
| 7032 | called | 4052 | found |
| 5793 | made | 3839 | knew |
| 4782 | tried | 2647 | noted |
| 4571 | declined | 2497 | suggested |
| 3888 | seemed | 2060 | added |
| 3683 | started | 1983 | felt |
| 3515 | was | 1949 | announced |
| 3498 | used | 1856 | showed |
| 3059 | appeared | 1779 | reported |
| 2845 | decided | 1776 | acknowledged |
| 2561 | failed | 1638 | came |
| 2475 | helped | 1458 | argued |
| 2464 | said | 1368 | believed |
| 2447 | found | 1153 | asked |
| 2402 | needed | 1129 | insisted |
| 2352 | agreed | 1062 | realized |
| 2080 | continued | 1039 | warned |
| 1813 | allowed | 1005 | concluded |
| 1707 | left | 961 | decided |
| 1674 | kept | 886 | estimated |
| 1662 | refused | 861 | indicated |
| 1601 | planned | 849 | wrote |
| 1535 | saw | 848 | learned |
| 1420 | expected | 804 | predicted |
| 1363 | let | 730 | confirmed |
| 1330 | sought | 668 | ruled |
| 1152 | got | 656 | claimed |
| 1080 | were | 608 | discovered |
| 1068 | stopped | 603 | wondered |
| 1024 | came | 595 | agreed |
|  992 | vowed | 580 | did |
|  990 | ordered | 567 | complained |
|  983 | managed | 566 | meant |
|  966 | considered | 561 | explained |
|  812 | chose | 501 | admitted |
|  798 | led | 450 | testified |
|  789 | forced | 437 | declared |
|  769 | promised | 435 | determined |
|  749 | threatened | 430 | hoped |
|  733 | intended | 422 | emphasized |
|  711 | hoped | 419 | cautioned |
|  687 | watched | 413 | saw |
|  658 | prompted | 406 | figured |
|  562 | caused | 399 | conceded |
|  559 | voted | 397 | questioned |
|  505 | required | 378 | looked |
|  487 | struggled | 375 | denied |

#### Part B
S/SBAR complement classes

1. [question<sup>1</sup>] + _WDT<sup>5</sup>_ +  SBAR

2. [question<sup>1</sup>]/[says<sup>2</sup>] + _IN<sup>6</sup>_ + S

3. [order<sup>3</sup>] + _direct object_ + _objective infinitive_ VP (SBAR)

4. [says<sup>2</sup>]/[try<sup>4</sup>] + _complementary infinitive_ VP (SBAR)

5. is [says<sup>2</sup>] + _to have_ + VP (SBAR)



<sup>1</sup> question verbs:
- asked, inquired, questioned
- wondered, speculated
- decided

<sup>2</sup> says verbs:
- said, stated, declared, conveyed, claimed, announced, asserted
- believed, acknowledged, revealed
- answered, responded, replied
- read

<sup>3</sup> order verbs:
- told
- persuaded
- ordered

<sup>4</sup> try verbs:
- tried, attempted, endeavored
- aimed, aspired

<sup>5</sup> WDT wh-determiner: 
- who, what, when, where, why

<sup>6</sup> IN:
- that
- whether

#### Part C
CNF grammar
test sentences

---

### P4
#### Part A
`a^{m} b^{m}     m > 0` <br>
p4a.gram
```
1.0     S C'
1.0     C A' C B
1.0     C A' B
```
- make sure every iteration inserts one A and one B before and after the recursive component respectively

#### Part B
`a^{m} b^{n}     n > m` <br>
p4b.gram
```
1.0     S C'
1.0     C A' C B
1.0     C C' B
1.0     C B
```
- make sure recursive element ends on B
- allow recursive element to only produce A if there is also a B
- allow recursive element to allow addition of only B within iteration

#### Part C
`[a b]^{n}      n > 0` <br>
p4c.gram
```
1.0     S C'
1.0     C A' B C
1.0     C A' B
```
- allow recursive element to repeat after A B
- force recursive element to end on A B so string has at least one instance of "ab"

#### Part D
`a b+` <br>
p4d.gram
```
1.0     S A C'
1.0     C B' C
1.0     C B'
```
- force first production to start with A and never add A again
- recursive element only goes to adding any number of B
- recursive element must end with B to force at lease one B

---

### P5
#### Part A
need frequencies

| prepositions | root |
| ------------ | ---- |
| of | rush, smoke,  taste,  layer,  change |
| with | mix,  cover,  talk,  work,  visit  |
| for | report,  test,  push,  scan,  check |

I initially used ANV.fsb to find words that could be a noun or a verb to get a verb to start with.
```
load ANV.fsb
regex A & V;
print random-words
```

I found the 3rd form [R p X] to be the hardest to come up with, so I queried the NYT2006 corpus with that, with the format of VB+IN+NN: <br>
`cwb-scan-corpus NYT2006 ?word+0="/rush/" word+0 ?pos+1="/IN/" word+1 ?pos+2="/NN/" word+2 | uniq -c | sort -nr | less` <br>
This gave me a list of prepositions to work with, so I replaced the initial verb with _pos_ as VB or VBD and replaced the preposition IN with some of the ones that I found in the query. Eventually, I ran these queries on NYT200x to get as much coverage as possible.

Somehow all 45 verb-preposition pairs formed nominal complements. A few also formed verbal complements, but I chose to use their nominal complements since they were more popular in the corpora.

---
##### of
`cwb-scan-corpus NYT2006 ?pos+0="/VB/" word+0 ?word+1="/of/" word+1 ?pos+2="/NN/" word+2 | uniq -c | sort -nr | less`

| | rush | smoke | taste | layer | change |
| - | - | - | - | - | - |
| [X R Tns] | oil rush -ed [1] | tobacco[1] smoke -d | meat taste -d [8] | cake layer -ed [4] | life change -d  [326] |
| [X R] | oil rush [11] | tobacco smoke [195] | meat taste [7] | cake layer [66] | life change [107] |
| [R p X] | rush of oil [4] | smoke of tobacco [2]  | taste of meat [4] | layer of cake [16] | change of life [85] |

---
##### with
`cwb-scan-corpus NYT2006 ?pos+0="/VB/" word+0 ?word+1="/with/" word+1 ?pos+2="/NN/" word+2 | uniq -c | sort -nr | less`

| | mix | cover | talk | work | visit |
| - | - | - | - | - | - |
| [X R Tns] | milk mix -ed [10] | plastic cover -ed [5] | child talk -ed [1] | sound work -ed [1] | family visit -ed [76] |
| [X R] | milk mix [1] | plastic cover [63] | child talk [10] | sound work [12] | family visit [79] |
| [R p X] | mix with milk [4] | cover with plastic [16] | talk with child [5] | work with sound [8] | visit with family [22] |

---
##### for
`cwb-scan-corpus NYT2006 ?pos+0="/VB/" word+0 ?word+1="/for/" word+1 ?pos+2="/NN/" word+2 | uniq -c | sort -nr | less`

| | report | test | push | scan | check |
| - | - | - | - | - | - |
| [X R Tns] | work report -ed [9] | drug test-ed [26] | reform push -ed [3] | information scan -ned [2] | blood check -ed [4] |
| [X R] | work report [22] | drug test [1318] | reform push [5] | information scan [1] | blood check [1] |
| [R p X] | report for work [71] | test for drug [3] | push for reform [26] | scan for information [3] | check for blood [5] |

#### Part B
p5.lex
```
oil 	NN 	1.0
tobacco	NN 	1.0
meat 	NN 	1.0
cake 	NN 	1.0
life 	NN 	1.0
milk 	NN 	1.0
plastic	NN 	1.0
child 	NN 	1.0
sound 	NN 	1.0
family 	NN 	1.0
work 	NN 	1.0
drug 	NN 	1.0
reform 	NN 	1.0
information 	NN 	1.0
blood 	NN 	1.0

rush	VOF	1.0
smoke	VOF	1.0
taste	VOF	1.0
layer	VOF	1.0
change	VOF	1.0

mix 	VWI	1.0
cover	VWI	1.0
talk	VWI	1.0
work	VWI	1.0
visit	VWI	1.0

report	VFO 	1.0
test	VFO	1.0
push	VFO	1.0
scan	VFO	1.0
check	VFO	1.0


of	POF	1.0
with	PWI	1.0
for	PFO	1.0

-ed 	ED	1.0
the 	DT 	1.0
there	PO 	1.0
was 	WAS	1.0
good 	JJ 	1.0
```

p5.gram
```
1.0 	S DT' RPXP  	// determiner + [RpX] form phrase
1.0 	RPXP RPX' P 	// [RpX] phrase = [verb + with + noun] (RpX) + predicate (P)
1.0 	RPX VOF' WP 	// build [RpX] form: RPX = base verb + [with + noun] (WP)
1.0 	RPX VWI' WP
1.0 	RPX VFO' WP

1.0 	S DT' XRP 		// determiner + [XR] phrase
1.0 	XRP XR' P 		// [XR] phrase = [XR] form + predicate (P)
1.0 	XR VOF' NN 		// build [XR] base form as verb + noun
1.0 	XR VWI' NN
1.0 	XR VFO' NN

1.0 	WP PWI NN 		// with phrase = with + noun
1.0 	P WAS' JJ 	 	// predicate = form of "to be" (was) + adjective (good)

1.0 	S SP' XRTP 		// subject phrase + XRT phrase
1.0 	XRTP NN' VOF ED 	// XRT phrase = noun + verb + past tense
1.0 	XRTP NN' VWI ED 	// XRT phrase = noun + verb + past tense
1.0 	XRTP NN' VFO ED
1.0 	SP PO' WAS 			// subject phrase = pronoun + was
```

- the [RpX] and [XR] forms were easy to transform into sentences by prepending a determiner and appending a simple sentence predicate ("was good")
- however, not all the [X R Tns] forms could be transformed into sentences the same way. There seemed to be a pattern, depending on the preposition used.
	- the verbs paired with "of" could be turned into a complete sentence by prepending a determiner to the phrase.
		- e.g. [the] oil rushed
	- some of the verbs paired with "with" and "for" sounded strange when used in the active voice, so I prepended "there was" to turn them into the passive voice. This also applied to the "of" verbs, so I just used this one rule to simplify the grammar.

#### Part C
??? what to write

---
questions:
- how to search for words using tgrep instead of just penn treebank symbols
- more S clause examples
- is it okay that everything is only [X R Tns] form?
- confused what to write for 5c

`>tgrep -c 2007.crp 'VP << "/wondered/"' | head`