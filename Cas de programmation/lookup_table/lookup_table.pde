// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0b6
// mardi, 29 septembre 2015
int reso = 180;
float [] [] pointsCercle = new float [reso][2]; // équivaut à {{x,y},{x,y},…}
float rayon = 200.0;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
  noLoop();
  
  for (int i=0; i<reso; i++) {
    // map(i,0,reso,0,TWO_PI);
    pointsCercle[i][0] = rayon * (cos(TWO_PI*(i/float(reso))));
    pointsCercle[i][1] = rayon * (sin(TWO_PI*(i/float(reso))));
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  
  for (int i=0; i<reso; i++) {
    ellipse(pointsCercle[i][0], pointsCercle[i][1], 2, 2);
    //println("x : "+pointsCercle[i][0]);
    //println("y : "+pointsCercle[i][1]);
    //println();
  }
}