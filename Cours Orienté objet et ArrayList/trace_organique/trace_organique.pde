// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0a3
// 30 septembre 2014

ArrayList maListe = new ArrayList();

//Objet o1 = new Objet();
//Objet o2 = new Objet();

//Objet objet;
float vitesseSouris;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
}

void draw() {
  background(0);
  // La classe gère elle-même les créations et les disparitions des objets dans le Arraylist
  // Pour éviter les effets de flickering, il faut contrôler l’affichage (méthode afficher)
  // en exploitant la boucle for du Arraylist dans l’ordre inverse.
  // Ainsi, même lorsqu’un objet est détruit, les objets qui seront déplacés d’index dans le Arraylist
  // avaient déjà été traités.
  // http://forum.processing.org/one/topic/arraylist-remove-object-causes-flickering-problem-rendering.html
  for (int i = maListe.size()-1; i >= 0; i--) {
    ((Objet)maListe.get(i)).display();
  }



  println(maListe.size());
  // Voici la boucle en mode habituel, qui posait un problème d’affichage
  /*
  for(int i = 0; i < maListe.size(); i++) {
   ((Objet)maListe.get(i)).afficher();
   }
   */
}



void mouseDragged() {
  vitesseSouris = ((abs(mouseX-pmouseX))+(abs(mouseY-pmouseY)))*2;
  maListe.add(new Objet(mouseX, mouseY, vitesseSouris));
}

void keyPressed() {
  //maListe.clear();
   //maListe.remove(0);
}