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

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'bi 5/15/2021 19:51:24'!
test08
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $N.
	
	marsRover process: 'f'.
	
	self assert: (marsRover isAt: 0@1 heding: $N)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'bi 5/15/2021 20:39:29'!
test09
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $S.
	
	marsRover process: 'f'.
	
	self assert: (marsRover isAt: 0@-1 heding: $S)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'bi 5/15/2021 20:39:13'!
test10
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $O.
	
	marsRover process: 'f'.
	
	self assert: (marsRover isAt: -1@0 heding: $O)! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'bi 5/15/2021 20:41:22'!
test11
	
	| marsRover |
	
	marsRover := MarsRover at: 0@0 heading: $E.
	
	marsRover process: 'f'.
	
	self assert: (marsRover isAt: 1@0 heding: $E)! !


!classDefinition: #MarsRover category: 'Mars-Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'bi 5/14/2021 20:19:18'!
isAt: aPosition heding: aCardinalPoint 
	
	^position = aPosition and: [cardinalPoint = aCardinalPoint ].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'bi 5/15/2021 20:41:59'!
process: aProcess

	aProcess do: [:s | 
		($f = s) ifTrue: [
			($N = cardinalPoint) ifTrue: [
				position :=  (position x) @ (position y + 1)
			].
			($S = cardinalPoint) ifTrue: [
				position :=  (position x) @ (position y - 1)
			].
			($O = cardinalPoint) ifTrue: [
				position :=  (position x - 1) @ (position y)
			].
			($E = cardinalPoint) ifTrue: [
				position :=  (position x + 1) @ (position y)
			].
		].
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
