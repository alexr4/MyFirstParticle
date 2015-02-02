/*Tableau dynamique : cours du 02/02/15
 lien : http://eartinteractif.fr/2013/04/digital-lab-programmation-orientee-objet-generateur-de-particules/
 Liste des fonction d'un tableau dynamique
 
 1 - créer un tableau :
 ArrayList<Type de variable ou objet> nomDuTableau;
 ex2 : ArrayList<float> listDePosition; pour un tableau contenant des variables float
 ex1 : ArrayList<Object> listObject; pour un tableau contenant des objet de type class Object
 
 2 - instancier un tableau
 nomDuTableau = new ArrayList<Type de variable ou objet>();
 ex1 : listDePosition = new ArrayList<float>();
 ex2 : listObject = new ArrayList<Object>();
 
 3 - ajouter un élément au tableau
 nomDuTableau.add(valeur de la variable ou objet);
 ex1 : listDePosition.add(10.05);
 ex2 : listeObject.add(new Object());
 
 4 - Retirer un élément du tableau
 nomDuTableau.remove(index);
 ex1 : listDePosition.remove(0); pour retirer la variable contenu à l'index 0
 ex2 : listObject.remove(5); pour retirer l'object contenu à l'index 5
 
 5 - Récupérer la variable ou l'objet contenu à l'index i du tableau
 nomDuTableau.get(index);
 ex1 : float x = listDePosition.get(0); pour récupérer la variable contenu à l'index 0;
 ex2 : Object o = listObject.get(5); pour récuperer la variable contenu à l'index 5;
 
 6 - Connaître la taille du tableau
 nomDuTableau.size();
 ex1 : int nombreTotalDePosition = listPosition.size();
 ex2 : in nombreTotalDObjet = listObject.size();
 
 7 - Vider un tableau
 nomDuTableau.clear(); //tous les éléments sont supprimé
 ex1 : listDePosition.clear();
 ex2 : listObject.clear();
 */

//variables du sketch 
int pWidth = 1000;
int pHeight = 500;

/*Déclaration d'un tableau dynamique :
 Type de Tableau <Type d'objet ou de variable que contient le tableau> nom du tableau*/
ArrayList<Ball> listBall;
int nombreMaximumDeBalle;

void setup()
{
  size(pWidth, pHeight, P2D);
  smooth(8);


  /*initialisation du tableau dynamique
   Nom du tableau = nouveau tableau de type dynamique <Type d'objet ou de variable que contient le tableau> (de taille 0)*/
  listBall = new ArrayList<Ball>();

  //Remplir le tableau de nouvelle balles à des positions aléatoires
  nombreMaximumDeBalle = 30;
  for (int i = 0; i<nombreMaximumDeBalle; i++)
  {
    listBall.add(new Ball(random(width), random(height))); //nom du tableau . ajoute (nouvelle balle(à positionx, à position y));
  }

  background(255);
}

void draw()
{
 // background(255);

  //utilisation du tableau
  //Pour chaque balle comprise dans le tableau dynamique listBall
  for (int i=0; i<listBall.size (); i++)
  {
    //Soit b la Ball présente dans le tableau à l'index i (0, 1, 2, 3, ...)
    Ball b = listBall.get(i);
    //b .fait la fonction run(), fonction regroupant les comportement display(), deplacer(), rebondire et live();
    b.run();

    //Pour chaque balle suivante dans le tableau dynmaique listeBall
    for (int j=i+1; j<listBall.size (); j++)
    {
      //Soit b2 la Balle présente à l'index j (i+1) 
      Ball b2 = listBall.get(j);
      //Soit la variable distance la distance séparant la balle à l'index i de la balle  l'index j
      float distance = dist(b.x, b.y, b2.x, b2.y);
      //Soit la variable minDist la distance minimum entre ces deux balles
      float minDist = b.bWidth/2 + b2.bWidth/2;
      //Soit c la couleur proportionnelle à la distance entre les balles (de 0 pixel à 200 pixel des distance)
      float c = map(distance, 0, 200, 255, 0);

      //Si distance est inferieur à 200
      if (distance < 200)
      {
        //Alors dessine une ligne de la positione b à b2 de couleur c
        stroke(0, c);
        line(b.x, b.y, b2.x, b2.y);
      }

      //Si distance est inferieur à la distance minimum entre les balles
      if (distance < minDist)
      {
        //Alors b et b2 inversent leur vitesses respectives
        b.inverserVitesse();
        b2.inverserVitesse();
      }
    }

    //Si la varibale lifeTime de b est inferieur ou égale à zero
    if (b.lifeTime <= 0)
    {
      //Alors b est morte et est retiré du tableau listBall
      listBall.remove(i);
      //Alors on ajoute une balle au tableau listBall. Cette balle aura une position aléatoire
      listBall.add(new Ball(random(width), random(height)));
    }
  }

  //Si la souris est appuyée
  if (mousePressed)
  {
    //Alors on ajoute une balle au tableau listBall. Cette balle aura une position aléatoire
    listBall.add(new Ball(random(width), random(height)));
    
  }

  //Si la taille de listBall est superieur à la taille maximal autorisé
  if (listBall.size() > nombreMaximumDeBalle)
  {
    //Alors on retire du tableau la première (à l'index 0, premier index du tableau)
    listBall.remove(0);
  }
}



