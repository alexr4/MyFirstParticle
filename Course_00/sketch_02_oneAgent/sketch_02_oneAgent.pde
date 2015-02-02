//variables du sketch 
int pWidth = 1280;
int pHeight = 720;

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
}

void draw()
{
  background(255);
  
  myBall.run();
  
  myBall2.run();
}
