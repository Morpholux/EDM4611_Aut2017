class Objet {
  // Variables membres
  float posX, posY;
  float taille;
  color c;

  // Constructeurs
  Objet () {
    c = color(255, 100);
  }
  
  Objet (float _posX, float _posY, float _taille) {
    posX = _posX;
    posY = _posY;
    taille = _taille;
    c  = color(255, 100);
  }

  // Méthodes
  void update() {
    
  }
  void display() {
    fill(c);
    if (taille > 2) {
      ellipse(posX, posY, taille, taille);
      taille *=0.975;
    } else {
      maListe.remove(this);
    }
  }
}