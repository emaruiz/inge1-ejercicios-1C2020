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


!classDefinition: #MarsRover category: 'Mars-Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'e d r r 5/16/2021 12:56:58'!
cardinalEMoveOnXAxis: aValueX

	($E = cardinalPoint) ifTrue: [
		position :=  (position x + aValueX) @ (position y)
	]! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'e d r r 5/16/2021 12:40:40'!
cardinalNMoveOnYAxis: aValueY

	($N = cardinalPoint) ifTrue: [
		position :=  (position x) @ (position y + aValueY)
	]! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'e d r r 5/16/2021 12:53:14'!
cardinalOMoveOnXAxis: aValueX

	($O = cardinalPoint) ifTrue: [
		position :=  (position x + aValueX) @ (position y)
	]! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'e d r r 5/16/2021 12:45:59'!
cardinalSMoveOnYAxis: aValueY

	($S = cardinalPoint) ifTrue: [
		position :=  (position x) @ (position y + aValueY)
	]! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'bi 5/14/2021 20:19:18'!
isAt: aPosition heding: aCardinalPoint 
	
	^position = aPosition and: [cardinalPoint = aCardinalPoint ].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'e d r r 5/16/2021 12:57:11'!
process: aProcess

	aProcess do: [:s | 
		($f = s) ifTrue: [
			self cardinalNMoveOnYAxis: 1.
			self cardinalSMoveOnYAxis: -1.
			self cardinalOMoveOnXAxis: -1.
			self cardinalEMoveOnXAxis: 1.
		].
		($b = s) ifTrue: [
			self cardinalNMoveOnYAxis: -1.
			self cardinalSMoveOnYAxis: 1.
			self cardinalOMoveOnXAxis: 1.
			self cardinalEMoveOnXAxis: -1.
		]
	].! !


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


!MarsRover class methodsFor: 'initialize' stamp: 'bi 5/15/2021 19:11:12'!
at: aPosition heading: aCardinalPoint 
	
	self assertPositionIsAPoint: aPosition .
	self assertPositionCoordinatesIsIntenger: aPosition .
	self assertCardinalPointValid: aCardinalPoint .

	^MarsRover new initializeAt: aPosition heading: aCardinalPoint
! !
