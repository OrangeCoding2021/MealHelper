###########################################################
### Title: Meal Helper
### Name: OrangeCoding2021
### Date: 5/5/2022
### Purpose: Meal Helper is the author's final project for
### CSC 2200. It acts as a small program to store a
### limited number of items in a user's pantry and allows
### multiple "users" to use the program and make meals.
### Multiple calculations and changes are able to be
### used as well to make the program more useful.
### Because of limitations, numbers calculated are
### truncated.


###########################################################


.data
	# Intro
	introduction: .asciiz "Welcome to Meal Helper !!!\n\nPlease enter a username. Then enter a calorie goal for today.\n\nThen enter the PIN number corresponding to your user."
	intro2: .asciiz "\nBefore selecting Make A Meal,\nit might be a good idea to go to Pantry Menu!"
	intro3: .asciiz "\nFrom there, you can access the Item Sub Menu allowing you to add items to the pantry!"
	intro4: .asciiz "\nAfter adding items to the pantry, \nyou can use the other menu options to display interesting data or to make a meal."
	logins: .asciiz "\nUser Number | Pin code\n\nUser 1: 1234\nUser 2: 4321\nUser 3: 5678\nUser 4: 8765\nUser 5: 1001\n"


	# Menus

	menuMain: .asciiz "\nMain Menu: \n1. Pantry Menu\n2. Make A Meal\n3. User Menu\n4. Exit Meal Helper\nEnter 1-4: "
	
	menuPantry: .asciiz "\nPantry Menu:\n1. Item Sub Menu\n2. Display Pantry\n3. Main Menu\nEnter 1-3: "
	menuItem: .asciiz "\nItem Sub Menu:\n1. Add or Overwrite Items to the Pantry\n2. Change stock of an item\n3. Display Item Calories\n4. Pantry Menu\nEnter 1-4: "
	userMenuDisplay: .asciiz "\n1. Change username\n2. Display User Data\n3. Edit User Data (Log in again and deletes current calorie intake and goal!!)\n4. Main Menu\nEnter 1-4: "

	# Make a Meal Related Text and buffers
	mealInstructions: .asciiz "Chose meal:\n"
	
	mealHowMany: .asciiz "\nEnter how many of this item to add: "
	mealChoice: .asciiz "\nEnter 1 to 3 to chose what meal slot to store a name in\n "	
	mealNameAsk: .asciiz "\nAfter you enter a meal name, \nfeel free to copy the info and save it somewhere if you want! \nEnter a meal name: "
	meal1: .space 60
	next1: .asciiz "\n2. "
	next2: .asciiz "\n3. "
	meal2: .space 60
	meal3: .space 60
	howMany1: .asciiz "Enter how many of item 1 to use: "
	howMany2: .asciiz "Enter how many of item 2 to use: "
	howMany3: .asciiz "Enter how many of item 3 to use: "
	item1Counts: .asciiz "\nAmount of item 1: "
	item2Counts: .asciiz "\nAmount of item 2: "
	item3Counts: .asciiz "\nAmount of item 3: "
	caloriesInMeal: .asciiz "\nCalories in meal: "
	mealTitle: .asciiz "\n Meal title: "
	mealDispSEPERATE: .asciiz "\n======================================\n"
	meal: .asciiz "\nMeal: "
	noMoreMeals: .asciiz "\nSorry, only 10 meals per program run allowed.\n"
	


	# User Menu Related text
	usernameBuffer: .space 60
	users: .asciiz "\nEnter 1 to 5 for which user number to log into: "
	passwordAsk: .asciiz "\nEnter 4 digit pin code: "
	

	
	newUserReq: .asciiz "\nEnter new username: "
	
	userDisplayName: .asciiz "\nYour name is: "
	userDisplayId: .asciiz "\nYour id is: "
	mealsMadeDisplay: .asciiz "\nMeals made: "
	calorieCountDisplay: .asciiz "\nCalorie Goal Reached So Far (%): "
	calorieGoalInput: .asciiz "Input today's calorie goal: "

	# Pantry and Item Menu Related Text
	pantry1: .space 60
	pantry2: .space 60
	pantry3: .space 60
	howManyItems: .asciiz "How many items: "
	itemNameReq: .asciiz "\nEnter new item name: "
	caloriesAre: .asciiz "\nCalories: "
	calRequest: .asciiz "\nEnter calories: "
	pantryPrePrint: .asciiz "\nPantry:\n1."
	howItemEdit: .asciiz "\n1. Name 2. Count 3. Calories\n"
	whichItemEdit: .asciiz "\nEnter item number to edit: "
	itemNumReq: .asciiz "\nEnter the item number: "
	percentageEnter: .asciiz "\nEnter percentage in integer form. Example: Enter 150% or 1.5x as 150: "
	preCalCount: .asciiz "\nEnter calorie count: "
	itemSelect: .asciiz "\nEnter 1-3 to select a item slot: "
	changeCount: .asciiz "\nChange count \n"
	totalOrPercentage: .asciiz "\nEnter 2 for percentage or 1 for complete total (item count * cal count): "
	enterNewNum: .asciiz "\nEnter new number: "
	pantryDisplayStart: .asciiz "\n======================\nPantry Display\nItem Name\nNum of items\nCalories\n======================\n1."
	itemMsg: .asciiz "\nItem Count: "
	calMsg: .asciiz "\nCal Count: "
	userMsg: .asciiz "\nUser: "
	moreItem1: .asciiz "\nYou will need more of Item 1 if you try making this meal!\nSetting item 1 count to 0."
	moreItem2: .asciiz "\nYou will need more of Item 2 if you try making this meal!\nSetting item 2 count to 0."
	moreItem3: .asciiz "\nYou will need more of Item 3 if you try making this meal!\nSetting item 3 count to 0."
	removeItems: .asciiz "\nWould you like to remove items this meal uses from the pantry item counts?\nEnter 1 for yes 2 for no: "

	

	# Ending
	goodbye: .asciiz "\n Goodbye! Thank you for using meal helper!"

	# Errors
	invalidInput: .asciiz "\nSorry, that is invalid input\n"



