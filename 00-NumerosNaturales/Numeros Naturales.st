!classDefinition: #I category: 'Numeros Naturales'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Numeros Naturales'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'bi 4/7/2021 18:31:59'!
* factor

	^factor ! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 4/5/2021 20:46:25'!
+ unSumando

	^unSumando next! !

!I class methodsFor: 'as yet unclassified' stamp: 'bi 4/7/2021 20:58:47'!
- sustraendo
	
	^self error: self descripcionDeErrorDeNumerosNegativosNoSoportados! !

!I class methodsFor: 'as yet unclassified' stamp: 'bi 4/7/2021 20:58:43'!
descripcionDeErrorDeNumerosNegativosNoSoportados

	^'No puede hacer la resta por un numero mayor'! !

!I class methodsFor: 'as yet unclassified' stamp: 'bi 4/7/2021 19:44:00'!
dividiloPor: divisor

	^divisor! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 4/5/2021 20:31:42'!
next

	^II! !

!I class methodsFor: 'as yet unclassified' stamp: 'e d r r 4/6/2021 18:53:25'!
restaloA: minuendo
	^minuendo previous! !



!classDefinition: #II category: 'Numeros Naturales'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Numeros Naturales'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'bi 4/7/2021 18:51:07'!
* factor
	
	^self previous * factor + factor ! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 4/5/2021 20:56:14'!
+ unSumando

	^self previous + unSumando next! !

!II class methodsFor: 'as yet unclassified' stamp: 'bi 4/7/2021 21:25:27'!
/ divisor
	(self menorA: divisor) ifTrue: [
		self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
		].
	^self - divisor dividiloPor: divisor + 1
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'bi 4/7/2021 21:22:28'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'No se puede dividir por un numero mayor'! !

!II class methodsFor: 'as yet unclassified' stamp: 'bi 4/7/2021 19:37:30'!
dividiloPor: divisor

	^self previous restaloA: divisor previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'bi 4/7/2021 21:33:01'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !

!II class methodsFor: 'as yet unclassified' stamp: 'bi 4/7/2021 20:20:40'!
menorA: divisor

	^ self name size < divisor name size! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 4/5/2021 21:07:59'!
next

	next ifNil:[
		next _ self createChildNamed: self name, 'I'.
		next previous: self.
		].
	^next! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 4/5/2021 20:57:01'!
previous
	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'bi 4/7/2021 21:10:12'!
restaloA: minuendo
	^minuendo previous - self previous! !


!II class methodsFor: 'nil' stamp: 'bi 4/7/2021 20:42:15'!
- sustraendo

	^sustraendo restaloA: self! !


!classDefinition: #III category: 'Numeros Naturales'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'Numeros Naturales'!
III class
	instanceVariableNames: ''!

!III class methodsFor: 'previous' stamp: 'ARM 4/5/2021 21:09:08'!
previous: aNumber
	previous _ aNumber ! !


!III class methodsFor: 'as yet unclassified' stamp: 'bi 4/7/2021 21:33:01'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !


!classDefinition: #IIII category: 'Numeros Naturales'!
III subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: 'Numeros Naturales'!
IIII class
	instanceVariableNames: ''!

!IIII class methodsFor: 'as yet unclassified' stamp: 'bi 4/7/2021 21:33:01'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := III.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!