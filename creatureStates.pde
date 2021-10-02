/** The following code is used for when the creature is still an egg. When you click anywhere on the screen, a progress bar
will appear at the top of the screen and will increase as the screen is clicked. Once the progress bar is full, the egg will 
hatch! **/

void egg(){ 
  //draws a prompt for the user to click anywhere on the screen
  String prompt = "Click anywhere on the screen to begin hatching the egg!";
  fill(#FA8674);
  rect(width/2, 950, 1000, 200, 28);
  textSize(35);
  fill(#A2371C);
  text(prompt, 25 , 950);
  
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
  /** The following code is used for when the creature turns into a baby chick. The user will be prompted with two buttons,
      one which feeds the chick and one that makes the chick go to sleep. There are two progress bars this time, a blue one
      which represents how full the chick is (from feeding it) and a purple one which represents how well rested the chick is.
      The bars will go down over time, so keep the bars up!!
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
    food_progress -= 1;
    sleep_progress -=2;
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
  // function representing when the creature is a chicken.
  //fill(#FA8674);
  //rect(width/2, 800, 975, 300, 28);
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
  if (key == ' ' && status_chicken == true && food_progress == 500 && sleep_progress == 500){
    food_progress = -500;
    sleep_progress = -500;
    num_eggs += 1;
  }
}
