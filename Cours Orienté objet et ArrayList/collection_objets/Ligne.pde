class Ligne {
  // 1. variables membres
  PVector va, vb;
  color c;
  int id, alfa;
  float epaisseur, longueur, longueurMax, duree;

  // 2. Constructeur
  Ligne(PVector _va, PVector _vb, int _id) {
    va = _va.copy();
    vb = _vb.copy();
    id = _id;
    longueur = va.dist(vb);
    longueurMax = sqrt(zoneDessin*zoneDessin);
    duree = longueurMax-longueur;
    epaisseur = map(duree, 0, longueurMax, 20, 1);
    c = color(255);
    alfa = int(map(duree, 0, longueurMax, 50, 255));
    //duree *= 0.1;
  }

  // 3. Méthodes

  // Update pour la mise à jour des variables membres
  void update() {
    if (duree > 0) {
      duree--;
    } else {
      duree = 0;
    }
  }

  // Display pour les conditions d’affichage, ainsi que la gestion des objets de la ArrayList.
  void display() {
    if (duree > 0) {
      stroke(c, alfa);
      strokeWeight(epaisseur);
      noFill();
      line(va.x, va.y, vb.x, vb.y);
    } else {
      // IMPORTANT : les instructions qui suivent sont dans la dernière méthode appelée.
      // On retire l’instance (celle-là même concernée par ce code) de la liste.
      collectionLignes.remove(this);

      // On ajoute un nouvel objet à la fin du ArrayList :
      PVector vTempA = new PVector(random(marge, marge+zoneDessin), random(marge, marge+zoneDessin), 0);
      PVector vTempB = new PVector(random(marge, marge+zoneDessin), random(marge, marge+zoneDessin), 0);
      collectionLignes.add(new Ligne(vTempA, vTempB, id));

      // println(collectionLignes.size());
    }
  }
}