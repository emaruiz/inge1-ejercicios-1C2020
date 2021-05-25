!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'bi 5/20/2021 20:54:24'!
test01PortfolioHaveZeroAsBalanceWhenCreated 

	| portfolio |
	
	portfolio := Portfolio new.

	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'bi 5/22/2021 20:28:27'!
test02AccountIncreasesPortfolioBalanceValueOfYourTransactions

	| portfolio account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.

	portfolio := Portfolio new.
	portfolio register: account.

	self assert: 100 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'bi 5/22/2021 20:28:21'!
test03PortfolioKnowsRegisteredTransactionsOfYourAccounts

	| account deposit withdraw portfolio |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
	
	portfolio := Portfolio new.
	portfolio register: account.
		
	self assert: (portfolio hasRegistered: deposit).	
	self assert: (portfolio hasRegistered: withdraw).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'bi 5/22/2021 20:28:15'!
test04PortfolioDoNotKnowNotRegisteredTransactionsOfYourAccounts

	| account deposit withdraw portfolio |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw for: 50.
	
	portfolio := Portfolio new.
	portfolio register: account.
		
	self assert: (portfolio hasRegistered: deposit).	
	self deny: (portfolio hasRegistered: withdraw).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'bi 5/24/2021 19:34:34'!
test05AccountBalanceIncreasesPortfolioBalanceValueOfYourTransactions

	| portfolioIn portfolioOut account1 account2 |

	account1 := ReceptiveAccount  new.
	Deposit register: 100 on: account1.
	Deposit register: 50 on: account1.

	portfolioIn := Portfolio new.
	portfolioIn register: account1.

	account2 := ReceptiveAccount  new.
	Deposit register: 50 on: account2.
	
	portfolioOut := Portfolio new.
	portfolioOut register: portfolioIn.
	portfolioOut register: account2.

	self assert: 150 equals: portfolioIn balance.
	self assert: 200 equals: portfolioOut balance.

	Deposit register: 50 on: account1.
	
	self assert: 200 equals: portfolioIn balance.
	self assert: 250 equals: portfolioOut balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'bi 5/22/2021 20:27:59'!
test06PortfolioKnowsRegisteredTransactionsOfYourAccountsAndYourPortfolios

	| portfolioIn portfolioOut account1 account2 depositIn depositOut |

	account1 := ReceptiveAccount  new.
	Deposit register: 100 on: account1.
	depositIn := Deposit register: 50 on: account1.

	portfolioIn := Portfolio new.
	portfolioIn register: account1.

	account2 := ReceptiveAccount  new.
	depositOut := Deposit register: 50 on: account2.
	
	portfolioOut := Portfolio new.
	portfolioOut register: portfolioIn.
	portfolioOut register: account2.
	
	self assert: (portfolioOut hasRegistered: depositOut).	
	self assert: (portfolioOut hasRegistered: depositIn).
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'e d r r 5/23/2021 21:49:14'!
test07CannotInsertARepeatedAccountOfTheSameCollaboratorInPortfolioOfOnlyAccounts

	| account1 account2 portfolio |

	account1 := ReceptiveAccount  new.
	Deposit register: 100 on: account1.
	Deposit register: 50 on: account1.
	
	account2 := ReceptiveAccount  new.
	Deposit register: 200 on: account2.
	
	portfolio := Portfolio new.
	portfolio register: account1.
	portfolio register: account2.
	
	self 
		should: [portfolio register: account2]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio attemptToInsertRepeatedFinancialAssetErrorDescription ].
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'e d r r 5/23/2021 21:50:30'!
test08CannotInsertARepeatedAccountOfTheSameCollaboratorInPortfolioOfAccountsAndPortfolio

	| portfolioIn portfolioOut account1 account2 |

	account1 := ReceptiveAccount  new.
	Deposit register: 200 on: account1.
	
	account2 := ReceptiveAccount  new.
	Deposit register: 100 on: account2.
	Deposit register: 50 on: account2.

	portfolioIn := Portfolio new.
	portfolioIn register: account2.
	
	portfolioOut := Portfolio new.
	portfolioOut register: account1.
	portfolioOut register: portfolioIn.
	
	self 
		should: [portfolioOut register: account2]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio attemptToInsertRepeatedFinancialAssetErrorDescription ].
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'bi 5/24/2021 19:33:38'!
test09CannotInsertARepeatedAccountOfDifferentCollaboratorInPortfolioOfOnlyAccounts

	"| account1 account2 account3 portfolio |

	account1 := ReceptiveAccount  new.
	Deposit register: 100 on: account1.
	Deposit register: 50 on: account1.
	
	account2 := ReceptiveAccount  new.
	Deposit register: 200 on: account2.
	
	account3 := ReceptiveAccount  new.
	Deposit register: 200 on: account3.
	
	portfolio := Portfolio new.
	portfolio register: account1.
	portfolio register: account2.
	
	self 
		should: [portfolio register: account3]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio attemptToInsertRepeatedFinancialAssetErrorDescription ].
"! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'bi 5/24/2021 19:55:19'!
test10

	| account1 account2 deposit1 deposit2 deposit3 portfolio|
	
	account1 := ReceptiveAccount new.
	deposit1 := Deposit register: 50 on: account1.
	
	account2 := ReceptiveAccount new.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 50 on: account2.
		
	portfolio := Portfolio new.
	portfolio register: account1.
	portfolio register: account2.		
	
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).

	self assert: 2 equals: account2 transactions size.
	self assert: (account2 transactions includes: deposit2).
	self assert: (account2 transactions includes: deposit3).
	
	self assert: 3 equals: portfolio transactions size.
	self assert: (portfolio transactions includes: deposit1).	
	self assert: (portfolio transactions includes: deposit2).
	self assert: (portfolio transactions includes: deposit3).
! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/17/2021 17:29:53'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: 'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'bi 5/19/2021 21:33:27'!
addYourValueToTotal: aTotalAmount
	
	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'bi 5/19/2021 21:35:15'!
addYourValueToTotal: aTotalAmount

	^aTotalAmount + self value .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'bi 5/19/2021 21:35:05'!
addYourValueToTotal: aTotalAmount

	^aTotalAmount - self value .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #FinancialAsset category: 'Portfolio-Ejercicio'!
Object subclass: #FinancialAsset
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
FinancialAsset subclass: #Portfolio
	instanceVariableNames: 'financialAssets'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'bi 5/24/2021 20:15:07'!
balance

	^financialAssets sum: [ :aFinancialAsset | aFinancialAsset balance ] ifEmpty: [ 0 ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'bi 5/22/2021 20:28:50'!
hasRegistered: aTransaction

	^financialAssets anySatisfy: [:aFinancialAsset | aFinancialAsset hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'bi 5/22/2021 20:28:44'!
initialize

	financialAssets := OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'bi 5/24/2021 19:43:32'!
register: aFinancialAsset
	
	|copyFinancialAssets|

	copyFinancialAssets := financialAssets copy.
	(self Includes: aFinancialAsset On: copyFinancialAssets) ifTrue: 
		[ self error: Portfolio attemptToInsertRepeatedFinancialAssetErrorDescription ].
	financialAssets add: aFinancialAsset

	! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'bi 5/24/2021 20:13:12'!
transactions 

	| allTransactions |
	
	allTransactions := OrderedCollection new.
	financialAssets do: [:aFinancialAsset | allTransactions addAll: (aFinancialAsset transactions) ].
	^ allTransactions .! !


!Portfolio methodsFor: 'accessing - private' stamp: 'e d r r 5/23/2021 20:45:47'!
getFinancialAssetsCopy
	
	^financialAssets copy ! !


!Portfolio methodsFor: 'explore financial assets - private' stamp: 'e d r r 5/23/2021 20:55:32'!
Includes: aFinancialAssetToInsert On: worklistOfFinancialAssets
	
	| aFinancialAssetExtracted |
	worklistOfFinancialAssets size = 0 ifTrue: [^false].
	
	aFinancialAssetExtracted := worklistOfFinancialAssets removeFirst.
	
	aFinancialAssetExtracted = aFinancialAssetToInsert ifTrue: [^true].
	
	(aFinancialAssetExtracted isKindOf: Portfolio) ifTrue: 
		[worklistOfFinancialAssets addAllLast: aFinancialAssetExtracted getFinancialAssetsCopy].
	
	^self Includes: aFinancialAssetToInsert On: worklistOfFinancialAssets.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'e d r r 5/23/2021 18:56:56'!
attemptToInsertRepeatedFinancialAssetErrorDescription
	
	^'cannot insert a financial asset that is already in the portfolio'! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
FinancialAsset subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'bi 5/19/2021 21:47:31'!
balance

	| value |

	value := 0. transactions do: [:aTransaction | 		value := aTransaction addYourValueToTotal: value ].
	^ value.! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !
