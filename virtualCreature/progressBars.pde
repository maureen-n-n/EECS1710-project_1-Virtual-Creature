/** Project 1 - Virtual Creature (Maureen Navera)
----progressBars.pde-------------------------------------------------------------------------------------------------------------
    The functions in this file control the three repsective progress bars used by the creature in this project.
---------------------------------------------------------------------------------------------------------------------------------
**/

void hatch_bar(){
  /** This function progresses the hatch progress bar which is only used when creature is an egg.
  **/
  if (hatch_progress > width/2){
    //done hatching so change status egg to false and status chick to true
    status_egg = false;
    status_chick = true;
  } else {
    // if not done hatching, keep adding to the hatch progress variable (x var of the green rect)
    hatch_progress+=10;
  }
}


void food_bar(){
  /** This function progresses the food progress bar and is called whenever the left mouse button is clicked and the creature is a chicken or chick
  **/
  if (status_chick){
    image_current = hungrychick;
    if (food_progress < width/2){
      //the chick is not full, keep adding to the hatch progress variable (x var of the green rect)
      food_progress+=10;
    }  
  } else if (status_chicken){
    image_current = hungrychicken;
    if (food_progress < width/2){
      //the chicken is not full, keep adding to the hatch progress variable (x var of the green rect)
      food_progress+=10;
    }
  }
}

void sleep_bar(){
  /** This function progresses the sleep progress bar and is called whenever the right mouse button is clicked and the creature is a chicken or chick
  **/
  if (status_chick){
    image_current = sleepychick;
    if (sleep_progress < width/2){
      //the chick isn't full yet, keep adding to the hatch progress variable (x var of the blue rect)
      sleep_progress+=10;
    }  
  } else if (status_chicken){
    image_current = sleepychicken;
    if (sleep_progress < width/2){
      //the chicken isn't full yet, keep adding to the hatch progress variable (x var of the blue rect)
      sleep_progress+=10;
    }  
  }
}
