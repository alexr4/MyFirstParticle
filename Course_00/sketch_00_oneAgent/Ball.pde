class Ball
{
  //variables
  float x;
  float y;
  float bWidth;
  float bHeight;
  
  //constructeur
  Ball()
  {
    //position
    x = width/2;
    y = height/2;
    
    //taille
    bWidth = 20;
    bHeight = 20;
  }
  
  //méthodes
  void display()
  {
    noStroke();
    fill(0);
    ellipse(x, y, bWidth, bHeight);
  }
}
