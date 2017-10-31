// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0a3
// mercredi, 1 octobre 2014

ArrayList maListe = new ArrayList();
Objet objet;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();

  for (int i = 0; i <=40; i++) {
    maListe.add(new Objet(200+(i*5)));
  }
}

void draw() {
  // background(0);

  for (int i = maListe.size ()-1; i >= 0; i--) {
    if (((Objet)maListe.get(i)).position.x > width) {
      ((Objet)maListe.get(i)).kill();
    } else {
      ((Objet)maListe.get(i)).update();
      ((Objet)maListe.get(i)).display();
    }
  }
}

class Objet {
  private PVector position, vitesse, acceleration;
  int posY, diametre;
  color c;

  Objet(int y) {
    posY = y;
    position = new PVector(0, y, 0);
    vitesse = new PVector(random(1,2), 0, 0);
    acceleration = new PVector();
    diametre = 3;
    c = color (0, random(150, 255), 255);
    acceleration.set(0, random(-0.01, 0.01), 0);
  }

  void update() {
    acceleration.set(0, random(-0.1, 0.1), 0);
    vitesse.add(acceleration);
    vitesse.limit(2);
    position.add(vitesse);
  }

  void display() {
    noStroke();
    fill(red(c), green(c), blue(c), map(position.x, 0, width, 255, 0));
    ellipse(position.x, position.y, diametre, diametre);
  }

  void kill() {
    maListe.remove(this);
  }
}

void mousePressed() {
  background(0);
  maListe.clear();
  for (int i = 0; i <=40; i++) {
    maListe.add(new Objet(200+(i*5)));
  }
  for (int i = maListe.size ()-1; i >= 0; i--) {
    ((Objet)maListe.get(i)).position = new PVector(0, ((Objet)maListe.get(i)).posY, 0);
    ((Objet)maListe.get(i)).vitesse = new PVector(random(1,2), 0, 0);
    ((Objet)maListe.get(i)).acceleration = new PVector(0, random(-0.01, 0.01), 0);
  }
}

void keyPressed() {
  println(maListe.size());
}

