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
    bWidth = 20;
    bHeight = 20;
    
    //vitesse 
    vx = random(-2, 2);
    vy = random(-2, 2);
  }
  
  //méthodes
  void display()
  {
    noStroke();
    fill(0);
    ellipse(x, y, bWidth, bHeight);
  }
  
  void deplacement()
  {
    x += vx;
    y += vy;
  }
}
