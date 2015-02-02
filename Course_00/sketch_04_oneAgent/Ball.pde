class Ball
{
  //variables
  float x;
  float y;
  float bWidth;
  float bHeight;
  
  float vx;
  float vy;
  
  //constructeur
  Ball(float x_, float y_)
  {
    //position
    x = x_;
    y = y_;
    
    //taille
    bWidth = 100;
    bHeight = 100;
    
    //vitesse 
    vx = random(-2, 2);
    vy = random(-2, 2);
  }
  
  //méthodes
  void run()
  {
    //display();
    deplacer();
    rebondir();
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
    if(x<0 || x>width)
    {
      vx *= -1;
    }
    
    //mur plafond sol
    if(y<0 || y>height)
    {
      vy *= -1;
    } 
  }
  
  void inverserVitesse()
  {
    vx *= -1;
    vy *= -1;
  }
}
