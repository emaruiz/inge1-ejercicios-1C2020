!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 4/22/2021 17:25:26'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstObject'.
	secondPushedObject := 'secondObject'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'bi 4/28/2021 21:07:09'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'bi 4/28/2021 20:47:25'!
test01FindAnEmptyStackIsEmpty

	|finder stack|	

	stack _ OOStack new.
	finder _ SentenceFinderByPrefix with: stack.
	
	self assert: (finder find:'a') isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'bi 4/28/2021 20:48:08'!
test02FindOfEmptyPrefixReturnsError

	|finder stack|	
	
	stack _ OOStack new.
	finder _ SentenceFinderByPrefix with: stack.
	
	self should: [finder find:''] 
	      raise: Error 
	      withExceptionDo:[:anError | anError messageText = SentenceFinderByPrefix messageEmptyPrefixError].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'bi 4/28/2021 20:56:38'!
test03FindIsCaseSensitive

	|finder stack|	
	
	stack _ OOStack new.
	stack push: 'AbA'.
	stack push: 'bAb'.
	finder _ SentenceFinderByPrefix with: stack.
	
	self assert: (finder find:'aBa') isEmpty.
	self assert: (finder find:'BaB') isEmpty.
	
	self deny: (finder find:'Ab') isEmpty.
	self deny: (finder find:'bA') isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'bi 4/28/2021 20:58:19'!
test04FindPrefixWithSpacesReturnsError

	|finder stack|	

	stack _ OOStack new.
	finder _ SentenceFinderByPrefix with: stack.

	self should: [finder find:' '] 
	      raise: Error 
	      withExceptionDo:[:anError | anError messageText = SentenceFinderByPrefix messageHasEmptySpacesError].
	self should: [finder find:'aa '] 
	      raise: Error 
	      withExceptionDo:[:anError | anError messageText = SentenceFinderByPrefix messageHasEmptySpacesError].
	self should: [finder find:' aa'] 
	      raise: Error 
	      withExceptionDo:[:anError | anError messageText = SentenceFinderByPrefix messageHasEmptySpacesError].
	self should: [finder find:'a a'] 
	      raise: Error 
	      withExceptionDo:[:anError | anError messageText = SentenceFinderByPrefix messageHasEmptySpacesError].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'bi 4/28/2021 21:01:05'!
test05FindDoesNotModifyStack

	| finder stackToFind validationStack |	
	
	validationStack _ OOStack new.
	validationStack push: 'a'; push: 'aa'; push: 'aaa'.
	
	stackToFind _ OOStack new.
	stackToFind push: 'a';push: 'aa'; push: 'aaa'.
	
	finder _ SentenceFinderByPrefix with: stackToFind.
	finder find:'a'.
	
	self assert:(stackToFind isEmpty = validationStack isEmpty).
	self assert:(stackToFind size = validationStack size).
	3 timesRepeat: [self assert:(stackToFind pop = validationStack pop)].
	self assert:(stackToFind isEmpty = validationStack isEmpty).! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'bi 4/28/2021 21:08:16'!
test06FindOfAPresentAndUniquePrefixReturnsIt

	|finder stack result|	

	stack _ OOStack new.
	stack push:'a';push:'fdfg';push:'sdsdsdadafg'.
	
	finder _ SentenceFinderByPrefix with: stack.
	result _ finder find:'a'.
	
	self deny: result isEmpty.
	self assert: result size = 1.
	self assert: ((result first) = 'a').! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'bi 4/28/2021 21:12:08'!
test07FindOfAPresentPrefixReturnsThem

	|finder stack result resultAsBag appearances|	
	
	stack _ OOStack new.
	stack push:'a';push:'aa';push:'ababa';push:'zszszszs'.
	appearances _ 3.
	finder _ SentenceFinderByPrefix with: stack.
	result _ finder find:'a'.	

	self deny: result isEmpty.
	self assert: result size = appearances.
	result do:[:aString | self assert: (aString beginsWith: 'a')].
	resultAsBag _ result asBag.

	#('a' 'aa' 'ababa') do:[:aString | self assert: (resultAsBag occurrencesOf: aString) = 1].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'bi 4/28/2021 21:13:06'!
test08FindOfAMissingPrefixReturnsEmpty

	|finder stack |	

	stack _ OOStack new.
	stack push:'ba'.
	stack push:'baa'.
	stack push:'bababa'.
	finder _ SentenceFinderByPrefix with: stack.

	self assert: (finder find:'a') isEmpty.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'bi 4/26/2021 21:44:52'!
initialize
	
	top := OOStackBaseElement new.! !


!OOStack methodsFor: 'stack operations' stamp: 'bi 4/26/2021 21:45:33'!
isEmpty
	
	^top isEmpty.! !

