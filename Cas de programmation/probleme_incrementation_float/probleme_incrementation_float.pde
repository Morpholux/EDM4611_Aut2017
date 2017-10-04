float fraction = 0.0;

for (int i =0; i < 1000000; i++) {
  fraction += 0.005; // Méthode à proscrire
}

// La précision du cumul dépend de la petitesse
// de la valeur utilisée dans l’incrémentation.
// Par exemple, 0.5 ne semble pas montrer de défaillance
// mais 0.05, ou 0.005 (et ainsi de suite) donne des valeurs
// plus grandes ou plus petites que la cible attendue.
println(fraction);

// _ _ _ _

int entier = 0;

for (int i =0; i < 1000000; i++) {
  // Méthode préférable
  entier += 1;
  fraction = entier * 0.005;
}

println(fraction);