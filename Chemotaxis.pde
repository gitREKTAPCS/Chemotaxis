Bacteria[] swagMastas;
int randomRed=(int)(Math.random()*255)+1;
int randomBlue=(int)(Math.random()*255)+1;
int randomGreen=(int)(Math.random()*255)+1;
 void setup()   
 {     
 	//initialize bacteria variables here  
 	size(512, 512); 
 	swagMastas = new Bacteria[325];
 	for (int i = 0; i < swagMastas.length; ++i) {
 		swagMastas[i] = new Bacteria();
 	}
 	
 }   
 void draw()   
 {    
 	background(randomRed, randomBlue, randomGreen);
 	for (int j = 0; j < swagMastas.length; ++j) {
 		swagMastas[j].show();
 		swagMastas[j].walk();
 	}
 }  
 class Bacteria    
 {     
 	int myX, myY;

 	Bacteria(){
 		myX = 250;
 		myY = 250;
 	}

 	void show(){
 		fill((int)(Math.random()*255)+1, (int)(Math.random()*255)+1, (int)(Math.random()*255)+1);
 		ellipse(myX, myY, 10, 10);
 	}

 	void walk(){
 		myX= myX + (int)((Math.random()*5)-2.5);
 		myY = myY + (int)((Math.random()*5)-2.5);
 	}
 }       