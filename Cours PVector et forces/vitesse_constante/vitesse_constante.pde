// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0
// vendredi, 9 octobre 2015

// Exemple de gestion du déplacement par PVector.
// Cas simple d’un seul mobile à vitesse constante.

Mobile m1;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
  rectMode(CENTER);
  m1 = new Mobile();
}

void draw() {
  background(0);

  m1.update();
  m1.display();
}

class Mobile {
  PVector loc, vel;
  float angle;

  Mobile() {
    // Position initiale du mobile :
    loc = new PVector(100, 300);

    // C’est maintenant le temps de préciser la direction du déplacement:
    vel = new PVector(1, -0.75, 0);

    // Puis on fixe l’envergure des enjambées de notre vecteur.
    // Icic, il s’agit d’un déplacement équivalant à 2 pixels par frame.
    // La distance parcoure est la même, peut importe que le déplacement se fasse
    // parallèlement à l’un des deux axes du plan cartésien ou pas.
    vel.setMag(2);

    // On règle l’orientation du mobile.
    angle = vel.heading();
  }

  void update() {
    // Comme l’opération est non-statique (le vecteur loc est modifié à chaque cycle du draw)
    // l’emplacement du mobile est régulièrement décalé par le vecteur de vitesse,
    // suivant le même direction et avec la même vélocité.
    loc.add(vel);

    // On appelle la méthode qui permet de vérifier le contact avec les bords du sketch.
    boucleTopologique();

    // Mise à jour de l’orientation du carré dans l’axe de déplacement
    // seulement s’il y a déplacement :
    if (vel.mag() > 0) {
      angle = vel.heading();
    }
  }

  void display() {
    //Recours aux transformateurs géométriques, en raison de l’utilisation de la rotation
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    //rect(0, 0, 50, 5);
    // Forme de l’objet :
    beginShape();
    vertex(-20,0);
    vertex(20,-4);
    vertex(20,-8);
    vertex(30,0);
    vertex(20,8);
    vertex(20,4);
    endShape(CLOSE);
    popMatrix();
  }

  // Pour continuer de suivre le déplacement de notre mobile
  // lorsqu’il quitte la zone du sketch.
  void boucleTopologique() {
    if (loc.x > width) {
      //loc.x = 0;
      loc.set(0, loc.y, 0);
    } else if (loc.x < 0) {
      loc.set(width, loc.y, 0);
    }

    if (loc.y > height) {
      //loc.y = 0;
      loc.set(loc.x, 0, 0);
    } else if (loc.y < 0) {
      loc.set(loc.x, height, 0);
    }
  }
}

// Comment arrêter ou inverser le mouvement suivant un événement précis.
void mousePressed() {
  // En multipliant la vélocité par 0, on réduit la magnitude à néant
  m1.vel.mult(0);
  
  // Pour inverser la direction simplement multiplier le vecteur par -1
  //m1.vel.mult(-1);
}

// Comment le relancer dans une autre direction, avec une autre vitesse.
void mouseReleased() {
  //m1.vel.set(random(-1,1),random(-1,1),0);
  // ou bien
  m1.vel = PVector.random2D();
  m1.vel.setMag(random(1, 5));
}