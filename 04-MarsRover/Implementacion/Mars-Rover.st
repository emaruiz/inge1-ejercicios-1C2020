!classDefinition: #MarsRoverTest category: 'Mars-Rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'bi 5/14/2021 21:09:01'!
test01CreationCorrectlyPositionAndCardinalPoint
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $N.
	
	marsRover process: ''.
	
	self assert: (marsRover isAt: 0@0 heding: $N)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'bi 5/14/2021 21:19:25'!
test02IsAtHeadingReturnFalseWhenMarsRoverIsNotInThePositionOfCreation
	
	| marsRover |
	
	marsRover := MarsRover at: 0@1 heading: $N.
	
	marsRover process: ''.
	
	self deny: (marsRover isAt: 0@0 heding: $N)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'bi 5/14/2021 21:20:59'!
test03IsAtHeadingReturnFalseWhenMarsRoverIsNotInTheCardinalPointOfCreation
	
	| marsRover |
	
	marsRover := MarsRover at: 0@1 heading: $S.
	
	marsRover process: ''.
	
	self deny: (marsRover isAt: 0@1 heding: $N)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'bi 5/14/2021 21:21:39'!
test04CannotCreateMarsRoverWithWrongCardinalPoint
	
	
	self 
		should: [MarsRover at: 0@0 heading: $F]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: MarsRover invalidCardinalPointErrorDescription ].! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'e d r r 5/15/2021 18:18:18'!
test05CannotCreateMarsRoverWithWrongYCoordinateOfPosition
	
	
	self 
		should: [MarsRover at: 0@'1' heading: $N]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: MarsRover invalidPositionErrorDescription ].! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'e d r r 5/15/2021 18:18:25'!
test06CannotCreateMarsRoverWithWrongXCoordinateOfPosition
	
	
	| invalidPosition |
	invalidPosition := Point x: '0' y: 1.
	self 
		should: [MarsRover at: invalidPosition heading: $N]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: MarsRover invalidPositionErrorDescription ].! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'e d r r 5/15/2021 18:18:39'!
test07CannotCreateMarsRoverWithWrongPosition
	
	
	self 
		should: [MarsRover at: 01 heading: $N]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: MarsRover invalidPositionErrorDescription ].! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'e d r r 5/16/2021 13:16:20'!
test08CardinalPointNAndCommandFThenMove1PositiveOnYAxis
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $N.
	
	marsRover process: 'f'.
	
	self assert: (marsRover isAt: 0@1 heding: $N)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'e d r r 5/16/2021 13:16:27'!
test09CardinalPointSAndCommandFThenMove1NegativeOnYAxis
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $S.
	
	marsRover process: 'f'.
	
	self assert: (marsRover isAt: 0@-1 heding: $S)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'e d r r 5/16/2021 13:16:34'!
test10CardinalPointOAndCommandFThenMove1NegativeOnXAxis
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $O.
	
	marsRover process: 'f'.
	
	self assert: (marsRover isAt: -1@0 heding: $O)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'e d r r 5/16/2021 13:16:42'!
test11CardinalPointEAndCommandFThenMove1PositiveOnXAxis
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $E.
	
	marsRover process: 'f'.
	
	self assert: (marsRover isAt: 1@0 heding: $E)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'e d r r 5/16/2021 13:19:40'!
test12CardinalPointNAndCommandBThenMove1NegativeOnYAxis
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $N.
	
	marsRover process: 'b'.
	
	self assert: (marsRover isAt: 0@-1 heding: $N)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'e d r r 5/16/2021 13:20:37'!
test13CardinalPointSAndCommandBThenMove1PositiveOnYAxis
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $S.
	
	marsRover process: 'b'.
	
	self assert: (marsRover isAt: 0@1 heding: $S)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'e d r r 5/16/2021 13:21:20'!
test14CardinalPointOAndCommandBThenMove1PositiveOnXAxis
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $O.
	
	marsRover process: 'b'.
	
	self assert: (marsRover isAt: 1@0 heding: $O)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'e d r r 5/16/2021 13:22:15'!