.text


main:
	
	
	# Welcome
	li $v0, 4
	la $a0, introduction
	syscall

	#Pt 2
	li $v0, 4
	la $a0, intro2
	syscall

	# Pt 3
	li $v0, 4
	la $a0, intro3
	syscall

	# Pt 4
	li $v0, 4
	la $a0, intro4
	syscall

	# Logins
	li $v0, 4
	la $a0, logins
	syscall

	b userLogin
	


userLogin:
	# Ask user to input a username
	li $v0, 4
	la $a0, newUserReq
	syscall
	
	# Get that username
	li $v0, 8
	la $a0, usernameBuffer
	la $a1, 30
	syscall

	# Ask user to input a calorie goal
	li $v0, 4
	la $a0, calorieGoalInput
	syscall

	# Get it
	li $v0, 5
	syscall
	move $t9, $v0

	# Clear cal intake
	li $t8, 0
	# Ask user to choose a user
	li $v0, 4
	la $a0, users
	syscall
	
	# Get choice
	li $v0, 5
	syscall

	# Check for valid input
	
	
	# Check for valid input
	bgt $v0, 5, userLogin
	blt $v0, 0, userLogin
	
	# move to user variable
	move $s0, $v0
	
	# Ask for password
	b userPasswordSeq

userPasswordSeq:
	

	# Ask for password until correct password given
	li $v0, 4
	la $a0, passwordAsk
	syscall

	# Get password
	li $v0, 5
	syscall
	
	# Check for it to be equal to the selected user space password
	beq $s0, 1, user1
	beq $s0, 2, user2
	beq $s0, 3, user3
	beq $s0, 4, user4
	beq $s0, 5, user5
	
	# Display error message if invalid input
	li $v0, 4
	la $a0, invalidInput
	syscall

	b userPasswordSeq

user1:
	# Check for password against the correct password
	bne $v0, 1234, userPasswordSeq

	# If correct, branch to main menu
	
	
	b mainMenu
user2:
	# Check for password against the correct password
	bne $v0, 4321, userPasswordSeq

	# If correct, branch to main menu
	
	b mainMenu

user3:
	# Check for password against the correct password
	bne $v0, 5678, userPasswordSeq

	# If correct, branch to main menu
	
	b mainMenu

