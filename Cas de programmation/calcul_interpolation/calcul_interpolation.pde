stroke(0);
int nb_pas = 10;

float distance_enjambee = width/nb_pas;
println(distance_enjambee);
println();

float deltax;

for (int i = 0; i <= nb_pas; i++) { // 11 bornes = 10 intervalles
  
  // Si l’on veut que le 11ième point soit visible dans le sketch
  //deltax = lerp(0, width-1, i/(float)nb_pas);
  
  // Si l’on veut que deltax soit égal à distance_enjambee
  // bien que le 11 ième point ne sera pas dessiné, puisque
  // en dehors du sketch, de 1 pixel.
  // Le dernier pixel du côté droit est situé à 99 pour un sketch de 100 pixels de large
  deltax = lerp(0, width, i/(float)nb_pas);
  
  // Prendre note que le troisième argument de lerp()
  // est calculé avec la division de i par le nombre de pas,
  // en s’assurant de convertir le diviseur en float
  // s’il s’agit d’une variable de type entier.
  
  // On dessine les bornes de part et d’autre des intervalles
  point(deltax,50);
  
  println(deltax);
  //println(round(deltax));
}