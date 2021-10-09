/** Project 1 - Virtual Creature (Maureen Navera)
----creatureStates.pde-----------------------------------------------------------------------------------------------------------
    The following code in this file includes functions which control behaviour of the creature as it is in its 3 different
     states in life.
---------------------------------------------------------------------------------------------------------------------------------
**/

void egg(){ 
  /** This function is used for when the creature is still an egg. When you click anywhere on the screen, a progress bar
      will appear at the top of the screen and will increase as the screen is clicked. Once the progress bar is full, the egg will 
      hatch! When not clicking on the screen, the progress bar can decrease.
  **/
  
   //draws a prompt for the user to click anywhere on the screen
   fill(#FA8674);
   rect(width/2, 950, 1000, 200, 28);
   textSize(35);
   fill(#A2371C);
   text("Click anywhere on the screen to begin hatching the egg!", 25 , 950);

  //determines if the screen is being clicked
  if (mousePressed) {
    hatching = true; 
    hatch_bar();      
  } else {
    hatching = false;
    hatch_progress -= 2;
  }
}


void chick(){
  /** The following code is used for when the creature turns into a baby chick. The user will be prompted to either left click to feed the chicken
      or right click to put the chicken to sleep. There are two progress bars this time, a red one which represents how full the chick is (from feeding it) 
      and a blue one which represents how well rested the chick is.
  **/
  
  //draws a prompt for the user to left mouse click to feed the chick and right mouse click to put the chicken to sleep
  fill(#FA8674);
  rect(width/2, 950, 1000, 200, 28);
  fill(#A2371C);
  text("left click to feed the chick\nright click to put the chick to sleep!", 100 , 920);
  
  // the following lines of code determine if and which mouse buttons are pressed
  if (mousePressed && (mouseButton == LEFT)) {
    food_bar();
  } else if (mousePressed && (mouseButton == RIGHT)) {
    sleep_bar();
  } else {
    image_current = chick; 
  }
  
  //the following lines of code determine if the chick is done sleeping and done eating
  if (food_progress == 500 && sleep_progress == 500){
      //done hatching so change status egg to false and status chick to true
      status_chick = false;
      status_chicken = true;
      food_progress = -500;
      sleep_progress = -500;
  } 
}


void chicken(){
  /** The following code is used for when the creature turns into a chicken. The user will be prompted to either left click to feed the chicken
      or right click to put the chicken to sleep. There are two progress bars this time, a red one which represents how full the chick is (from feeding it) 
      and a blue one which represents how well rested the chick is. When both progress bars are full, the user is prompted to press space bar to lay an
      egg (which there is a counter for towards the bottom left of the screen). Progress bars go back down after an egg is hatched.
  **/
  
  //draws a prompt for the user to left mouse click to feed the chick and right mouse click to put the chicken to sleep and to press space when bars are full
  fill(#FA8674);
  rect(width/2, 900, 1000, 300, 28);
  fill(#A2371C);
  text("left click to feed the chick\nright click to put the chicken to sleep!\npress space bar to hatch eggs whenever the bars are full!", 20 , 830);
  
  // the following lines of code determine if and which mouse buttons are pressed
  if (mousePressed && (mouseButton == LEFT)) {
    food_bar();
  } else if (mousePressed && (mouseButton == RIGHT)) {
    sleep_bar();
  } else {
    image_current = chicken; 
  } 
}


void keyPressed(){
  /** This function determines when the space bar is pressed (to lay eggs)
  **/
  if (key == ' ' && status_chicken == true && food_progress == 500 && sleep_progress == 500){
    food_progress = -500;
    sleep_progress = -500;
    num_eggs += 1;
  }
}
