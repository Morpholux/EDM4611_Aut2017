// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// mardi, 26 septembre 2017

int temps0 = 0;
int temps1 = 0;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  stroke(255);
  //println(frameRate);
}

void draw() {
  background(0);
  //println(frameRate);

  //if (frameRate >= 60) {
  //  println(frameCount);
  //  exit();
  //}

  //if (frameCount > 600) {
  //  println(millis()*0.001);
  //  exit();
  //}


  //if (millis()*0.001 >= 5) {
  //  println(millis()*0.001);
  //  exit();
  //}


  //if (frameCount == 60) {
  //  temps0= millis();
  //} else if (frameCount == 61) {
  //  temps1= millis();

  //  //println((temps1 - temps0)*0.001);
  //  println(temps0);
  //  println(temps1);
  //  println(temps1 - temps0);
  //  exit();
  //}
  
  
  float hauteur = (millis()*0.1)%height;
  line(0, hauteur, width, hauteur);
  
  
}