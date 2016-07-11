float [] x = new float [3000];
float [] recordY = new float [3000];
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
    recordY[i] = 1000;
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
      float tempY;
      for (int i = 0; i<x.length;i++){
        x[i] += 2.5;
        float y = i * 12;
        fill(255);
        tempY = y-=0.01;
        recordY[i] = tempY;
        arc(tempY, x[i], 12, 12, 0.52, 5.76);
        x_axis = y-=0.01;
//        ellipse(x_axis, x[i], 12,12);
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
   void display(){
     noStroke();
     if(mouseX < width/2-5){
       fill(125,233,193);
       rect(mouseX,mouseY,24,24);
       rect(width-mouseX,height-mouseY,24,24);
     }else{
       state += 1;
     }

  for (int i=0;i<x.length;i++)
     {
//       if(abs(mouseX - recordY[i]) < 5.0 && abs(mouseY - x[i]) < 5.0){
      if(abs(mouseX - recordY[i]) < 7.0 && abs(mouseY - x[i]) < 7.0){         state += 1;
         break;
       }else{
//           println(i+"is"+recordY[i]+" "+x[i]);
//         println("Keep going!");
       }
     }
   }
}
