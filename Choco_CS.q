//This file was generated from (Academic) UPPAAL 4.1.26-1 (rev. 7BCF30B7363A9518), February 2022

/*
Checks if the Server has sent the ingredient to a chef and then moves from Wait2Send to Sending. The result is false due to server is not enforced to progress and can be stalled, while the result should be true.
*/
Server1.Wait2Send --> Server1.Sending

/*
There is no path with a state where the server produces the chefs own ingredient 
*/
E<> ! (Server1.localMSG[0]==ChefChoco.ID && (Server1.localMSG[1]==choco || Server1.localMSG[2]==choco))

/*
Check if the server gives the correct chef the correct ingredients and the chef moves from receive ingredients to CookingAndEating. The result is false because the chef is not enforced to progress and can be stalled, while the result should be true.
*/
Server1.localMSG[0]==ChefChoco.ID && Server1.localMSG[1]==ChefChoco.ingredient1 && Server1.localMSG[2]==ChefChoco.ingredient2 --> ChefChoco.CookingAndEating

/*
Check if the server has the correct chef id with the correct Ingredients.
*/
E<> (Server1.localMSG[0]==ChefChoco.ID && Server1.localMSG[1]==ChefChoco.ingredient1 && Server1.localMSG[2]==ChefChoco.ingredient2)

/*
Check if there is always true that the chef will recieve ingredients and starts cookingEating. Should return true but the chef is not enforced to progress and could stall even if the chef got their ingredients. Therefore, this returns false.
*/
ChefChoco.IngredientsRecieved --> ChefChoco.CookingAndEating

/*
Is there no possible way the ChefEgg can receive the ingredient he already has which is Egg. The given query shall always result to true
*/
A[] ! (ChefEgg.ingredients[0]==egg || ChefEgg.ingredients[1]==egg)

/*
Is there no possible way the ChefCream can receive the ingredient he already has which is Cream. The given query shall always result to true
*/
A[] ! (ChefCream.ingredients[0]==cream || ChefCream.ingredients[1]==cream)

/*
Is there no possible way the chefchoco can receive the ingredient he already has which is choco. The given query shall always result to true
*/
A[] ! (ChefChoco.ingredients[0]==choco || ChefChoco.ingredients[1]==choco)

/*
Test to see if a chef got the correct ingredient before cooking and eating.
*/
A[] ! ChefChoco.CookingAndEating || (ChefChoco.ingredients[0]==egg && ChefChoco.ingredients[1]==cream)

/*
Check if there is a deadlock for all states.
*/
A[] ! deadlock
