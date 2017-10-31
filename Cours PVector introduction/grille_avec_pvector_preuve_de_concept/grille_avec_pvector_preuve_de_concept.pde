// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0
// samedi, 3 octobre 2015

PVector vh, vv, vPoint; // vecteur horizontal, vecteur vertical, vecteurPoint de la grille
float magnitude = 55;

void setup() {
  size(600, 600);
  background(0);

  noFill();
  noStroke();

  vh = new PVector(1, 0, 0);
  vv = new PVector(0, 1, 0);
  vPoint = new PVector(); // aucune valeur pour l’instant.
  vh.setMag(magnitude);
  vv.setMag(magnitude);
  noLoop();
}

void draw() {
  background(0);
  // Transformateur géométrique de translation.
  // N’est pas cumulatif d’un frame à l’autre.
  // Permet de déplacer la coordonnée d’origine du sketch.
  translate(50, 50);

  // Montrer nouveau point d’origine
  pushStyle();
  fill(255, 0, 0);
  ellipse(0, 0, 2, 2);
  popStyle();

 // 2. Version avec deux boucles imbriquées
  for (int j = 0; j < 10; j++) {
    for (int i = 0; i < 10; i++) {

      PVector vTemp1 = new PVector();
      vTemp1 = vh.copy();
      vTemp1.setMag(vh.mag() * i);

      PVector vTemp2 = new PVector();
      vTemp2 = vv.copy();
      vTemp2.setMag(vv.mag() * j);

      // Addition des vecteur horizontal et vertical
      vPoint = PVector.add(vTemp1, vTemp2);
      // Le vecteur temporaire vPoint pointe désormais du coin gauche de la grille vers l’un de ses 100 points.
      dessinFleche(vPoint, color(255));

    }
  }
}

// Fonction de dessin d’une flèche orientée
void dessinFleche( PVector monVect, color c) {
  // orientation de la flèche
  float theta = monVect.heading2D();
  // ligne de la flèche
  stroke(c,100);
  noFill();
  line(0, 0, monVect.x, monVect.y);
  // pointe de la flèche
  if (monVect.mag() > 0) {
    pushMatrix();
    translate(monVect.x, monVect.y);
    rotate(theta);
    noStroke();
    fill(c);
    beginShape();
    vertex(2, 0);
    vertex(-12, 6);
    vertex(-4, 0);
    vertex(-12, -6);
    endShape(CLOSE);
    popMatrix();
  }
}