// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// lundi, 9 octobre 2017

// Quad_strip simple mémorisé dans un objet PShape
// On accède ensuite aux positions des vertex,
// afin de lire ou d’écrire de nouvelles coordonnées.

PShape s;

void setup() {
  size(600, 600, P3D);
  background(0);

  s = createShape();


  // Commandes d’affichage appliqué à l’objet PShape s
  s.setFill(false);
  s.setStroke(true);


  s.beginShape(QUAD_STRIP);
  //Autres commandes d’affichage du tracé qui doivent se trouver dans le beginShape() endShape()
  s.stroke(255);
  s.strokeWeight(1);

  // Alternance haut-bas (stitching)
  s.vertex(-100, -100, 0);
  s.vertex(-100, 100, 0);
  s.vertex(0, -100, 0);
  s.vertex(0, 100, 0);
  s.vertex(100, -100, 0);
  s.vertex(100, 100, 0);
  s.endShape();

  println(s.getVertex(5).x);

}

void draw() {
  background(0);
  translate(width/2, height/2, 0);
  //lights();

  shape(s);
}

void mousePressed() {
  // Modification d’un vertex
  s.setVertex(5, 200, 100, 0);
}

void mouseReleased() {
  // Modification d’un vertex
  s.setVertex(5, 100, 100, 0);
}