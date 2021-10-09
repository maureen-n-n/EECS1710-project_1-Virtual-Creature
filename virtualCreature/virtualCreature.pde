/** Project 1 - Virtual Creature (Maureen Navera)
----virtualCreature.pde----------------------------------------------------------------------------------------------------------
    This project allows users to take care of a virtual pet chicken!
    Follow the directions on the lower half of the screen to see your hatch into a baby chick and grow up
    into a chicken who can lay its own eggs! 
---------------------------------------------------------------------------------------------------------------------------------
**/
//------Initialize global variables----------------------------------------------------------------------------------------------
PImage egg, image_current, chick, hungrychick, sleepychick, chicken, hungrychicken, sleepychicken;
boolean hatching = false;
boolean status_chicken = false;
boolean status_chick = false;
boolean status_egg = true;
int hatch_progress = -500;
int food_progress = -500;
int sleep_progress = -500;
int num_eggs = 0; 
//-------------------------------------------------------------------------------------------------------------------------------

void setup(){
  // initialize the properties of the environment
  size(1000, 1000);
  noStroke();
  imageMode(CENTER);
  textMode(CENTER);
  rectMode(CENTER);
  
  //loading images
  egg = loadImage("egg.png");
  chick = loadImage("chick.png");
  hungrychick = loadImage("hungrychick.png");
  sleepychick = loadImage("sleepychick.png");
  chicken = loadImage("chicken.png");
  sleepychicken = loadImage("sleepychicken.png");
  hungrychicken = loadImage("hungrychicken.png");
  image_current = egg;
}


void move_image(){
  /** This function moves the image to follow the mouse cursor
      source: https://forum.processing.org/one/topic/image-or-animation-to-follow-mouse.html
  **/
  float x = 100;
  float y = 100;
  float angle1 = 0.0;
  float segLength = 50;
  float dx = mouseX - x;
  float dy = mouseY - y;
  
  angle1 = atan2(dy, dx);  
  x = mouseX - (cos(angle1) * segLength);
  y = mouseY - (sin(angle1) * segLength);
  image(image_current, x, y, width/3, height/2.5);
}


void draw() {
  /** This function draws everything to the screen **/
  background(#FFE1B9);
  
  // draws the sleep progress bar
  fill(#8BA0DB);
  rect(sleep_progress, 50, 1000, 40);
  
  // draws the food progress bar
  fill(#E57248);
  rect(food_progress, 100, 1000, 40);
  
  //draws and animates the creature
  move_image();
  
  if (status_egg){
    // if the creature is still an egg, call the egg function and draw the hatching progress bar to the screen
    egg();
    fill(#A4C99A);
    rect(hatch_progress, 100, 1000, 100);
 
  } else if (status_chick){
      // if the creature is a chick... 
      fill(#FA8674);
      text("the egg hatched into a baby chick!", 200, 200);
      
      chick();
      
  } else if (status_chicken){
      //draws the chick and a rectangle over the previous chick (so it doesn't look like they are stacking over each other)
      
      fill(#FA8674);
      text("the baby chick turned into a chicken!", 200, 200);
      chicken(); 
      
      image(egg, 100, 650, width/6, height/5);
      fill(#FA8674);
      if (status_chicken == true && food_progress == 500 && sleep_progress == 500) {
        text("PRESS THE SPACE BAR TO LAY AN EGG!", 200, 670);
      } else{
        text("You have layed " + num_eggs + " eggs!", 200, 670);
      }
      
  }
}