user4:
	# Check for password against the correct password
	bne $v0, 8765, userPasswordSeq

	# If correct, branch to main menu
	
	b mainMenu

user5:
	# Check for password against the correct password
	bne $v0, 1001, userPasswordSeq

	# If correct, branch to main menu
	
	b mainMenu




mainMenu:
	# Print menu
	li $v0, 4				
	la $a0, menuMain			
	syscall					
	# Get input 
	li $v0, 5				# Prepare to receive integer input
	syscall					# Ready for input
	move $t0, $v0				# Move input to register t0

	# Check input
	beq $t0, 1, pantryMenu
	beq $t0, 2, makeAMeal
	beq $t0, 3, userMenu
	beq $t0, 4, exit			
	bgt $t0, 4, mainMenu
	blt $t0, 1, mainMenu



pantryMenu:
	# Display pantry menu
	li $v0, 4
	la $a0, menuPantry
	syscall
	
	# Get user input
	li $v0, 5
	syscall
	
	# Check user input and branch to the corresponding label
	beq $v0, 1, itemMenu
	beq $v0, 2, displayPantry
	beq $v0, 3, mainMenu
				
	b pantryMenu

userMenu:
	# Print menu
	li $v0, 4
	la $a0, userMenuDisplay
	syscall
	
	# Get user input
	li $v0, 5
	syscall
	# Compare
	beq $v0, 1, userNameChange
	beq $v0, 2, displayUser
	beq $v0, 3, userLogin #editUser still exists if needed
	beq $v0, 4, mainMenu
	
	# Error
	li $v0, 4
	la $a0, invalidInput
	syscall
	# Branch back to user menu
	b userMenu



userNameChange:
	# Ask for new username
	li $v0, 4
	la $a0, newUserReq
	syscall
	
	# Get it
	li $v0, 8
	la $a0, usernameBuffer
	li $a1, 20
	syscall

	# Back to user menu
	b userMenu
displayUser:
	# Display data about user

	# Display name message
	li $v0, 4
	la $a0, userDisplayName
	syscall

	# Display name
	li $v0, 4
	la $a0, usernameBuffer
	syscall

	# Display id message
	li $v0, 4
	la $a0, userDisplayId
	syscall

	# Display id
	li $v0, 1
	move $a0, $s0
	syscall

	# Display meals made message
	li $v0, 4
	la $a0, mealsMadeDisplay
	syscall

	# Display meals made
	li $v0, 1
	move $a0, $s1
	syscall

	# Display calorie count

	li $v0, 4
	la $a0, calorieCountDisplay
	syscall

	# Calculate percentage
	
	# Multiply calorie intake by 100
	li $t2, 100
	mult $t8, $t2
	mflo $t0
	
	# Divide calorie intake * 100 by calorie goal 
	div $t0, $t9
	mflo $t0
	

	# Display the percentage
	li $v0, 1
	move $a0, $t0
	syscall

	# Back to user menu
	b userMenu
	
editUser:
	# Prompt user to enter new calorie goal
	li $v0, 4
	la $a0, calorieGoalInput
	syscall

	# Get new goal
	li $v0, 5
	syscall
	move $t9, $v0

	# Go back to user menu
	b userMenu


displayPantry:
	# Call out everything displayed in pantry
	li $v0, 4
	la $a0, pantryDisplayStart
	syscall

	
	# Display pantry slot 1 item
	li $v0, 4
	la $a0, pantry1
	syscall

	# Display item count msg
	li $v0, 4
	la $a0, itemMsg
	syscall

	# Display item count
	li $v0, 1
	move $a0, $s2
	syscall

	# Display cal count msg
	li $v0, 4
	la $a0, calMsg
	syscall

	# Display calorie count
	li $v0, 1
	move $a0, $s5
	syscall

	# print a space and 2.
	li $v0, 4
	la $a0, next1
	syscall

	# Display pantry slot 2 item and calorie count
	li $v0, 4
	la $a0, pantry2
	syscall

	# Display item count msg
	li $v0, 4
	la $a0, itemMsg
	syscall

	# Display item count
	li $v0, 1
	move $a0, $s3
	syscall

	# Display cal count msg
	li $v0, 4
	la $a0, calMsg
	syscall

	# Display calorie count
	li $v0, 1
	move $a0, $s6
	syscall

	# Print a space and 3.
	li $v0, 4
	la $a0, next2
	syscall

	# Display pantry slot 3 item and calorie count
	li $v0, 4
	la $a0, pantry3
	syscall

	# Display item count msg
	li $v0, 4
	la $a0, itemMsg
	syscall

	# Display item count
	li $v0, 1
	move $a0, $s4
	syscall

	# Display cal count msg
	li $v0, 4
	la $a0, calMsg
	syscall

	# Display calorie count
	li $v0, 1
	move $a0, $s7
	syscall

	# Branch back to pantryMenu
	
	b pantryMenu

