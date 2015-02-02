//variables du sketch 
int pWidth = 500;
int pHeight = 500;

//balle
Ball myBall;
Ball myBall2;

void setup()
{
  size(pWidth, pHeight, P2D);
  smooth(8);
  
  //initialisation de mon objet ball
  myBall = new Ball(100, 100);
  myBall2 = new Ball(200, 200);
  
  background(255);
}

void draw()
{
 // background(255);
  
  myBall.run();  
  myBall2.run();
  
  
  //collision
  float d = dist(myBall.x, myBall.y, myBall2.x, myBall2.y);
  float minDist = myBall.bWidth /2 + myBall2.bWidth /2;
  
  if(d < minDist)
  {
    myBall.inverserVitesse();
    
    myBall2.inverserVitesse();
  }
  else
  {
  }
  
  float c = map(d, minDist, width, 0, 255);
  
  stroke(c);
  line(myBall.x, myBall.y, myBall2.x, myBall2.y);
}
