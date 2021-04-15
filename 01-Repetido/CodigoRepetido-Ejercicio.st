!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'asserts' stamp: 'bi 4/14/2021 21:15:57'!
assertNumberOfActive: numActive suspended: numberSuspended andAllCustomers: numberAllCustomers byCustomerBook: customerBook

	self assert: numActive equals: customerBook numberOfActiveCustomers.
	self assert: numberSuspended equals: customerBook numberOfSuspendedCustomers.
	self assert: numberAllCustomers equals: customerBook numberOfCustomers.
! !

!CustomerBookTest methodsFor: 'asserts' stamp: 'bi 4/14/2021 21:37:30'!
assertNumberOfCustomers: aNumber andCustomersNamed: aNameCustomer inCustomerBook: customerBook
	
	self assert: customerBook numberOfCustomers = 1.
	self assert: (customerBook includesCustomerNamed: aNameCustomer)! !


!CustomerBookTest methodsFor: 'auxiliaryMethods' stamp: 'bi 4/14/2021 21:23:50'!
getCustomerBookWithCustomer: aCustomer andSuspendedCustomer: aSuspendedCustomer
	
	| customerBook |
	
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: aCustomer.
	customerBook suspendCustomerNamed: aSuspendedCustomer.
	
	^customerBook ! !

!CustomerBookTest methodsFor: 'auxiliaryMethods' stamp: 'bi 4/14/2021 21:27:25'!
getCustomerBookWithSuspendedCustomer: aCustomer
	
	| customerBook |
	
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: aCustomer.
	customerBook suspendCustomerNamed: aCustomer.
	
	^customerBook ! !

!CustomerBookTest methodsFor: 'auxiliaryMethods' stamp: 'bi 4/14/2021 20:59:43'!
getMeTimeCustomerBookOperation: customerBookOperation
	
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	customerBookOperation value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^(millisecondsAfterRunning-millisecondsBeforeRunning)! !

!CustomerBookTest methodsFor: 'auxiliaryMethods' stamp: 'bi 4/14/2021 20:59:54'!
getMeTimeToCreateTheClient: aClient
	
	| customerBook |

	customerBook := CustomerBook new.	

	^self getMeTimeCustomerBookOperation: [customerBook addCustomerNamed: aClient.].! !

!CustomerBookTest methodsFor: 'auxiliaryMethods' stamp: 'bi 4/14/2021 21:00:05'!
getMeTimeToDeleteNewClient: aClient
	
	| customerBook |
	
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: aClient.
	
	^self getMeTimeCustomerBookOperation: [customerBook removeCustomerNamed: aClient.].! !


!CustomerBookTest methodsFor: 'testing' stamp: 'bi 4/14/2021 20:23:32'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	
	| creationTime |

	creationTime := self getMeTimeToCreateTheClient: 'John Lennon' .
	
	self assert: (creationTime) < (50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'bi 4/14/2021 20:23:26'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	
	| deletedTime |
	
	deletedTime := self getMeTimeToDeleteNewClient: 'Paul McCartney'.
	
	self assert: (deletedTime) < (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'HernanWilkinson 5/9/2012 18:12'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'bi 4/14/2021 21:39:23'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook |
			
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: 'John Lennon'.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assertNumberOfCustomers: 1 andCustomersNamed: 'John Lennon' inCustomerBook: customerBook ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'bi 4/14/2021 21:24:36'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook  := self getCustomerBookWithCustomer: paulMcCartney andSuspendedCustomer: paulMcCartney .
	
	self assertNumberOfActive: 0 suspended: 1 andAllCustomers: 1 byCustomerBook: customerBook.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'bi 4/14/2021 21:24:57'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook  := self getCustomerBookWithCustomer: paulMcCartney andSuspendedCustomer: paulMcCartney .
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertNumberOfActive: 0 suspended: 0 andAllCustomers: 0 byCustomerBook: customerBook.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'bi 4/14/2021 21:38:12'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: 'George Harrison'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assertNumberOfCustomers: 1 andCustomersNamed: johnLennon inCustomerBook: customerBook ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'bi 4/14/2021 21:38:34'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.
	customerBook  := self getCustomerBookWithCustomer: johnLennon andSuspendedCustomer: johnLennon .
	
	[ customerBook suspendCustomerNamed: johnLennon.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assertNumberOfCustomers: 1 andCustomersNamed: johnLennon inCustomerBook: customerBook ]
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'e d r r 4/15/2021 16:46:45'!
removeCustomerNamed: aName 

	(active includes: aName) ifTrue: [^self removeInCollection: active theItem: aName.].
	(suspended includes: aName) ifTrue: [^self removeInCollection: suspended theItem: aName].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'auxiliaryMethods' stamp: 'e d r r 4/15/2021 16:04:51'!
removeInCollection: collection theItem: searchedElement
	1 to: collection size do: 
	[ :index |
		searchedElement = (collection at: index)
			ifTrue: [
				collection removeAt: index.
				^ searchedElement 
			] 
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/12/2021 16:39:13'!
customerAlreadyExistsErrorMessage

	^'customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/12/2021 16:39:09'!
customerCanNotBeEmptyErrorMessage

	^'customer name cannot be empty!!!!!!'! !