itemMenu:
	# Display options, get users choice for option
	li $v0, 4
	la $a0, menuItem
	syscall

	# Get input	
	li $v0, 5
	syscall
	
	# Check input
	beq $v0, 1, addItem
	beq $v0, 2, changeItemCount
	beq $v0, 3, displayCalories
	beq $v0, 4, pantryMenu
	
	# Invalid input Message
	li $v0, 4
	la $a0, invalidInput
	syscall
	
	
	# Branch back to item menu
	b itemMenu
addItem:
	
	# Call out everything displayed in pantry
	li $v0, 4
	la $a0, pantryDisplayStart
	syscall

	
	# Display pantry slot 1 item
	li $v0, 4
	la $a0, pantry1
	syscall

	# Display item count msg
	li $v0, 4
	la $a0, itemMsg
	syscall

	# Display item count
	li $v0, 1
	move $a0, $s2
	syscall

	# Display cal count msg
	li $v0, 4
	la $a0, calMsg
	syscall

	# Display calorie count
	li $v0, 1
	move $a0, $s5
	syscall

	# Display a space and 2.
	li $v0, 4
	la $a0, next1
	syscall

	# Display pantry slot 2 item and calorie count
	li $v0, 4
	la $a0, pantry2
	syscall

	# Display item count msg
	li $v0, 4
	la $a0, itemMsg
	syscall

	# Display item count
	li $v0, 1
	move $a0, $s3
	syscall

	# Display cal count msg
	li $v0, 4
	la $a0, calMsg
	syscall

	# Display calorie count
	li $v0, 1
	move $a0, $s6
	syscall

	# Display a space and 3.
	li $v0, 4
	la $a0, next2
	syscall

	# Display pantry slot 3 item and calorie count
	li $v0, 4
	la $a0, pantry3
	syscall

	# Display item count msg
	li $v0, 4
	la $a0, itemMsg
	syscall

	# Display item count
	li $v0, 1
	move $a0, $s4
	syscall

	# Display cal count msg
	li $v0, 4
	la $a0, calMsg
	syscall

	# Display calorie count
	li $v0, 1
	move $a0, $s7
	syscall

	# Select item prompt
	li $v0, 4
	la $a0, itemSelect
	syscall

	# Get user input
	li $v0, 5
	syscall

	# Compare user input to possible pantry slots and go to right part of code
	beq $v0, 1, itemSelect1
	beq $v0, 2, itemSelect2
	beq $v0, 3, itemSelect3
	
	# Invalid input
	li $v0, 4
	la $a0, invalidInput
	syscall

	b addItem


itemSelect1:
	# Print item name message
	li $v0, 4
	la $a0, itemNameReq
	syscall

	# Get item name
	li $v0, 8
	la $a0, pantry1
	li $a1, 60
	syscall

IS1_itemNum:
	# Request item num
	li $v0, 4
	la $a0, howManyItems
	syscall

	

	# Get it 
	li $v0, 5
	syscall
	
	# Check for below 0
	bltz $v0, IS1_itemNum

	# Store if valid
	move $s2, $v0

IS1_calCount:
	# Request cal count
	li $v0, 4
	la $a0, calRequest
	syscall

	# Get item cal count
	li $v0, 5
	syscall

	# Check for below 0
	bltz $v0, IS1_calCount
	
	# Store if valid
	move $s5, $v0
	
	# Return to item menu
	b itemMenu
	
itemSelect2:
	# Request item name
	li $v0, 4
	la $a0, itemNameReq
	syscall

	# Get item name
	li $v0, 8
	la $a0, pantry2
	li $a1, 60
	syscall

IS2_itemNum:
	# Request item num
	li $v0, 4
	la $a0, howManyItems
	syscall

	

	# Get it 
	li $v0, 5
	syscall
	
	# Check for below 0
	bltz $v0, IS2_itemNum
	# Store if valid
	move $s3, $v0

IS2_calCount:
	# Request cal count
	li $v0, 4
	la $a0, calRequest
	syscall

	# Get item cal count
	li $v0, 5
	syscall

	# Check for below 0
	bltz $v0, IS2_calCount
	
	# Store if valid
	move $s6, $v0
	
	# Return to item menu
	b itemMenu

itemSelect3:
	# Request item name
	li $v0, 4
	la $a0, itemNameReq
	syscall

	# Get item name
	li $v0, 8
	la $a0, pantry3
	li $a1, 60
	syscall

IS3_itemNum:
	# Get item num
	li $v0, 4
	la $a0, howManyItems
	syscall

	

	# Get it 
	li $v0, 5
	syscall
	
	# Check for below 0
	bltz $v0, IS3_itemNum
	# Store if valid
	move $s4, $v0

IS3_calCount:
	# Request cal count
	li $v0, 4
	la $a0, calRequest
	syscall

	# Get item cal count
	li $v0, 5
	syscall

	# Check for below 0
	bltz $v0, IS3_calCount
	
	# Store if valid
	move $s7, $v0
	
	# Return to item menu
	b itemMenu	

changeItemCount:
	# Print out the pantry
	li $v0, 4
	la $a0, pantryPrePrint
	syscall
	
	# Print items
	li $v0, 4
	la $a0, pantry1
	syscall
	# Print a space and 2.
	li $v0, 4
	la $a0, next1
	syscall
	# Print item 2
	li $v0, 4
	la $a0, pantry2
	syscall
	# Print space and 3.
	li $v0, 4
	la $a0, next2
	syscall
	# Print item 3
	li $v0, 4
	la $a0, pantry3
	syscall

	# Select item prompt
	li $v0, 4
	la $a0, itemSelect
	syscall

	# Get user input
	li $v0, 5
	syscall

	# Compare user input to possible pantry slots and go to right part of code
	beq $v0, 1, itemChange1
	beq $v0, 2, itemChange2
	beq $v0, 3, itemChange3

	# Invalid input
	li $v0, 4
	la $a0, invalidInput
	syscall
	b itemMenu
	


itemChange1:

	# Get new number
	li $v0, 4
	la $a0, enterNewNum
	syscall

	# Get new num
	li $v0, 5
	syscall

	# Check for 0 or above
	bltz $v0, itemChange1
	
	# Store it
	move $s2, $v0

	# Return to item menu
	b itemMenu

itemChange2:

	# Get new number
	li $v0, 4
	la $a0, enterNewNum
	syscall

	# Get new num
	li $v0, 5
	syscall

	# Check for 0 or above
	bltz $v0, itemChange2
	
	# Store it
	move $s3, $v0

	# Return to item menu
	b itemMenu

itemChange3:

	# Get new number
	li $v0, 4
	la $a0, enterNewNum
	syscall

	# Get new num
	li $v0, 5
	syscall

	# Check for 0 or above
	bltz $v0, itemChange3
	
	# Store it
	move $s4, $v0

	# Return to item menu
	b itemMenu
	

