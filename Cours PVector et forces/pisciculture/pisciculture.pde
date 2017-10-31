// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0
// vendredi, 9 octobre 2015

// Exemple de gestion du déplacement par PVector.

// Plusieurs mobiles dans un arraylist. La répartition des objets
// dans l’espace dépend d’une valeur temporelle. Un concept qui nécessite
// des explications : le mouvement de chaque instance est identique,
// mais suivant des déphasages temporels distincts (le même mouvement,
// mais dans un temps futur). La variable timeSteps permet cette projection.
// Notons que losrque les écarts de temps sont réduits,
// les instances donnent l’impression de naviguer en banc, à l’instar de poissons.
// Le mouvement de chacun des membres de l’école (School Fish) se présente en écho
// au déplacement de son voisin.

ArrayList <Mobile> mobiles =  new ArrayList<Mobile>();
int nbMobiles = 100;


void setup() {
  //size(600, 600);
  fullScreen();
  background(0);
  fill(255);
  noStroke();

  for (int i = 0; i < nbMobiles; i++) {
    mobiles.add(new Mobile());
  }
}

void draw() {
  background(0);

  for (int i = 0; i < mobiles.size(); i++) {
    ((Mobile)mobiles.get(i)).update();
    ((Mobile)mobiles.get(i)).display();
  }
}

class Mobile {
  PVector loc, vel, glissement;
  float angle;

  int timeSteps;
  float noiseScale = 0.0005;
  float amplitude =90;
  float delta = 0;

  Mobile() {
    // Position initiale du mobile :
    loc = new PVector(width/2, height/2);

    // Direction de déplacement à la création de l'objet:
    vel = new PVector(0, -2, 0);

    // On règle l’orientation du mobile.
    angle = vel.heading();

    // IMPORTANT : La ligne de code qui permet de caractériser chacune des instances.
    // La différence entre les instances revient à imaginer les mêmes objets, mais
    // à des temps différents. Lorsque les piges au hasard sont rapprochées, 
    // les organismes donnent l’effet de bancs (school fishing).
    timeSteps = floor(random(1, 10000));
    noiseDetail(4, 0.54321);
  }

  void update() {

    // 1. Mise à jour constante de la force de déviation
    delta = ((noise(timeSteps*noiseScale))*amplitude)-(amplitude*0.5);
    delta = constrain(delta, -(amplitude*0.5), (amplitude*0.5));
    timeSteps++;
    glissement = PVector.fromAngle(delta);
    glissement.normalize();
    
    // Réduction de la force par rapport à un vecteur normé
    glissement.mult(0.05);

    // 2. Mise à jour de la vélocité selon la force de glissement
    vel.add(glissement);

    // 3. On limite la vélocité
    vel.limit(2);

    // 4. Mise à jour de l'emplacement selon la vélocité
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
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    // Forme de l’objet :
    beginShape();
    vertex(-20, 0);
    vertex(20, -4);
    vertex(20, -8);
    vertex(30, 0);
    vertex(20, 8);
    vertex(20, 4);
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

void mousePressed() {
  println(frameRate);
}