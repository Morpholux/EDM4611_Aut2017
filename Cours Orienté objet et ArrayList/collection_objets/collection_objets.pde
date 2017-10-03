// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0
// dimanche, 4 octobre 2015

// Plus les lignes sont grandes, plus elles disparaissent rapidement.
// Dès qu’une ligne disparaît, une autre est créée.

ArrayList<Ligne> collectionLignes = new ArrayList<Ligne>();
int nbLignes = 20;
int zoneDessin = 500, marge;

void setup() {
  size(600, 600);
  marge = floor((width-zoneDessin)*0.5);

  for (int i = 0; i < nbLignes; i++) {
    PVector vTempA = new PVector(random(marge, marge+zoneDessin), random(marge, marge+zoneDessin), 0);
    PVector vTempB = new PVector(random(marge, marge+zoneDessin), random(marge, marge+zoneDessin), 0);
    collectionLignes.add(new Ligne(vTempA, vTempB, i));
  }
}

void draw() {
  background(0);

  // Boucle for() avec itération à reculons (i--)
  // Forme à privilégier dès que l’on supprime dynamiquement des éléments de la liste.
  // Valeur de départ à collectionLignes.size()-1
  // Valeur d’arrivée à >= 0
  for (int i = collectionLignes.size()-1; i >= 0; i--) {
    ((Ligne)collectionLignes.get(i)).update();
    ((Ligne)collectionLignes.get(i)).display();
  }
}

void mousePressed() {
  // Dans le style «Enhanced loop» :
  for (Ligne ligne : collectionLignes) { // nom classe, nom arbitraire pour instance temporaire, nom ArrayList
    println("Ligne #"+ligne.id+" : "+ligne.longueur);
  }
}