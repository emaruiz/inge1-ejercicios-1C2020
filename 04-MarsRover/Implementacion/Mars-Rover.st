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

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'bi 5/14/2021 21:49:41'!
test05
	
	
	"chequear que position sea de tipo Point y que sus coordenadas sean de tipo Integer
	(0@1) y isInteger
	"! !


!classDefinition: #MarsRover category: 'Mars-Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'bi 5/14/2021 20:19:18'!
isAt: aPosition heding: aCardinalPoint 
	
	^position = aPosition and: [cardinalPoint = aCardinalPoint ].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'bi 5/14/2021 20:09:39'!
process: aProcess
! !


!MarsRover methodsFor: 'initialization' stamp: 'bi 5/14/2021 20:18:00'!
initializeAt: aPosition heading: aCardinalPoint 

	position := aPosition.
	cardinalPoint := aCardinalPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Mars-Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'assertions' stamp: 'bi 5/14/2021 21:33:50'!
invalidCardinalPointErrorDescription
	
	^'aCardinalPoint not valid'! !


!MarsRover class methodsFor: 'initialize' stamp: 'bi 5/14/2021 21:34:25'!
at: aPosition heading: aCardinalPoint 
	
	( #($N $S $E $O) includes: aCardinalPoint ) 
	ifTrue: [
		^MarsRover new initializeAt: aPosition heading: aCardinalPoint
		] 
	ifFalse: 
		[
			self error: self invalidCardinalPointErrorDescription 
		].! !
