
float valeurDepart = 0.0;
float valeurArrivee = 100.0;
float ratioTrajet;
int resolutionInterpolation = 10;
float valeurInterm;

void setup() {

  for (int i = 0; i <= resolutionInterpolation; i++) {
    ratioTrajet = i/float(resolutionInterpolation); // de 0.0 à 1.0
    valeurInterm = lerp(valeurDepart, valeurArrivee, ratioTrajet);
    // Quatre arguments : ratio du parcours, point de départ, distance à parcourir, durée du parcours
    valeurInterm = easeInQuart(ratioTrajet, valeurDepart, valeurDepart+valeurArrivee, 1.0);

    ellipse(valeurInterm, 50, 2, 2);
    println(valeurInterm);
  }
}

float easeInQuart (float t, float b, float c, float d) {
  return c*(t/=d)*t*t*t+b;
}



// Note importante :
// le float i/10.0f est plus précis que 0.1 et n’entraine pas des erreurs d’arrondissement
// Voir fiche référence à propos du type float dans Processing
// Il faut donc éviter l’emploi d’une incrémentation de type : ratioTrajet += 0.1;