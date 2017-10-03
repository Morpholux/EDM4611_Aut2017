// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// mardi, 3 octobre 2017

// Array classique dans Processing :
float [] mon_tableau = new float[10];

// Tableau Java :
ArrayList<Flocon> flocons = new ArrayList<Flocon>();

Flocon f1, f2;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
  f1 = new Flocon();


  f2 = new Flocon(50, color(240, 0, 0));
}

void draw() {
  background(0);

  f1.update();
  f1.display();
}


void mousePressed() {
  f1 = new Flocon();
  println(f1.taille);
}



class Flocon {
  // Variables membres
  int taille;
  color couleur;
  boolean agrandir;

  // Constructeur(s)
  Flocon() {
    taille = int(random(10, 200));
    couleur = color(240, 0, 0);
    agrandir = true;
  }

  Flocon(int _t) {
    taille = _t;
    couleur = color(240, 0, 0);
    agrandir = true;
  }

  Flocon(int _t, color _c) {
    taille = _t;
    couleur = _c;
    agrandir = true;
  }

  // Méthodes
  void update() {
    
    //if (taille >= width-100) {
    //  taille = width-100;
    //} else {
    //  taille++;
    //}
    
    
    
    if (taille >= width-100) {
      agrandir = false;
    } else if (taille <= 10) {
      agrandir = true;
    }

    if (agrandir) {
      taille ++;
    } else {
      taille --;
    }
  }

  void display() {
    noStroke();
    fill(couleur);
    ellipse(width/2, height/2, taille, taille);
  }
}