test15CardinalPointEAndCommandBThenMove1NegativeOnXAxis
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $E.
	
	marsRover process: 'b'.
	
	self assert: (marsRover isAt: -1@0 heding: $E)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'bi 5/16/2021 15:31:10'!
test16MarsRoverStopProcessingOnInvalidInstruccion
	
	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: $N.
	
	self 
		should: [marsRover process: 'feb']
		raise: Error
		withExceptionDo: [ :anError | 
						self assert: 	anError messageText equals: MarsRover invalidInstructionErrorDescription .
						self assert: marsRover position = (1@2) .
						self assert: marsRover cardinalPoint = $N .
					].
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'bi 5/16/2021 16:48:28'!
test17CardinalPointNAndCommandLThenRotateLeftToCardinalPointO
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $N.
	
	marsRover process: 'l'.
	
	self assert: (marsRover isAt: 0@0 heding: $O)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'bi 5/16/2021 16:48:38'!
test18CardinalPointSAndCommandLThenRotateLeftToCardinalPointE
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $S.
	
	marsRover process: 'l'.
	
	self assert: (marsRover isAt: 0@0 heding: $E)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'bi 5/16/2021 16:48:46'!
test19CardinalPointOAndCommandLThenRotateLeftToCardinalPointS
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $O.
	
	marsRover process: 'l'.
	
	self assert: (marsRover isAt: 0@0 heding: $S)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'bi 5/16/2021 16:48:53'!
test20CardinalPointEAndCommandLThenRotateLeftToCardinalPointN
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $E.
	
	marsRover process: 'l'.
	
	self assert: (marsRover isAt: 0@0 heding: $N)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'bi 5/16/2021 16:48:01'!
test21CardinalPointNAndCommandRThenRotateRightToCardinalPointE
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $N.
	
	marsRover process: 'r'.
	
	self assert: (marsRover isAt: 0@0 heding: $E)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'bi 5/16/2021 16:47:31'!
test22CardinalPointSAndCommandRThenRotateRightToCardinalPointO
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $S.
	
	marsRover process: 'r'.
	
	self assert: (marsRover isAt: 0@0 heding: $O)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'bi 5/16/2021 16:49:33'!
test23CardinalPointOAndCommandRThenRotateRightToCardinalPointN
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $O.
	
	marsRover process: 'r'.
	
	self assert: (marsRover isAt: 0@0 heding: $N)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'bi 5/16/2021 16:52:14'!
test24CardinalPointEAndCommandRThenRotateRightToCardinalPointS
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $E.
	
	marsRover process: 'r'.
	
	self assert: (marsRover isAt: 0@0 heding: $S)! !


!classDefinition: #MarsRover category: 'Mars-Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRover methodsFor: 'comparing' stamp: 'bi 5/16/2021 21:28:24'!
isAt: aPosition heding: aCardinalPoint 
	
	^position = aPosition and: [self cardinalPoint = aCardinalPoint ].
	"^position = aPosition and: [cardinalPoint = aCardinalPoint ]."! !


!MarsRover methodsFor: 'operations' stamp: 'bi 5/16/2021 16:10:42'!
moveOnXAxis: aValueX

	position :=  (position x + aValueX) @ (position y)! !

!MarsRover methodsFor: 'operations' stamp: 'bi 5/16/2021 16:11:02'!
moveOnYAxis: aValueY

	position :=  (position x) @ (position y  + aValueY )! !

!MarsRover methodsFor: 'operations' stamp: 'bi 5/17/2021 15:49:10'!
process: aProcess

	aProcess do: [:s | 
		self assertInstructionValid: s.
		($f = s) ifTrue: [
			($N = self cardinalPoint ) ifTrue: [ self moveOnYAxis: 1] .
			($S = self cardinalPoint) ifTrue: [ self moveOnYAxis: -1] .
			($O = self cardinalPoint) ifTrue: [ self moveOnXAxis: -1] .
			($E = self cardinalPoint) ifTrue: [ self moveOnXAxis: 1] .
		].
		($b = s) ifTrue: [
			($N = self cardinalPoint) ifTrue: [ self moveOnYAxis: -1] .
			($S = self cardinalPoint) ifTrue: [ self moveOnYAxis: 1] .
			($O = self cardinalPoint) ifTrue: [ self moveOnXAxis: 1] .
			($E = self cardinalPoint) ifTrue: [ self moveOnXAxis: -1] .
		].
		($l = s) ifTrue: [
			cardinalPoint := cardinalPoint cardinalPointToYourLeft .
		].
		($r = s) ifTrue: [
			cardinalPoint := cardinalPoint cardinalPointToYourRight .
		].
	].! !


