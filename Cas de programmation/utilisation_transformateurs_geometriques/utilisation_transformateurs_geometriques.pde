// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// dimanche, 24 septembre 2017

boolean onSauve = false;

void setup() {
  size(600, 600);
  background(0);
  fill(150, 0, 0, 80);
  stroke(255);
  smooth(8);
}

void draw() {
  //background(0);

  pushStyle();
  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);
  popStyle();

  if (frameCount%10 == 0) {


    // On déplace les coordonnées 0, 0 au centre du sketch
    translate(width/2, height/2);

    // Transformateurs d'échelle
    float echelle = 0.9;
    scale(echelle);
    // avec largeur de trait compensé
    strokeWeight(1.0 / echelle);


    int subdivisions_rotation = 3;
    for ( int i = 0; i < subdivisions_rotation; i++) {

      // effet cumulatif puisque aucun pushmatrix-popmatrix
      rotate(TWO_PI/subdivisions_rotation);

      // une pige, puis deux valeurs influencées par les précédentes
      float deltax0 = 25+random(25);
      float deltax1 = deltax0*0.5; // deux fois plus mince
      float deltax2 = deltax1*0.5; // encore deux fois plus mince

      pushMatrix(); // figure base
      rotate(random(-0.5, 0.5));
      figure(deltax0);

      pushMatrix(); // étage 1, gauche
      translate(-deltax0, -100);
      rotate(random(-0.75, 0));
      figure(deltax1);

      pushMatrix(); // étage 2, gauche
      translate(-deltax1, -100);
      rotate(random(-0.75, 0));
      figure(deltax2);
      popMatrix();

      pushMatrix(); // étage 2, droit
      translate(deltax1, -100);
      rotate(random(0, 0.75));
      figure(deltax2);
      popMatrix();

      popMatrix();

      pushMatrix(); // étage 1, droit
      translate(deltax0, -100);
      rotate(random(0, 0.75));
      figure(deltax1);

      pushMatrix();  // étage 2, gauche
      translate(-deltax1, -100);
      rotate(random(-0.75, 0));
      figure(deltax2);
      popMatrix();

      pushMatrix();  // étage 2, droit
      translate(deltax1, -100);
      rotate(random(0, 0.75));
      figure(deltax2);
      popMatrix();

      popMatrix();
      popMatrix();
    }
  }
  if (onSauve) {
    // sauvegarde fichier matriciel
    save("rendu.png");

    onSauve = false;
  }
}


void keyPressed() {
  if (key == ' ') {
    onSauve = true;
  }
}


void figure(float w) {
  beginShape();
  vertex(0, 0);
  bezierVertex(0, -50, -w, -100, -w, -100);
  vertex(w, -100);
  bezierVertex(w, -100, 0, -50, 0, 0);
  endShape();
}