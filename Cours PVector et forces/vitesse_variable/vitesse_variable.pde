// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0
// vendredi, 9 octobre 2015

// Exemple de gestion du déplacement par PVector.
// Cas simple d’un seul mobile à vitesse variable (avec accélération ou décélération).

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
  PVector loc, vel, acc; // On ajoute un vecteur additionnel
  float angle;

  Mobile() {
    // Position initiale du mobile :
    loc = new PVector(100, 300);

    // Vélocité initiale du mobile:
    vel = new PVector(1, -0.75, 0);
    vel.setMag(2);

    // On règle l’orientation du mobile.
    angle = vel.heading();
    
    // Création d’une poussée selon une orientation donnée, par exemple,
    // la même que pour la vitesse initiale, mais avec une magnitude moindre :
    acc = new PVector();
    acc = vel.copy();
    acc.setMag(0.05);
    
    // Ou encore dans une direction particulière, comme avec la gravité :
    //acc = new PVector(0,1,0);
    //acc.setMag(0.05);
    
    // ATTENTION : les magnitudes du vecteur servant à l’accélération est souvent petite,
    // car il faut considérer l’effet cumulatif du calcul.
    // On verra d’ailleurs l’utilité de devoir limiter son effet, (méthode .limit())
    // évitant que l’objet ne cesse d’accélérer, ce dernier pouvant alors atteindre des vitesses
    // où chacun des pas de déplacement serait plus grand que la taille du sketch. Dès lors,
    // l’objet devient pratiquement perceptible, puisque c’est par chance qu’on peut le voir.
    // Il y aura comme un effet de scintillement.
  }

  void update() {
    // À réaliser dans le bon ordre :
    
    // 1. Mise à jour de la vitesse suivant l’accélération.
    vel.add(acc);
    
    // 2. Ajout pratiquement essentiel...
    // On limite l’effet de l’accélération sur la vitesse
    // en imposant une borne maximale à sa magnitude.
    vel.limit(10);
    
    // 3. Mise à jour de la position suivant la vitesse.
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
    vertex(-20, 0);
    vertex(20, -4);
    vertex(20, -8);
    vertex(30, 0);
    vertex(20, 8);
    vertex(20, 4);
    endShape(CLOSE);
    popMatrix();
  }

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

// On notera que tant que le vecteur d’accélération n’est pas modifié,
// et comme il demeure présent dans nos calculs de la méthode update(),
// le mobile finit toujours par se rediriger vers l’orientation établie initialement.
// Comme s’il s’agissait d’une force dominante et omniprésente dans l’écosystème :
// vent, courant d’eau, attraction...

void mousePressed() {
  // Pour inverser la direction simplement multiplier le vecteur par -1
  m1.vel.mult(-1);
  
  // Pour insérer une légère déviation par rapport à l’axe de la velocité
  PVector vPerpendiculaire = new PVector();
  PVector axeZ = new PVector(0,0,1);
  // Autant de chance de dévier à gauche ou à droite,
  // en raison de la direction du vecteur dans l’axe de l’écran (entre ou sort).
  if (random(1) > 0.5) {
    axeZ.mult(-1);
  }
  // Fixons à nouveau la magnitude de la vélocité
  m1.vel.setMag(3);
  // l’opérateur du produit vectoriel (qui n’est pas le produit scalaire .dot())
  vPerpendiculaire = m1.vel.cross(axeZ);
  vPerpendiculaire.setMag(0.75); // moindre que la magnitude de vélocité, donc écart de quelques degrées seulement.
  m1.vel.add(vPerpendiculaire);
}