displayCalories:
	# Call out everything displayed in pantry
	li $v0, 4
	la $a0, pantryDisplayStart
	syscall

	
	# Display pantry slot 1 item
	li $v0, 4
	la $a0, pantry1
	syscall

	# Display item count msg
	li $v0, 4
	la $a0, itemMsg
	syscall

	# Display item count
	li $v0, 1
	move $a0, $s2
	syscall

	# Display cal count msg
	li $v0, 4
	la $a0, calMsg
	syscall

	# Display calorie count
	li $v0, 1
	move $a0, $s5
	syscall

	# Print a space and 2.
	li $v0, 4
	la $a0, next1
	syscall

	# Display pantry slot 2 item and calorie count
	li $v0, 4
	la $a0, pantry2
	syscall

	# Display item count msg
	li $v0, 4
	la $a0, itemMsg
	syscall

	# Display item count
	li $v0, 1
	move $a0, $s3
	syscall

	# Display cal count msg
	li $v0, 4
	la $a0, calMsg
	syscall

	# Display calorie count
	li $v0, 1
	move $a0, $s6
	syscall

	# Print a space and 3.
	li $v0, 4
	la $a0, next2
	syscall

	# Display pantry slot 3 item and calorie count
	li $v0, 4
	la $a0, pantry3
	syscall

	# Display item count msg
	li $v0, 4
	la $a0, itemMsg
	syscall

	# Display item count
	li $v0, 1
	move $a0, $s4
	syscall

	# Display cal count msg
	li $v0, 4
	la $a0, calMsg
	syscall

	# Display calorie count
	li $v0, 1
	move $a0, $s7
	syscall

	# Ask user to enter item number
	li $v0, 4
	la $a0, itemNumReq
	syscall

	# Get item num
	li $v0, 5
	syscall
	move $t0, $v0
	
	# Check for invalid input before proceeding
	bgt $t0, 3, calorieError
	bltz $t0, calorieError
	b totalOrPercentAskCode


calorieError:
	# Print invalid input
	li $v0, 4
	la $a0, invalidInput
	syscall

	b displayCalories
totalOrPercentAskCode:
	# Ask for total or percentage
	li $v0, 4
	la $a0, totalOrPercentage
	syscall

	# Get answer by 1 or 2
	li $v0, 5
	syscall
	
	
	# If invalid choice chosen branch back
	bltz $v0, totalOrPercentAskCode
	bgt $v0, 2, totalOrPercentAskCode

	# Branch to part of code for the specific item
	beq $t0, 1, item1Calories
	beq $t0, 2, item2Calories
	beq $t0, 3, item3Calories

item1Calories:

	# If 2 go to percentage else just assume total desired
	beq $v0, 2, calorie1Percentage


	# Multiply cal count per item by amount of items
	mult $s5, $s2
	mflo $t0

	# Print calories
	li $v0, 4
	la $a0, caloriesAre
	syscall

	# Print count
	li $v0, 1
	move $a0, $t0
	syscall

	# Go back to item menu
	b itemMenu

calorie1Percentage:
	# Prompt user to enter percentage
	li $v0, 4
	la $a0, percentageEnter
	syscall

	# Get percentage
	li $v0, 5
	syscall
	move $t0, $v0

	# Get calorie count
	move $t1, $s5

	# Multiply percentage and cal count
	
	mult $t0, $t1
	mflo $t0

	# Divide by 100 
	li $t3, 100
	div $t0, $t3
	mflo $t0

	# Output message
	li $v0, 4
	la $a0, caloriesAre
	syscall

	# Output
	li $v0, 1
	move $a0, $t0
	syscall

	# Branch back to item menu
	b itemMenu
	
item2Calories:

	# If 2 go to percentage else just assume total desired
	beq $v0, 2, calorie2Percentage


	# Multiply item count by calories per item
	mult $s6, $s3
	mflo $t0
	# Print calories
	li $v0, 4
	la $a0, caloriesAre
	syscall

	# Print count
	li $v0, 1
	move $a0, $t0
	syscall

	# Go back to item menu
	b itemMenu

calorie2Percentage:
	# Prompt user to enter percentage
	li $v0, 4
	la $a0, percentageEnter
	syscall

	# Get percentage
	li $v0, 5
	syscall
	move $t0, $v0

	# Get calorie count
	move $t1, $s6

	# Multiply
	
	mult $t0, $t1
	mflo $t0

	# Divide by 100 
	li $t3, 100
	div $t0, $t3
	mflo $t0

	# Output message
	li $v0, 4
	la $a0, caloriesAre
	syscall

	# Output
	li $v0, 1
	move $a0, $t0
	syscall

	# Branch back to item menu
	b itemMenu
item3Calories:

	# If 2 go to percentage else just assume total desired
	beq $v0, 2, calorie3Percentage


	# Multiply cal count of item by total items
	mult $s7, $s4
	mflo $t0
	# Print calories
	li $v0, 4
	la $a0, caloriesAre
	syscall

	# Print count
	li $v0, 1
	move $a0, $t0
	syscall

	# Go back to item menu
	b itemMenu

