!classDefinition: #NumeroTest category: 'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 4/15/2021 16:45:35'!
test27EnteroSubstractsEnteroCorrectly

	self assert: four - one equals: three! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:02'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!!!!!'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:09'!
invalidNumberTypeErrorDescription
	
	^ 'Tipo de número inválido!!!!!!'! !


!classDefinition: #Entero category: 'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'complementary arithmetic operations' stamp: 'e d r r 4/22/2021 15:56:38'!
addEntero: enteroAdder
	
	^self class with: enteroAdder integerValue + self integerValue.! !

!Entero methodsFor: 'complementary arithmetic operations' stamp: 'e d r r 4/21/2021 13:46:14'!
addFraccion: aFracionAdder
	
	| newNumerator newDenominator |
	newNumerator := aFracionAdder numerator + aFracionAdder denominator * self.
	newDenominator := aFracionAdder denominator.
	^newNumerator / newDenominator.! !

!Entero methodsFor: 'complementary arithmetic operations' stamp: 'bi 4/20/2021 20:50:45'!
divideEntero: enteroDivided

	^Fraccion with: enteroDivided over: self.! !

!Entero methodsFor: 'complementary arithmetic operations' stamp: 'e d r r 4/21/2021 16:08:10'!
divideFraccion: fraccionDivided
	
	^fraccionDivided numerator / (fraccionDivided denominator * self).! !

!Entero methodsFor: 'complementary arithmetic operations' stamp: 'e d r r 4/22/2021 15:57:08'!
multiplyEntero: enteroMultied

	^self class with: enteroMultied integerValue * self integerValue.! !

!Entero methodsFor: 'complementary arithmetic operations' stamp: 'e d r r 4/21/2021 14:07:06'!
multiplyFraccion: aFraccionMultiplier
	
	^aFraccionMultiplier numerator * self / aFraccionMultiplier denominator.! !

!Entero methodsFor: 'complementary arithmetic operations' stamp: 'e d r r 4/22/2021 15:57:16'!
subtractedFromEntero: enteroSubstracted

	 ^self class with: enteroSubstracted integerValue - self integerValue.! !

!Entero methodsFor: 'complementary arithmetic operations' stamp: 'e d r r 4/21/2021 15:57:00'!
subtractedFromFraccion: fraccionSubstracted
	
	| newNumerator newDenominator |
	
	newNumerator := fraccionSubstracted numerator - fraccionSubstracted denominator * self.
	newDenominator := fraccionSubstracted denominator.
	^newNumerator / newDenominator.! !


!Entero methodsFor: 'arithmetic operations' stamp: 'bi 4/20/2021 20:43:12'!
* aMultiplier 
	
	^aMultiplier multiplyEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'e d r r 4/21/2021 13:58:18'!
+ anAdder 
	
	^anAdder addEntero: self.
	
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'bi 4/20/2021 21:10:47'!
- aSubtrahend 
	
	^aSubtrahend subtractedFromEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'bi 4/20/2021 21:10:04'!
/ aDivisor 
	
	^aDivisor divideEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'e d r r 4/22/2021 15:58:26'!
// aDivisor 
	
	^self class with: self integerValue // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'e d r r 4/22/2021 16:16:37'!
fibonacci

	self subclassResponsibility
	"| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	self isNegative ifTrue: [self error: Entero negativeFibonacciErrorDescription ].	
	(self isZero or: [self isOne]) ifTrue: [^one].
	
	^ (self - one) fibonacci + (self - two) fibonacci"
		! !

!Entero methodsFor: 'arithmetic operations' stamp: 'e d r r 4/22/2021 15:58:55'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (self integerValue gcd: anEntero integerValue)! !


