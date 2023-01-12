//This file was generated from (Academic) UPPAAL 4.1.26-1 (rev. 7BCF30B7363A9518), February 2022

/*
Check if the chef ChefChoco will always have no ingredients when the chef is waiting for ingredients. Should always be true.
*/
A[] !(ChefChoco.Waiting4Ingredients && ChefChoco.ingredient[eggCream] == eggCream)

/*
Check mutual exclusion that two chefs cannot receive ingredient simultaneously. Should always return true.
*/
A[] ! (ChefChoco.IngredientsRecieved && ChefEgg.IngredientsRecieved)

/*
Is there no possible way the chefchoco can receive the ingredient he already has which is choco. The given query shall always result to true
*/
A[] ! (ChefChoco.ingredient[eggCream]==chocoEgg  || ChefChoco.ingredient[eggCream]==chocoCream) 

/*
Check if there is always true that the chef will recieve ingredients and starts cookingEating. Should return true but the chef is not enforced to progress and could stall even if the chef got their ingredients. Therefore, this returns false.
*/
ChefChoco.IngredientsRecieved --> ChefChoco.CookingAndEating

/*
Check if there is a deadlock for all states.
*/
A[] ! deadlock