calorie3Percentage:
	# Prompt user to enter percentage
	li $v0, 4
	la $a0, percentageEnter
	syscall

	# Get percentage
	li $v0, 5
	syscall
	move $t0, $v0

	# Get calorie count
	move $t1, $s7

	# Multiply
	
	mult $t0, $t1
	mflo $t0

	# Divide by 100 
	li $t3, 100
	div $t0, $t0, $t3

	# Output message
	li $v0, 4
	la $a0, caloriesAre
	syscall

	# Output
	li $v0, 1
	move $a0, $t0
	syscall

	# Branch back to item menu
	b itemMenu


		

	



makeAMeal:
	# Check to make sure the user is not about to exceed the meal limit
	blt $s1, 10, Make_I1
	# Tell user they cant make any meals this running of the program
	li $v0, 4
	la $a0, noMoreMeals
	syscall
	
	# Branch back to pantry menu
	b mainMenu
Make_I1:
	# Clear meal calories register
	li $t1, 0
	
	# Ask for how many of item 1
	li $v0, 4
	la $a0, howMany1
	syscall
	
	# Get num
	li $v0, 5
	syscall
	
	# Check for less than 0
	bltz $v0, Make_I1
	

	# Store it temporarily
	move $t2, $v0

	
	

	# Calculate calories
	mult $t2, $s5
	mflo $t0

	# Add calories to meal calories counter
	add $t1, $t0, $t1

	
Make_I2:
	
	# Ask for how many of item 2
	li $v0, 4
	la $a0, howMany2
	syscall
	
	# Get num
	li $v0, 5
	syscall
	
	# Check for less than 0
	bltz $v0, Make_I2

	# Store it temporarily
	move $t3, $v0

	

	# Calculate calories
	mult $t3, $s6
	mflo $t0

	# Add calories to meal calories counter
	add $t1, $t0, $t1

	
Make_I3:
	
	# Ask for how many of item 3
	li $v0, 4
	la $a0, howMany3
	syscall
	
	# Get num
	li $v0, 5
	syscall
	
	# Check for less than 0
	bltz $v0, Make_I3

	# Store it temporarily
	move $t4, $v0

	

	# Calculate calories
	mult $t4, $s7
	mflo $t0

	# Add calories to meal calories counter
	add $t1, $t0, $t1

	# Push item 1 count to stack
	subu $sp, $sp, 4
	sw $t2, ($sp)

	# Push item 2 count to stack
	subu $sp, $sp, 4
	sw $t3, ($sp)

	# Push item 3 count to stack
	subu $sp, $sp, 4
	sw $t4, ($sp)

	

	# Push meal calories to stack
	subu $sp, $sp, 4
	sw $t1, ($sp)
	
	# Push user id to stack
	subu $sp, $sp, 4
	sw $s0, ($sp)
	
	# Add meal calories to users calorie intake
	add $t8, $t1, $t8
	

	
	
	# Increase meal counter
	addi $s1, $s1, 1

	# Go to end
	b makeAMealEnd_M1


makeAMealEnd_M1:
	
	
	# Get meal name
	li $v0, 4
	la $a0, mealNameAsk
	syscall

	# Get name from user
	li $v0, 8
	la $a0, meal1
	li $a1, 60	
	syscall
	

	
	# Output meal back to user
	#li $v0, 4
	#la $a0, meal1
	#syscall
	


	

makeAMealEnd_pt4:

	# Print Meal title
	li $v0, 4
	la $a0, mealTitle
	syscall

	# Print actual meal title
	li $v0, 4
	la $a0, meal1
	syscall

	# Print Meal 
	li $v0, 4
	la $a0, item1Counts
	syscall
	
	# Get item 1 count
	li $v0, 1
	move $a0, $t2
	syscall

	# Print Meal 
	li $v0, 4
	la $a0, item2Counts
	syscall
	
	# Get item 2 count
	li $v0, 1
	move $a0, $t3
	syscall
	
	# Print Meal 
	li $v0, 4
	la $a0, item3Counts
	syscall
	
	# Get item 3 count
	li $v0, 1
	move $a0, $t4
	syscall
	

	# Print calorie message desc
	li $v0, 4
	la $a0, caloriesInMeal
	syscall

	# Print calories
	li $v0, 1
	move $a0, $t1
	syscall
	
