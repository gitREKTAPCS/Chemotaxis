Bacteria swagMasta = new Bacteria();
 void setup()   
 {     
 	//initialize bacteria variables here  
 	size(512, 512); 
 	background(1);
 }   
 void draw()   
 {    
 	swagMasta.show();
 	swagMasta.walk();
 }  
 class Bacteria    
 {     
 	int myX, myY;

 	Bacteria(){
 		myX = 250;
 		myY = 250;
 	}

 	void show(){
 		fill(250, 0, 0);
 		ellipse(myX, myY, 50, 50);
 	}

 	void walk(){
 		myX= myX + (int)(Math.random()*5)-2;
 		myY = myY + (int)(Math.random()*5)-2;
 	}
 }       