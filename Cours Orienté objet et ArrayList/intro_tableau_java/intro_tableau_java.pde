// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// mardi, 3 octobre 2017

// Array classique dans Processing :
float [] mon_tableau = new float[10];

// Tableau Java :
ArrayList<Flocon> flocons = new ArrayList<Flocon>();



void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
  flocons.add(new Flocon());


  flocons.add(new Flocon(50, color(255)));

  println(flocons.size());

  println(flocons.get(0).taille);


  flocons.get(0).taille = 200;
}

void draw() {
  background(0);


  //for (Flocon f : flocons) {
  //  f.display();
  //}

  if (flocons.size() > 0) {

    for (int i = 0; i < flocons.size(); i++) {
      //Flocon f = flocons.get(i);
      //f.display();
      flocons.get(i).update();
      if (flocons.size() > 0) {
        flocons.get(i).display();
      }
    }
  }

  //for (int i = flocons.size()-1; i >= 0; i--) {
  //  //Flocon f = flocons.get(i);
  //  //f.display();

  //  flocons.get(i).display();
  //}

  //flocons.get(0).display();
  //flocons.get(flocons.size()-1).display();

  println(flocons.size());
}


void mousePressed() {
  flocons.add(new Flocon(int(random(100)), color(random(255))));
  //println(flocons.size());
}

void mouseReleased() {
  //println(flocons.get(flocons.size()-1).index);
  //flocons.remove(0);
  flocons.clear();
}



class Flocon {
  // Variables membres
  int taille, posx, posy, index;
  color couleur;
  boolean agrandir;

  // Constructeur(s)
  Flocon() {
    posx = mouseX;
    posy = mouseY;
    taille = int(random(10, 200));
    couleur = color(240, 0, 0, 100);
    agrandir = true;
    index = flocons.size();
  }

  Flocon(int _t) {
    posx = mouseX;
    posy = mouseY;
    taille = _t;
    couleur = color(240, 0, 0);
    agrandir = true;
    index = flocons.size();
  }

  // taille, couleur et index
  Flocon(int _t, color _c) {
    posx = mouseX;
    posy = mouseY;
    taille = _t;
    couleur = _c;
    agrandir = true;
    index = flocons.size();
  }

  // Méthodes
  void update() {

    //if (taille >= width-100) {
    //  taille = width-100;
    //} else {
    //  taille++;
    //}



    if (taille >= width-100) {
      flocons.remove(this);
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