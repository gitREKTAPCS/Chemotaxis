Bacteria[] swagMastas;
Foods chewy;
Enemy deathMachine;
Enemy killEm;
int randomRed=(int)(Math.random()*255)+1;
int randomBlue=(int)(Math.random()*255)+1;
int randomGreen=(int)(Math.random()*255)+1;
int foodCounters=0;
int deathCounter=0;
PFont f;
 void setup()   
 {     
   //initialize bacteria variables here  
   size(512, 512);
   swagMastas = new Bacteria[325];
   for (int i = 0; i < swagMastas.length; ++i) {
     swagMastas[i] = new Bacteria();
   }
    deathMachine = new Enemy(200,200);
    killEm = new Enemy(350,350);
    chewy = new Foods();
    f = createFont("Calbri",34,true);
 }   
 void draw()   
 {    
   //random background
   background(randomRed, randomBlue, randomGreen);
     deathMachine.show(); 
     deathMachine.move(); 
      killEm.show(); 
     killEm.move(); 
     chewy.show();
   //show, walk, and check coordinate match
   for (int j = 0; j < swagMastas.length; ++j) {
     swagMastas[j].walk();
     swagMastas[j].show();
     if(((chewy.foodX < swagMastas[j].myX && swagMastas[j].myX<chewy.foodX+20) || swagMastas[j].myX==chewy.foodX+20)  && ((chewy.foodY < swagMastas[j].myY && swagMastas[j].myY<chewy.foodY+20) || swagMastas[j].myY==chewy.foodY+20)){
      foodCounters++;
       chewy.eaten();
      
    }
    if(((deathMachine.enemyX < swagMastas[j].myX && swagMastas[j].myX<deathMachine.enemyX+20) || swagMastas[j].myX==deathMachine.enemyX+20)  && ((deathMachine.enemyY < swagMastas[j].myY && swagMastas[j].myY<deathMachine.enemyY+20) || swagMastas[j].myY==deathMachine.enemyY+20)){
      deathCounter++;
      swagMastas[j].isAlive=false;

  }
  if(((killEm.enemyX < swagMastas[j].myX && swagMastas[j].myX<killEm.enemyX+20) || swagMastas[j].myX==killEm.enemyX+20)  && ((killEm.enemyY < swagMastas[j].myY && swagMastas[j].myY<killEm.enemyY+20) || swagMastas[j].myY==killEm.enemyY+20)){
    deathCounter++;  
    swagMastas[j].isAlive=false;
      
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
      win();
   }

   if(deathCounter>=325){
     for (int j = 0; j < swagMastas.length; ++j) {
     swagMastas[j].stop();  
   }
      lose();
   }
 }  

//change food location
 void mousePressed()
{
  chewy.foodX=(int)(Math.random()*512);
  chewy.foodY=(int)(Math.random()*490);
  
}
 
 //win and lose text
 void lose(){
   foodCounters=0;
    deathCounter=0;
    deathMachine.isFinished=true;
    killEm.isFinished=true;
    background(0);
    textFont(f,16);                 
    fill(255);     
    text("ALL YOUR BACTERIA DIED!!!",256,200);                    
    text("YOU LOOOOOOOOSE!!!",256,256); 
    text("Refresh page to try again",256,300); 
    noLoop(); 
 }
 
 void win(){
   foodCounters=0;
    deathCounter=0;
    deathMachine.isFinished=true;
    killEm.isFinished=true; 
    background(0);
    textFont(f,16);                 
    fill(255);                        
    text("YOU WIN!!!",256,256); 
    text("Refresh page to try again",256,300);  
    noLoop();
  }
    
 //bacteria class
 class Bacteria    
 {     
   int myX, myY, redColor, blueColor, greenColor, randomX, randomY;
   boolean isAlive;

   Bacteria(){
     myX = 256;
     myY = 256;
     redColor = (int)(Math.random()*255)+1;
     greenColor = (int)(Math.random()*255)+1;
     blueColor = (int)(Math.random()*255)+1;
     isAlive = true;
   }

   void show(){
     if(isAlive==true){
     fill(redColor, greenColor, blueColor);
     ellipse(myX, myY, 10, 10);
 }else{
   myX=(int)(Math.random()*512);
  myY=500;
  redColor = 0;
  blueColor = 0;
  greenColor = 0;
 }
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
      isAlive=false;
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
      foodY=(int)(Math.random()*490);
  }
  
}

class Enemy
{
  int enemyX, enemyY, redEnemy, greenEnemy, blueEnemy, randomEnemyX, randomEnemyY;
  boolean isFinished=false;

  Enemy(int x, int y){
    enemyX= x;
    enemyY = y;
    redEnemy = 0;
    blueEnemy =0;
    greenEnemy = 0;
  }

  void show(){
    fill(redEnemy, greenEnemy, blueEnemy);
    rect(enemyX, enemyY, 20, 20);
  }

   void move(){
     randomEnemyX = (int)((Math.random()*20)-10);
     randomEnemyY = (int)((Math.random()*20)-10);
     if(enemyX<490 && enemyX>22){
       enemyX= enemyX + randomEnemyX;
     }
     if(enemyY<490 && enemyY>22){
     enemyY = enemyY + randomEnemyY;
     }
     if(isFinished==true){
      randomEnemyX=0;
      randomEnemyY=0;
     }
      }
  
  }