subtractQuestion:
	# Ask user if they would like to remove the used items from pantry
	li $v0, 4
	la $a0, removeItems
	syscall

	# Get user answer
	li $v0, 5
	syscall

	# If 1 do so, if 2 do not do so
	beq $v0, 1, subtractYes
	beq $v0, 2, mainMenu
	
	# Main menu
	b subtractQuestion
	
subtractYes:
	# Subtract amounts used for meals from each items total
	sub $s2, $s2, $t2
	sub $s3, $s3, $t3
	sub $s4, $s4, $t4
subtractYes_pt2:
	# Check for each item to be less than 0
	bltz $s2, restoreItem1
	bltz $s3, restoreItem2
	bltz $s4, restoreItem3

	# Branch to main menu once done
	b mainMenu
restoreItem1:
	# Restore item 1 count back to 0
	li $s2, 0
	# Tell user to get more of item 1
	li $v0, 4
	la $a0, moreItem1
	syscall
	# Go back to subtractYes_pt2
	b subtractYes_pt2
restoreItem2:
	# Restore item 2 count back to 0
	li $s3, 0
	# Tell user to get more of item 2
	li $v0, 4
	la $a0, moreItem2
	syscall
	# Go back to subtractYes_pt2
	b subtractYes_pt2
restoreItem3:
	# Restore item 3 count back to 0
	li $s4, 0
	# Tell user to get more of item 3
	li $v0, 4
	la $a0, moreItem3
	syscall
	# Go back to subtractYes_pt2
	b subtractYes_pt2
	
	 	
	
	
	
	 

exit:
	

	# Check for no meals made
	beq $s1, 0, completeExit

mealDisplayBack:
	# Go back through all meals made
	# Display seperator	
	li $v0, 4
	la $a0, mealDispSEPERATE
	syscall

	# Display "Meal"
	li $v0, 4
	la $a0, meal
	syscall

	# Display meal number
	li $v0, 1
	move $a0, $s1
	syscall

	# Display "User: "
	li $v0, 4
	la $a0, userMsg
	syscall

	# Load user
	lw $t0, ($sp)
	
	# Output user id
	li $v0, 1
	move $a0, $t0
	syscall

	
	
	
	
	# Display calories are
	li $v0, 4
	la $a0, caloriesAre

	# Get calories
	addu $sp, $sp, 4
	lw $t1, ($sp)
	
	# Get item 3 count
	addu $sp, $sp, 4
	lw $t4, ($sp)
	
	# Get item 2 count
	addu $sp, $sp, 4
	lw $t3, ($sp)

	# Get item 1 count
	addu $sp, $sp, 4
	lw $t2, ($sp)

	# Prepare for next iteration
	addu $sp, $sp, 4
	
	# Print Meal 
	li $v0, 4
	la $a0, item1Counts
	syscall
	
	# Print item 1 count
	li $v0, 1
	move $a0, $t2
	syscall

	# Print Meal 
	li $v0, 4
	la $a0, item2Counts
	syscall
	
	# Print item 2 count
	li $v0, 1
	move $a0, $t3
	syscall
	
	# Print Meal 
	li $v0, 4
	la $a0, item3Counts
	syscall
	
	# Print item 3 count
	li $v0, 1
	move $a0, $t4
	syscall
	

	# Print calorie message desc
	li $v0, 4
	la $a0, caloriesInMeal
	syscall

	# Print calories
	li $v0, 1
	move $a0, $t1
	syscall
	
	# Decrease meal count
	addi $s1, $s1, -1

	# Check for no meals left
	beq $s1, 0, completeExit
	b mealDisplayBack

completeExit:
	# Display a ending message
	li $v0, 4
	la $a0, goodbye
	syscall

	# Clear registers
	li $t0, 0
	li $t1, 0
	li $t2, 0
	li $t3, 0
	li $t4, 0
	li $t5, 0
	li $t6, 0
	li $t7, 0
	li $t8, 0
	

	li $s0, 0
	li $s1, 0
	li $s2, 0
	li $s3, 0
	li $s4, 0
	li $s5, 0
	li $s6, 0
	# Exit
	li $v0, 10				
	syscall
