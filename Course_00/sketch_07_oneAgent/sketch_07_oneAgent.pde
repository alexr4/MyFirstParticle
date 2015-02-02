//variables du sketch 
int pWidth = 1000;
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

  for (int i = 0; i<100; i++)
  {
    listBall.add(new Ball(random(width), random(height)));
  }

  background(255);
}

void draw()
{
  background(255);

  myBall.run();  
  myBall2.run();

  //utilisation du tableau
  for (int i=0; i<listBall.size (); i++)
  {
    Ball b = listBall.get(i);
    b.run();

    for (int j=0; j<listBall.size (); j++)
    {
      Ball b2 = listBall.get(j);
      float distance = dist(b.x, b.y, b2.x, b2.y);
      float minDist = b.bWidth/2 + b2.bWidth/2;
      float c = map(distance, 0, 200, 255, 0);

      if (distance < 200)
      {
        stroke(0, c);
        line(b.x, b.y, b2.x, b2.y);
      }

      if (distance < minDist)
      {
        b.inverserVitesse();
        b2.inverserVitesse();
      }
    }

    if (b.lifeTime <= 0)
    {
      listBall.remove(i);
    }
  }

  //ajouter des balls
  if (mousePressed)
  {
    listBall.add(new Ball(mouseX, mouseY));
  }

  //supprimer des balls
  if (listBall.size() > 150)
  {
    listBall.remove(0);
  }

  //collision
  float d = dist(myBall.x, myBall.y, myBall2.x, myBall2.y);
  float minDist = myBall.bWidth /2 + myBall2.bWidth /2;

  if (d < minDist)
  {
    myBall.inverserVitesse();

    myBall2.inverserVitesse();
  } else
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




