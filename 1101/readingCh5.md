[Chapter 1](https://github.com/ey92/notes/blob/master/1101/readingCh1.md) [Chapter 2](https://github.com/ey92/notes/blob/master/1101/readingCh2.md) [Chapter 3](https://github.com/ey92/notes/blob/master/1101/readingCh3.md) [Chapter 4](https://github.com/ey92/notes/blob/master/1101/readingCh4.md) [Chapter 5](https://github.com/ey92/notes/blob/master/1101/readingCh5.md) [Chapter 6](https://github.com/ey92/notes/blob/master/1101/readingCh6.md) [Chapter 7](https://github.com/ey92/notes/blob/master/1101/readingCh7.md) [Chapter 8](https://github.com/ey92/notes/blob/master/1101/readingCh8.md) [Chapter 13](https://github.com/ey92/notes/blob/master/1101/readingCh13.md)

# Chapter 5: Syntax
- component of mental grammar
- how sentences and phrases constructed out of smaller phrases and words
<br> <br>
**linguistic expression** - piece of language with form, meaning, and syntactic properties
- syntactic properties determine how to combine with other expressions
<br> <br>
- _grammatical_/syntactically well-formed
- _ungrammatical_ expressions/syntactically ill-formed
- _grammaticality judgment_ is reflection of native speaker's mental grammar, irrelevant from prescriptive grammar
<br> <br>
- syntax vs semantics: not mutually exclusive, since syntax can affect meaning
	- missing semantics -> strange meaning
	- missing syntax -> guess meaning or nonsense
- syntax can't be predicted or explained based on expression's meaning
- if syntax is meaning-related, would be similar across all languages
<br> <br>
- subject, object
- _principle of compositionality_: meaning of phrase depends on combined expressions and how syntactically connected
- _lexical expressions_ (e.g. words, idioms)
- _phrasal expressions_
<br> <br>
- _morphosyntax_: refers to morphology and syntax as a single grammar component

## Syntactic Properties
1. _word order_
 - linear order in which words can occur in some phrasal expression
 - set of syntactic properties of expressions that dictates how they can be ordered with respect to other expressions
2. _co-occurrence_
- set of syntactic properties that determines which expressions may or have to co-occur with some other expressions in a sentence

### Word Order
- English is SVO
- SOV (44%), SVO (35%), VSO (19%), VOS, OVS, OSV
- depends on context
	- German SVO main, SOV subordinate
	- English SVO main, VSO question
	- all 6 grammatical within some languages, but affects meaning
- **topicalization** - syntactic process (EN) where syntactic constituent occurs at the beginning of sentence to highlight topic
- ordering constraints
	- e.g. preposition precedes its object (EN), postpositions immediately follows noun phrase (JP)

### Co-Occurrence
#### Arguments
- _arguments_ & _complements_
- expressions with co-occurrence requirement
	- nouns need determiner (EN)
	- transitive verbs require subject and direct object (EN)
- arguments can include NP, PP, SUBJ, VP (obj inf)
- required arguments must be present, and no extras
- languages differ in co-occurrence restrictions
	- multiple determiners

#### Adjuncts
- attributive modifiers aka modifiers because they modify the meaning
- expressions whose occurrence is optional
- e.g. adjectives

##### Arguments vs Adjuncts
- expressions can be arguments or adjuncts, depending on context

![Arguments vs Adjuncts](https://github.com/ey92/notes/blob/master/1101/arguments-vs-adjuncts.png)

#### Agreement
- inflectional morphological form influences expression's co-occurrence requirements
- noun/adjective agreement: case, number, gender
- noun/verb agreement: number, gender, person

## Syntactic Constituency
- syntactic constituent
- determining a syntactic constituent: answer to question about sentence's meaning
	- "The cat was sleeping on the couch"
	- Where was the cat sleeping? On the couch.
- constituency tests not perfectly reliable & can have conflicting results

### Clefting
**cleft** - type of sentence that has general form It is/was X that Y (e.g., It was Sally that I wanted to meet)
- can be used as a constituency test
	- It was the cat that was sleeping on the couch.

### Pro-Form Substitution
**substitution** - constituency test where constituent replaced with single word (or simple phrase), such as a pro-form
**pro-form** - word (e.g. pronoun) that can replace a syntactic constituent
	- [She] was sleeping on the desk.
	- The cat was sleeping [there].
	- The cat was [doing so].
	- The cat was sleeping on [it].
<br> <br>
other tests:
- coordination
- deletion
- topicalization

## Syntactic Categories
- groups of words that have similar word order or co-occurrence requirements
- when expressions have similar syntactic properties, can be used interchangeably
- same _syntactic distribution_
- independent of morphological or semantic properties
<br><br>
in English:
- sentence: consists of all phrasal expressions that can grammatically occur in Sally thinks that ____
- noun phrase: proper names, pronouns, and all other expressions with the same syntactic distribution
- noun: expressions that combine with determiners to their left, resulting in a noun phrase
	- count noun: noun that can be counted and pluralized, must co-occur with determiner
	- mass noun: noun that cannot be counted or be pluralized, can occur without determiner, can be replaced with pronoun
- determiner: expressions that combine with a noun to their right, resulting in a noun phrase
	- demonstrative determiner: a, this, that, these, those
	- possessive determiner: my, your, his, her, our, etc
	- quantificational determiner: a, some, the, every, all, few, most, etc
- (attributive) adjective: expressions that can be noun adjuncts or occur between a determiner and a noun
- verb phrase: all expressions that, if combined with a noun phrase to their left, result in a sentence
- intransitive verb: lexical expressions which can stand alone as verb phrase, requires no complement/only subject argument
- transitive verb: expressions that if combined with a noun phrase to their right, result in a verb phrase; a verb that needs a noun phrase complement
- ditransitive verb: expressions that if combined with two noun phrases to their right result in a verb phrase; a verb that needs two noun phrase complements
- sentential complement verb: expressions that if combined with sentence to their right result in a verb phrase; a verb that needs a sentence as its complement
- VP adjunct:
	- adverb
	- prepositional phrase: consists of preposition and noun phrase
- N adjunct:
	- adjective

## Constructing a Grammar
use lexicon/lexical entries and _phrase structure rules_ to build _phrase structure tree_

| Lexical Entries |
| --------------- |
| NP → {she, Fluffy, Bob, Sally, . . .} |
| N → {dog, cat, man, . . .} |
| Adj → {fluffy, cute, gray, . . .} |
| Det → {the, this, some, . . .} |
| VP → {slept, barked, . . .} |
| TV → {liked, devoured, . . .} |
| DTV → {gave, sent, . . .} |
| SV → {thought, said, . . .} |
| P → {to, for, with, on, under, . . .} |
| Adv → carefully, quickly, yesterday, . . .} |

| Phrase Structure Rule | function |
| --------------------- | -------- |
| S → NP VP | allows VPs to combine with their subject NP to form a sentence |
| NP → Det N | allows determiners to combine with a noun to form an NP |
| N → Adj N | allows attributive adjectives to be noun adjuncts |
| VP → VP Adv | allows adverbs to be VP adjuncts |
| VP → TV NP | allows transitive verbs to combine with their object NP to form a VP |
| VP → DTV NP NP | allows ditransitive verbs to combine with their object NPs to form a VP |
| VP → SV S | allows sentential complement verbs to combine with their complement S to form a VP |
| PP → P NP | allows prepositions to combine with their complement NP to form a PP |
| N → N PP | allows PPs to be noun adjuncts |
| VP → VP PP | allows PPs to be VP adjuncts |

- can find that the same expressions can combine in different ways: ambiguity

### Ambiguity
- linguistic forms can correspond to more than one distinct expression
- ambiguous word bank: same word form, multiple meanings and syntactic properties
- types of ambiguity:
	- _lexical ambiguity_/_homophony_, expressions homophonous
	- _structural ambiguity_: words combine in different ways

![Structural Ambiguity 1](https://github.com/ey92/notes/blob/master/1101/structural-ambiguity1.png)
![Structural Ambiguity 2](https://github.com/ey92/notes/blob/master/1101/structural-ambiguity2.png)