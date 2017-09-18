// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.2.1
// jeudi, 15 septembre 2016

// Trois stratégies pour placer des coordonnées x et y en mémoire dans un tableau.
// Précision : ces stratégies excluent temporairement les approches de type ArrayList ou floatList.


int nbCases = 50; // nombre d’entrées

// Deux tableaux, un pour chaque coordonnée
float [] posX = new float [nbCases];
float [] posY = new float [nbCases];

// Un tableau à deux dimensions
float [][] pos = new float [nbCases][2]; // Le chiffre 2 indique un sous tableau à deux cases

// Un tableau de PVector
PVector [] pv = new PVector[nbCases];



void setup() {
  size(200, 200);
  background(0);
  fill(255);
  noStroke();
  noLoop();

  // Pour le tableau de PVector, il faut le remplir d’objets
  for (int i = 0; i < nbCases; i++) {
    pv[i] = new PVector(0, 0, 0);
  }
  // Tandis que pour les deux autres types de tableau,
  // ils sont d’office initialisés avec des valeurs 0.
}

void draw() {
  background(0);

  // Méthode 1
  posX[frameCount%posX.length] = mouseX;
  posY[frameCount%posY.length] = mouseY;

  // Méthode 2
  pos[frameCount%pos.length][0] = mouseX;
  pos[frameCount%pos.length][1] = mouseY;

  // Méthode 3
  pv[frameCount%pv.length] = new PVector(mouseX, mouseY, 0);

  // Note : le %(modulo) 10 nous permet d’enregistrer les valeurs en boucle,
  // même lorsque le frameCount dépasse la taille des tableaux.


  // Dessin de points selon les trois méthodes
  for (int i = 0; i < nbCases; i++) {
    //ellipse(posX[i], posY[i], 2, 2);
    //ellipse(pos[i][0], pos[i][1], 2, 2);
    ellipse(pv[i].x, pv[i].y, 2, 2);
  }
}

void mouseReleased() {
  // Méthode deux arrays
  println("Liste posX");
  printArray(posX);
  println();
  println("Liste posY");
  printArray(posY);

  // Méthode Array à deux dimensions [][]
  println();
  println("Liste pos");
  printArray(pos);
  println(pos[9][0]+", "+pos[9][1]);

  // Méthode PVector
  println();
  println("Liste pv");
  printArray(pv);
  println(pv[9].x + ", " + pv[9].y);
}


// Chaque déplacement de souris modifie le contenu des tableaux
void mouseMoved() {
  redraw();
}