!MarsRover methodsFor: 'accessing' stamp: 'bi 5/16/2021 21:16:11'!
cardinalPoint

	^cardinalPoint cardinalPointCharacter! !

!MarsRover methodsFor: 'accessing' stamp: 'bi 5/16/2021 15:07:49'!
position

	^position! !


!MarsRover methodsFor: 'assertions' stamp: 'bi 5/16/2021 15:30:12'!
assertInstructionValid: aInstruction
	
	(#($f $b $l $r) includes: aInstruction) ifFalse: [self error: MarsRover invalidInstructionErrorDescription ].! !


!MarsRover methodsFor: 'initialization' stamp: 'bi 5/14/2021 20:18:00'!
initializeAt: aPosition heading: aCardinalPoint 

	position := aPosition.
	cardinalPoint := aCardinalPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Mars-Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'message assertions' stamp: 'bi 5/14/2021 21:33:50'!
invalidCardinalPointErrorDescription
	
	^'aCardinalPoint not valid'! !

!MarsRover class methodsFor: 'message assertions' stamp: 'bi 5/16/2021 15:29:04'!
invalidInstructionErrorDescription
	
	^'aInstruction not valid'! !

!MarsRover class methodsFor: 'message assertions' stamp: 'e d r r 5/15/2021 17:00:57'!
invalidPositionErrorDescription
	
	^'aPosition not valid'! !


!MarsRover class methodsFor: 'assertions' stamp: 'bi 5/15/2021 19:06:28'!
assertCardinalPointValid: aCardinalPoint
	
	(#($N $S $E $O) includes: aCardinalPoint) ifFalse: [self error: self invalidCardinalPointErrorDescription ].! !

!MarsRover class methodsFor: 'assertions' stamp: 'bi 5/15/2021 19:01:53'!
assertPositionCoordinatesIsIntenger: aPosition
	
	(aPosition x isInteger and: aPosition y isInteger) ifFalse: [self error: self invalidPositionErrorDescription].! !

!MarsRover class methodsFor: 'assertions' stamp: 'bi 5/15/2021 18:53:08'!
assertPositionIsAPoint: aPosition
	
	aPosition isPoint ifFalse: [self error: self invalidPositionErrorDescription].! !


!MarsRover class methodsFor: 'initialize' stamp: 'bi 5/16/2021 20:51:26'!
at: aPosition heading: aCardinalPoint 
	
	self assertPositionIsAPoint: aPosition .
	self assertPositionCoordinatesIsIntenger: aPosition .
	self assertCardinalPointValid: aCardinalPoint .

	^self new initializeAt: aPosition heading: (self getClassCardinalPoint: aCardinalPoint)
	"^self new initializeAt: aPosition heading: aCardinalPoint"
! !

!MarsRover class methodsFor: 'initialize' stamp: 'bi 5/16/2021 20:56:57'!
getClassCardinalPoint: aCardinalPoint 
	
	aCardinalPoint = $N ifTrue: [ ^NCardinalPoint for: self ].
	aCardinalPoint = $S ifTrue: [ ^SCardinalPoint for: self ].
	aCardinalPoint = $O ifTrue: [ ^OCardinalPoint for: self ].
	aCardinalPoint = $E ifTrue: [ ^ECardinalPoint for: self ].

! !


!classDefinition: #MarsRoverCardinalPoint category: 'Mars-Rover'!
Object subclass: #MarsRoverCardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverCardinalPoint methodsFor: 'inquiries' stamp: 'bi 5/16/2021 21:11:05'!
cardinalPointCharacter

	self subclassResponsibility .! !

!MarsRoverCardinalPoint methodsFor: 'inquiries' stamp: 'bi 5/16/2021 20:39:45'!
cardinalPointToYourLeft

	self subclassResponsibility .! !

!MarsRoverCardinalPoint methodsFor: 'inquiries' stamp: 'bi 5/16/2021 20:39:54'!
cardinalPointToYourRight

	self subclassResponsibility .! !


!MarsRoverCardinalPoint methodsFor: 'initialization' stamp: 'bi 5/16/2021 17:15:52'!
initializeWith: aMarsRover

	marsRover := aMarsRover! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCardinalPoint class' category: 'Mars-Rover'!
MarsRoverCardinalPoint class
	instanceVariableNames: ''!

!MarsRoverCardinalPoint class methodsFor: 'as yet unclassified' stamp: 'bi 5/17/2021 14:22:36'!
for: aMarsRover

	^self new initializeWith: aMarsRover .! !


!classDefinition: #ECardinalPoint category: 'Mars-Rover'!
MarsRoverCardinalPoint subclass: #ECardinalPoint
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!ECardinalPoint methodsFor: 'as yet unclassified' stamp: 'bi 5/16/2021 21:11:39'!
cardinalPointCharacter

	^$E.! !

!ECardinalPoint methodsFor: 'as yet unclassified' stamp: 'bi 5/17/2021 15:47:36'!
cardinalPointToYourLeft

	^NCardinalPoint new initializeWith: marsRover.! !

!ECardinalPoint methodsFor: 'as yet unclassified' stamp: 'bi 5/17/2021 15:47:45'!
cardinalPointToYourRight

	^SCardinalPoint new initializeWith: marsRover.! !


!classDefinition: #NCardinalPoint category: 'Mars-Rover'!
MarsRoverCardinalPoint subclass: #NCardinalPoint
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!NCardinalPoint methodsFor: 'as yet unclassified' stamp: 'bi 5/16/2021 21:11:51'!
cardinalPointCharacter

	^$N.! !

!NCardinalPoint methodsFor: 'as yet unclassified' stamp: 'bi 5/17/2021 15:47:54'!
cardinalPointToYourLeft

	^OCardinalPoint new initializeWith: marsRover.! !

!NCardinalPoint methodsFor: 'as yet unclassified' stamp: 'bi 5/17/2021 15:48:00'!
cardinalPointToYourRight

	^ECardinalPoint new initializeWith: marsRover.! !


!classDefinition: #OCardinalPoint category: 'Mars-Rover'!
MarsRoverCardinalPoint subclass: #OCardinalPoint
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!OCardinalPoint methodsFor: 'as yet unclassified' stamp: 'bi 5/16/2021 21:12:01'!
cardinalPointCharacter

	^$O.! !

!OCardinalPoint methodsFor: 'as yet unclassified' stamp: 'bi 5/17/2021 15:48:08'!
cardinalPointToYourLeft

	^SCardinalPoint new initializeWith: marsRover.! !

!OCardinalPoint methodsFor: 'as yet unclassified' stamp: 'bi 5/17/2021 15:48:13'!
cardinalPointToYourRight

	^NCardinalPoint new initializeWith: marsRover.! !


!classDefinition: #SCardinalPoint category: 'Mars-Rover'!
MarsRoverCardinalPoint subclass: #SCardinalPoint
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!SCardinalPoint methodsFor: 'as yet unclassified' stamp: 'bi 5/16/2021 21:12:10'!
cardinalPointCharacter

	^$S.! !

!SCardinalPoint methodsFor: 'as yet unclassified' stamp: 'bi 5/17/2021 15:48:21'!
cardinalPointToYourLeft

	^ECardinalPoint new initializeWith: marsRover.! !

!SCardinalPoint methodsFor: 'as yet unclassified' stamp: 'bi 5/17/2021 15:48:27'!
cardinalPointToYourRight

	^OCardinalPoint new initializeWith: marsRover.! !