!OOStack methodsFor: 'stack operations' stamp: 'bi 4/27/2021 21:39:28'!
pop
	
	
	"value := top getValue.
	top := top getNext.
	^value."
	
	"^top pop"
	
	| value |
	value := top top.
	top := top getNext.
	^value.! !

!OOStack methodsFor: 'stack operations' stamp: 'bi 4/26/2021 21:57:47'!
push: elem
	
	top := OOStackValueElement with: elem nextTo: top.
	! !

!OOStack methodsFor: 'stack operations' stamp: 'e d r r 4/27/2021 18:43:06'!
size
	
	^top amountStackElements.! !

!OOStack methodsFor: 'stack operations' stamp: 'bi 4/27/2021 20:39:32'!
top

	^top top.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 4/22/2021 17:22:41'!
stackEmptyErrorDescription
	
	^ 'Stack is empty!!!!!!'! !


!classDefinition: #OOStackElement category: 'Stack-Exercise'!
Object subclass: #OOStackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackElement methodsFor: 'complementary stack operations' stamp: 'e d r r 4/28/2021 18:46:39'!
amountStackElements
	
	self subclassResponsibility.! !

!OOStackElement methodsFor: 'complementary stack operations' stamp: 'bi 4/26/2021 21:46:10'!
isEmpty

	self subclassResponsibility.! !

!OOStackElement methodsFor: 'complementary stack operations' stamp: 'bi 4/27/2021 20:39:42'!
top
	
	self subclassResponsibility.! !


!classDefinition: #OOStackBaseElement category: 'Stack-Exercise'!
OOStackElement subclass: #OOStackBaseElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackBaseElement methodsFor: 'complementary stack operations' stamp: 'e d r r 4/27/2021 18:23:23'!
amountStackElements
	
	^0.! !

!OOStackBaseElement methodsFor: 'complementary stack operations' stamp: 'bi 4/26/2021 21:47:40'!
isEmpty

	^true! !

!OOStackBaseElement methodsFor: 'complementary stack operations' stamp: 'bi 4/27/2021 21:42:00'!
pop

	self error: OOStack stackEmptyErrorDescription.! !

!OOStackBaseElement methodsFor: 'complementary stack operations' stamp: 'bi 4/27/2021 20:39:51'!
top

	self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #OOStackValueElement category: 'Stack-Exercise'!
OOStackElement subclass: #OOStackValueElement
	instanceVariableNames: 'value next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackValueElement methodsFor: 'initialization' stamp: 'bi 4/26/2021 21:54:01'!
initializeWith: aValue nextTo: aElement

	value := aValue.
	next := aElement.! !


!OOStackValueElement methodsFor: 'accessing' stamp: 'e d r r 4/27/2021 17:28:35'!
getNext
	
	^next.! !

!OOStackValueElement methodsFor: 'accessing' stamp: 'e d r r 4/27/2021 17:35:04'!
getValue
	
	^value.! !


!OOStackValueElement methodsFor: 'complementary stack operations' stamp: 'e d r r 4/27/2021 18:20:32'!
amountStackElements
	
	^1 + self getNext amountStackElements.! !

!OOStackValueElement methodsFor: 'complementary stack operations' stamp: 'bi 4/26/2021 21:58:43'!
isEmpty

	^false.! !

!OOStackValueElement methodsFor: 'complementary stack operations' stamp: 'bi 4/27/2021 20:40:29'!
top
	
	^self getValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackValueElement class' category: 'Stack-Exercise'!
OOStackValueElement class
	instanceVariableNames: ''!

!OOStackValueElement class methodsFor: 'instance creation' stamp: 'bi 4/26/2021 21:55:27'!
with: aValue nextTo: aElement

	^self new initializeWith: aValue nextTo: 	aElement.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'bi 4/28/2021 20:39:22'!
find: aPrefix

	| tempStack prefixCollection|

	(aPrefix = '') ifTrue:[^Error signal: SentenceFinderByPrefix messageEmptyPrefixError].
	('* *' match: aPrefix ) ifTrue:[^Error signal: SentenceFinderByPrefix messageHasEmptySpacesError].

	tempStack _ OOStack new.
	prefixCollection _ OrderedCollection new.
	
	[stack isEmpty not] 
	whileTrue: [| element |
		element _ stack pop.
		tempStack push: element.
		(element beginsWith: aPrefix) 
		ifTrue:[
			prefixCollection add: element.
		].
	].

	[tempStack isEmpty not] 
	whileTrue: [
		stack push: tempStack pop.
	].


	^prefixCollection.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'bi 4/28/2021 20:36:47'!
with: aStack

	stack _ aStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'bi 4/28/2021 20:35:06'!
messageEmptyPrefixError

	^'Prefix cannot be empty'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'bi 4/28/2021 20:35:24'!
messageHasEmptySpacesError

	^'Prefix cannot have empty spaces'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'bi 4/28/2021 20:35:58'!
with: aStack

	^super new with: aStack.! !
