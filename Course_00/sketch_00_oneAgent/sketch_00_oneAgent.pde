//variables du sketch 
int pWidth = 1280;
int pHeight = 720;

//balle
Ball myBall;

void setup()
{
  size(pWidth, pHeight, P2D);
  smooth(8);
  
  //initialisation de mon objet ball
  myBall = new Ball();
}

void draw()
{
  background(255);
  
  myBall.display();
}
