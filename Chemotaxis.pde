Bacteria[] swagMastas;
Foods chewy;
int randomRed=(int)(Math.random()*255)+1;
int randomBlue=(int)(Math.random()*255)+1;
int randomGreen=(int)(Math.random()*255)+1;
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
 	background(randomRed, randomBlue, randomGreen);
 	for (int j = 0; j < swagMastas.length; ++j) {
 		chewy.show();
 		swagMastas[j].show();
 		swagMastas[j].walk();
 		if((swagMastas[j].myX==chewy.foodX) && (swagMastas[j].myY==chewy.foodY)){
			chewy.eaten();
		}
 	}
 	
	
 }  

 //bacteria class
 class Bacteria    
 {     
 	int myX, myY;

 	Bacteria(){
 		myX = 256;
 		myY = 256;
 	}

 	void show(){
 		fill((int)(Math.random()*255)+1, (int)(Math.random()*255)+1, (int)(Math.random()*255)+1);
 		ellipse(myX, myY, 10, 10);
 	}

 	void walk(){
 		int randomX = (int)((Math.random()*5)-2.5);
 		int randomY = (int)((Math.random()*5)-2.5);
 		if(myX<512 && myX>0){
 			myX= myX + randomX;
 		}
 		if(myY<512 && myY>0){
 		myY = myY + randomY;
 		}
      }
}

class Foods
{
	int foodX, foodY;

	Foods(){
		foodX = 300;
		foodY = 250;
	}

	void show(){
		fill((int)(Math.random()*255)+1, (int)(Math.random()*255)+1, (int)(Math.random()*255)+1);
		rect(foodX, foodY, 20, 20);
	}

	void eaten(){
			foodX=(int)(Math.random()*512);
			foodY=(int)(Math.random()*512);
	}
	
}
