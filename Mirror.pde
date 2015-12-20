float [] x = new float [3000];
Player player;
int state = 0; //starting state
float x_axis = 0;

void setup(){
  
  size(1000,600);
  smooth();
  noStroke();
  player = new Player();
  for (int i = 0; i<x.length; i+=1){
    x[i] = random(-1000,200);
  }
}
  

void draw(){
  background(50);
  fill(255);
  rect(width/2-5,10,10,height-20);
  
  
  switch (state)
  {
    case 0:
      player.display();
  
      for (int i = 0; i<x.length;i++){
        x[i] += 0.5;
        float y = i * 8;
        fill(255);
        arc(y-=0.01, x[i], 12, 12, 0.52, 5.76);
        x_axis = y-=0.01;
        ellipse(x_axis, x[i], 12,12);
      }
    break;
    case 1:
      badend();
    break;
    default:
      println("This is default");
    break;
  }
  
}

void badend(){
  background(50);
  textSize(30);
  text("Hahaha! You hit the wall!", width/2-180, height/2);
}


class Player{
   float x = mouseX;
   float y = mouseY;
   void display(){
     noStroke();
     if(x < width/2-5){
       fill(125,233,193);
       rect(x,y,24,24);
       rect(width-x,height-y,24,24);
     }else{
       state += 1;
     }
     if(abs(x - x_axis) < 24.0 && abs(y - x[i]) < 24.0){
       state += 1;
     }else{
       println("Keep going!");
     }
   }
}