!Entero methodsFor: 'comparing' stamp: 'e d r r 4/22/2021 15:59:19'!
= anObject

	^(anObject isKindOf: self class) and: [ self integerValue = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'e d r r 4/22/2021 15:59:31'!
hash

	^self integerValue hash! !


!Entero methodsFor: 'value' stamp: 'bi 4/21/2021 21:39:22'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	"^value"
	self subclassResponsibility! !


!Entero methodsFor: 'printing' stamp: 'e d r r 4/22/2021 16:00:26'!
printOn: aStream

	aStream print: self integerValue ! !


!Entero methodsFor: 'testing' stamp: 'e d r r 4/22/2021 16:00:33'!
isNegative
	
	^self integerValue < 0! !

!Entero methodsFor: 'testing' stamp: 'e d r r 4/22/2021 16:00:39'!
isOne
	
	^self integerValue = 1! !

!Entero methodsFor: 'testing' stamp: 'e d r r 4/22/2021 16:00:42'!
isZero
	
	^self integerValue = 0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/15/2021 16:42:24'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos!!!!!!'! !

!Entero class methodsFor: 'instance creation' stamp: 'bi 4/21/2021 22:03:04'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	"^self new initalizeWith: aValue"
	
	(aValue < 0) ifTrue:[^Negativo new initializeWith: aValue].
	(aValue = 0) ifTrue:[^Cero new initialize].
	(aValue = 1) ifTrue:[^Uno new initialize].
	(aValue > 1) ifTrue:[^MayorQueUno new initializeWith: aValue].

	^self error: 'aValue no valido'! !


!classDefinition: #Cero category: 'Numero-Exercise'!
Entero subclass: #Cero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Cero methodsFor: 'value' stamp: 'bi 4/21/2021 21:42:29'!
integerValue

	^value! !


!Cero methodsFor: 'initialization' stamp: 'bi 4/21/2021 22:01:36'!
initialize

	value := 0.! !


!Cero methodsFor: 'arithmetic operations' stamp: 'e d r r 4/22/2021 16:23:37'!
fibonacci
	
	| one |
	
	one := Entero with: 1.
	^one! !


!classDefinition: #MayorQueUno category: 'Numero-Exercise'!
Entero subclass: #MayorQueUno
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!MayorQueUno methodsFor: 'initialization' stamp: 'bi 4/21/2021 22:12:27'!
initializeWith: aValue 
	
	value := aValue! !


!MayorQueUno methodsFor: 'value' stamp: 'bi 4/21/2021 21:42:55'!
integerValue

	^value! !


!MayorQueUno methodsFor: 'arithmetic operations' stamp: 'e d r r 4/22/2021 16:24:48'!
fibonacci
	
	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci! !


!classDefinition: #Negativo category: 'Numero-Exercise'!
Entero subclass: #Negativo
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Negativo methodsFor: 'initialization' stamp: 'bi 4/21/2021 22:12:55'!
initializeWith: aValue 
	
	value := aValue! !


!Negativo methodsFor: 'value' stamp: 'bi 4/21/2021 21:43:23'!
integerValue

	^value! !


!Negativo methodsFor: 'arithmetic operations' stamp: 'e d r r 4/22/2021 16:23:01'!
fibonacci
	
	self error: Entero negativeFibonacciErrorDescription.	! !


!classDefinition: #Uno category: 'Numero-Exercise'!
Entero subclass: #Uno
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Uno methodsFor: 'value' stamp: 'bi 4/21/2021 21:43:34'!
integerValue

	^value! !


!Uno methodsFor: 'initialization' stamp: 'bi 4/21/2021 22:02:10'!
initialize

	value := 1.! !


!Uno methodsFor: 'arithmetic operations' stamp: 'e d r r 4/22/2021 16:23:42'!
fibonacci
	
	| one |
	
	one := Entero with: 1.
	^one! !


!classDefinition: #Fraccion category: 'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'e d r r 4/21/2021 14:12:48'!
* aMultiplier 
	
	^aMultiplier multiplyFraccion: self.
	
	
	
	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'e d r r 4/21/2021 13:57:35'!
+ anAdder 
	
	^anAdder addFraccion: self. 
	
	
	
	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'e d r r 4/21/2021 16:00:06'!
- aSubtrahend 
	
	^aSubtrahend subtractedFromFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'e d r r 4/21/2021 16:10:31'!
/ aDivisor 
	
	^aDivisor divideFraccion: self.! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'complementary arithmetic operations' stamp: 'bi 4/20/2021 21:09:25'!
addEntero: enteroAdder

	^enteroAdder * denominator + numerator / denominator.! !

!Fraccion methodsFor: 'complementary arithmetic operations' stamp: 'e d r r 4/21/2021 13:53:54'!
addFraccion: aFracionAdder
	
	| newNumerator newDenominator |
	newNumerator := (aFracionAdder numerator * denominator) + (aFracionAdder denominator * numerator).
	newDenominator := aFracionAdder denominator * denominator.
	^newNumerator / newDenominator.	! !

!Fraccion methodsFor: 'complementary arithmetic operations' stamp: 'bi 4/20/2021 21:09:18'!
divideEntero: enteroDivided

	^Fraccion with: enteroDivided * denominator over: numerator.! !

!Fraccion methodsFor: 'complementary arithmetic operations' stamp: 'e d r r 4/21/2021 16:10:07'!
divideFraccion: fraccionDivided
	
	^(fraccionDivided numerator * denominator) / (fraccionDivided denominator * numerator).! !

!Fraccion methodsFor: 'complementary arithmetic operations' stamp: 'bi 4/20/2021 20:44:29'!
multiplyEntero: enteroMultied

	^enteroMultied * numerator / denominator.! !

!Fraccion methodsFor: 'complementary arithmetic operations' stamp: 'e d r r 4/21/2021 14:11:26'!
multiplyFraccion: aFraccionMultiplier
	
	^(aFraccionMultiplier numerator * numerator) / (aFraccionMultiplier denominator *  denominator).! !

!Fraccion methodsFor: 'complementary arithmetic operations' stamp: 'bi 4/20/2021 20:35:01'!
subtractedFromEntero: enteroSubstracted

	^enteroSubstracted * denominator - numerator / denominator.! !

!Fraccion methodsFor: 'complementary arithmetic operations' stamp: 'e d r r 4/21/2021 15:58:22'!
subtractedFromFraccion: fraccionSubstracted
	
	| newNumerator newDenominator |
	
	newNumerator := (fraccionSubstracted numerator * denominator) - (fraccionSubstracted denominator * numerator).
	newDenominator := fraccionSubstracted denominator * denominator.
	^newNumerator / newDenominator.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'NR 9/23/2018 23:45:19'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
