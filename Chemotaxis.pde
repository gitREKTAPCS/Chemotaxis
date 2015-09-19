Bacteria[] swagMastas;
Foods chewy;
int randomRed=(int)(Math.random()*255)+1;
int randomBlue=(int)(Math.random()*255)+1;
int randomGreen=(int)(Math.random()*255)+1;
int foodCounters=0;
 void setup()   
 {     
   //initialize bacteria variables here  
   size(512, 512); 
   chewy = new Foods();
   swagMastas = new Bacteria[325];
   for (int i = 0; i < swagMastas.length; ++i) {
     swagMastas[i] = new Bacteria();
   }

   
 }   
 void draw()   
 {    
   //random background
   background(randomRed, randomBlue, randomGreen);
   //show, walk, and check coordinate match
   for (int j = 0; j < swagMastas.length; ++j) {
     chewy.show();
     swagMastas[j].show();
     swagMastas[j].walk();
     if(((chewy.foodX < swagMastas[j].myX && swagMastas[j].myX<chewy.foodX+20) || swagMastas[j].myX==chewy.foodX+20)  && ((chewy.foodY < swagMastas[j].myY && swagMastas[j].myY<chewy.foodY+20) || swagMastas[j].myY==chewy.foodY+20)){
      chewy.eaten();
      foodCounters++;
    }
   }
   //text
   fill(0);
   textSize(20);
   text("Foods count: "+foodCounters , 200, 500);

   if(foodCounters>=20){
     for (int j = 0; j < swagMastas.length; ++j) {
     swagMastas[j].stop();  
   }
     fill(0);
     textSize(64);
     text("You win", 200, 256, 100);

     foodCounters=0;

     
   }
 }  

//change food location
 void mousePressed()
{
  chewy.foodX=(int)(Math.random()*512);
  chewy.foodY=(int)(Math.random()*512);
  
}

 //bacteria class
 class Bacteria    
 {     
   int myX, myY, redColor, blueColor, greenColor, randomX, randomY;

   Bacteria(){
     myX = 256;
     myY = 256;
     redColor = (int)(Math.random()*255)+1;
     greenColor = (int)(Math.random()*255)+1;
     blueColor = (int)(Math.random()*255)+1;
   }

   void show(){
     fill(redColor, greenColor, blueColor);
     ellipse(myX, myY, 10, 10);
   }

   void walk(){
     randomX = (int)((Math.random()*10)-5);
     randomY = (int)((Math.random()*10)-5);
     if(myX<512 && myX>0){
       myX= myX + randomX;
     }
     if(myY<490 && myY>0){
     myY = myY + randomY;
     }
      }

    void stop(){
      myX=256;
      myY=256;
      redraw();
    }
}

class Foods
{
  int foodX, foodY, redFood, greenFood, blueFood;

  Foods(){
    foodX = 300;
    foodY = 250;
    redFood = (int)(Math.random()*255)+1;
     greenFood = (int)(Math.random()*255)+1;
     blueFood = (int)(Math.random()*255)+1;
  }

  void show(){
    fill(redFood, greenFood, blueFood);
    rect(foodX, foodY, 20, 20);
  }

  void eaten(){
      foodX=(int)(Math.random()*512);
      foodY=(int)(Math.random()*512);
  }
  
}
