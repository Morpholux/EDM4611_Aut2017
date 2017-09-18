// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3
// vendredi, 7 avril 2017
PFont font;
int nbcotes, rayon;
// Mettre à true pour sauvegarder les frames
boolean onSauve = false;
color c1, c2;

void setup() {
  size(800, 800);
  background(0);
  font = loadFont("ATOurBodoni-Regular-250.vlw");
  textFont(font);
  textAlign(CENTER);
  c1 = color(90);
  c2 = color(150);
}

void draw() {
  if (frameCount <= 1000) {
    background(lerpColor(c1, c2, norm(frameCount%100, 0, 100)));
    noFill();
    stroke(0, 50);
    nbcotes = int(random(5, 16));
    rayon = int(random(10, 50));
    pushMatrix();
    translate(width/2, height/2);
    rotate(random(TWO_PI));
    pushMatrix();
    translate(100, 100);
    for (int i = 0; i < 20; i++) {
      translate(0, 3);
      rotate(6);
      scale(1.125);
      strokeWeight(1-(i*0.05));
      figurePolygonale();
    }
    popMatrix();
    popMatrix();

    fill(255);
    noStroke();
    translate(0, 70);
    text(str(frameCount), width/2, height/2);

    if (onSauve) {
      saveFrame("images/frame-####.png");
    }
  } else {
    exit();
  }
}

void figurePolygonale() {
  beginShape();
  for (int i = 0; i < nbcotes; i++) {
    vertex(rayon * (cos(TWO_PI*(i/float(nbcotes)))), rayon * (sin(TWO_PI*(i/float(nbcotes)))));
  }
  endShape(CLOSE);
}