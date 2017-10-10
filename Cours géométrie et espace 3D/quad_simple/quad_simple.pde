// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// lundi, 9 octobre 2017

// Quad simple

void setup() {
  size(600, 600, P3D);
  background(0);
  
  //fill(255);
  //noStroke();
  
  // ou bien
  noFill();
  stroke(255);
}

void draw() {
  background(0);
  translate(width/2, height/2, 0);
  lights();
  
  //beginShape(QUAD);
  //// Sens anti-horaire
  //vertex(-100, -100, 0);
  //vertex(-100, 100, 0);
  //vertex(100, 100, 0);
  //vertex(100, -100, 0);
  //endShape();
  
  
  //beginShape(QUAD);
  //// Sens horaire
  //vertex(-100, -100, 0);
  //vertex(100, -100, 0);
  //vertex(100, 100, 0);
  //vertex(-100, 100, 0);
  //endShape();
  
  
  beginShape(QUAD_STRIP);
  // Alternance haut-bas (stitching en Z)
  vertex(-100, -100, 0);
  vertex(-100, 100, 0);
  vertex(100, -100, 0);
  vertex(100, 100, 0);
  endShape();
  
  
  //beginShape(TRIANGLE_STRIP);
  //// Alternance haut-bas (stitching en Z)
  //vertex(-100, -100, 0);
  //vertex(-100, 100, 0);
  //vertex(100, -100, 0);
  //vertex(100, 100, 0);
  //endShape();
  
}