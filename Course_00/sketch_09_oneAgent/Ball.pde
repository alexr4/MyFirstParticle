class Ball
{
  //variables
  float x;
  float y;
  float bWidth;
  float bHeight;

  float vx;
  float vy;

  float lifeTime;
  float incLifeTime;

  //constructeur
  Ball(float x_, float y_)
  {
    //position
    x = x_;
    y = y_;

    //taille
    bWidth = 10;
    bHeight = 10;

    //vitesse 
    vx = random(-1, 1);
    vy = random(-1, 1);

    //durée de vie
    lifeTime = random(300, 600);
    incLifeTime = random(0.25, 2);
  }

  //méthodes
  void run()
  {
    //display();
    deplacer();
    rebondir();
    live();
  }

  void display()
  {
    noStroke();
    fill(0);
    ellipse(x, y, bWidth, bHeight);
  }

  void deplacer()
  {
    x += vx;
    y += vy;
  }

  void rebondir()
  {
    //mur coté
    if (x<0 || x>width)
    {
      vx *= -1;
    }

    //mur plafond sol
    if (y<0 || y>height)
    {
      vy *= -1;
    }
  }

  void inverserVitesse()
  {
    vx *= -1;
    vy *= -1;
  }

  void live()
  {
    if (lifeTime > 0)
    {
      lifeTime -= incLifeTime;
    }
  }
}

