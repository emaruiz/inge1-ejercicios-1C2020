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

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
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


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'bi 4/26/2021 21:44:52'!
initialize
	
	top := OOStackBaseElement new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'bi 4/26/2021 21:45:33'!
isEmpty
	
	^top isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'bi 4/27/2021 21:39:28'!
pop
	
	
	"value := top getValue.
	top := top getNext.
	^value."
	
	"^top pop"
	
	| value |
	value := top top.
	top := top getNext.
	^value.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'bi 4/26/2021 21:57:47'!
push: elem
	
	top := OOStackValueElement with: elem nextTo: top.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'e d r r 4/27/2021 18:43:06'!
size
	
	^top amountStackElements.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'bi 4/27/2021 20:39:32'!
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

!OOStackElement methodsFor: 'as yet unclassified' stamp: 'bi 4/26/2021 21:46:10'!
isEmpty

	self subclassResponsibility.! !

!OOStackElement methodsFor: 'as yet unclassified' stamp: 'bi 4/27/2021 20:39:42'!
top
	
	self subclassResponsibility.! !


!classDefinition: #OOStackBaseElement category: 'Stack-Exercise'!
OOStackElement subclass: #OOStackBaseElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackBaseElement methodsFor: 'as yet unclassified' stamp: 'e d r r 4/27/2021 18:23:23'!
amountStackElements
	
	^0.! !

!OOStackBaseElement methodsFor: 'as yet unclassified' stamp: 'bi 4/26/2021 21:47:40'!
isEmpty

	^true! !

!OOStackBaseElement methodsFor: 'as yet unclassified' stamp: 'bi 4/27/2021 21:42:00'!
pop

	self error: OOStack stackEmptyErrorDescription.! !

!OOStackBaseElement methodsFor: 'as yet unclassified' stamp: 'bi 4/27/2021 20:39:51'!
top

	self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #OOStackValueElement category: 'Stack-Exercise'!
OOStackElement subclass: #OOStackValueElement
	instanceVariableNames: 'value next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackValueElement methodsFor: 'as yet unclassified' stamp: 'e d r r 4/27/2021 18:20:32'!
amountStackElements
	
	^1 + self getNext amountStackElements.! !

!OOStackValueElement methodsFor: 'as yet unclassified' stamp: 'e d r r 4/27/2021 17:28:35'!
getNext
	
	^next.! !

!OOStackValueElement methodsFor: 'as yet unclassified' stamp: 'e d r r 4/27/2021 17:35:04'!
getValue
	
	^value.! !

!OOStackValueElement methodsFor: 'as yet unclassified' stamp: 'bi 4/26/2021 21:54:01'!
initializeWith: aValue nextTo: aElement

	value := aValue.
	next := aElement.! !

!OOStackValueElement methodsFor: 'as yet unclassified' stamp: 'bi 4/26/2021 21:58:43'!
isEmpty

	^false.! !

!OOStackValueElement methodsFor: 'as yet unclassified' stamp: 'bi 4/27/2021 20:40:29'!
top
	
	^self getValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackValueElement class' category: 'Stack-Exercise'!
OOStackValueElement class
	instanceVariableNames: ''!

!OOStackValueElement class methodsFor: 'as yet unclassified' stamp: 'bi 4/26/2021 21:55:27'!
with: aValue nextTo: aElement

	^self new initializeWith: aValue nextTo: 	aElement.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
