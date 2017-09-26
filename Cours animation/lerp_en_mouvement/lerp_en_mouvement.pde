// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// mardi, 26 septembre 2017

float valeurDepart = 0.0;
float valeurArrivee = 100.0;
float valeurInterm;


void setup() {
  size(100, 100);
  background(0);
  fill(255);
  noStroke();
}

void draw() {
  background(0);
  
  valeurInterm = lerp(valeurDepart, valeurArrivee, millis()*0.001%1.0);
  
  // Quatre arguments : ratio du parcours, point de départ, distance à parcourir, durée du parcours
  valeurInterm = easeInQuart(millis()*0.001%1.0, valeurDepart, valeurDepart+ valeurArrivee, 1.0);
  ellipse(valeurInterm, 50, 2,2);
}

float easeInQuart (float t, float b, float c, float d) {
  return c*(t/=d)*t*t*t+b;
}