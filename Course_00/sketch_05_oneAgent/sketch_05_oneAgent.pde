//variables du sketch 
int pWidth = 500;
int pHeight = 500;

//balle
Ball myBall;
Ball myBall2;

//Tableau dynamique
ArrayList<Ball> listBall;

void setup()
{
  size(pWidth, pHeight, P2D);
  smooth(8);
  
  //initialisation de mon objet ball
  myBall = new Ball(100, 100);
  myBall2 = new Ball(200, 200);
  
  
  //initialisation du tableau dynamique
  listBall = new ArrayList<Ball>();
  
  for(int i = 0; i<30; i++)
  {
    listBall.add(new Ball(width/2, height/2));
  }
  
  background(255);
}

void draw()
{
  background(255);
  
  myBall.run();  
  myBall2.run();
  
  //utilisation du tableau
  for(int i=0; i<listBall.size(); i++)
  {
    Ball b = listBall.get(i);
    b.run();
  }
  
  //ajouter des balls
  if(mousePressed)
  {
     listBall.add(new Ball(mouseX, mouseY));
  }
  
  //supprimer des balls
  if(listBall.size() > 30)
  {
    listBall.remove(0);
  }
  
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
/*
void mousePressed()
{
  listBall.add(new Ball(mouseX, mouseY));
}


*/






