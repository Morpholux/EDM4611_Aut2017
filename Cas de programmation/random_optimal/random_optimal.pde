// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// mardi, 26 septembre 2017

float [] liste = new float[360000];

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
  
  // Un grand nombre de valeurs aléatoires sont placées en mémoire
  for(int i=0; i < liste.length; i++) {
    liste[i] = random(1.0);
  }
  
}

void draw() {
  background(0);
  float pige;
  
  // Boucle for, avec 10 millions d’opérations par frame
  for(int i=0; i < 10000000; i++) {
    // Approche de type Look Up Table
    // On accède aux valeurs aléatoires d’un tableau déjà construit
    // plutôt que d'effecteur une nouvelle pige comme telle
    pige = liste[i%liste.length];
    
    // L’approche ci-dessous fait chuter le frameRate
    //pige = random(1.0);
  }
  
  // Évaluation de la performance
  println(frameRate);
}