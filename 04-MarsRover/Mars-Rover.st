!classDefinition: #MarsRoverTest category: 'Mars-Rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'e d r r 5/13/2021 22:01:39'!
test01
	
	"|marsrover|
	marsrover := MarsRover startAt:0@0.
	self assert: marsrover isAt:0@0."! !
