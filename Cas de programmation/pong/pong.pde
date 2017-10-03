// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.6
// vendredi, 29 septembre 2017

// Utilisez les touches flèches HAUT et BAS pour déplacer la palette
// et la barre d’espace pour afficher le travail d’analyse de détections (montrer les zones)

import processing.sound.*;
SoundFile soundfile;

// Instance de la classe Balle
Balle b;

// Variables globales
int diam = 30;
int hauteurPalette = 50;
int largeurPalette = 10;
int limiteX= 500;
int posyPalette;
int posxPalette = limiteX;
int borneZoneVerticaleGauche, borneZoneVerticaleDroite;
int borneZoneHorizHaut, borneZoneHorizBas;

// Activer si l'on veut rendre visible l'analyse de collision
// ou simplement appuyer sur la barre d'espace lors du visionnement
boolean afficheZone = false;

// Booléennes gestion touches clavier
boolean haut = false; 
boolean bas = false;

// Booléennes présence dans zones de collision
boolean croiseZoneVerticale = false;
boolean croiseZoneHorizontale = false;


void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
  noCursor();
  b = new Balle();
  // position initiale palette
  posyPalette = height/2;
  // Pour simplifier calculs de collision avec la palette (primitive rectangle)
  rectMode(CENTER);

  //Load a soundfile
  soundfile = new SoundFile(this, "son_pong.aif");
}

void draw() {
  background(0);
  // _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

  // 1 - Ajuster positionnement vertical de notre palette par incrémentation
  // Se fait dans le draw(), et dépend de l’état des variables booléennes haut et bas
  if (haut) {
    if (posyPalette <= hauteurPalette/2) {
      posyPalette = hauteurPalette/2; // limitation des déplacements au haut du sketch
    } else {
      posyPalette -=10;
    }
  } else if (bas) {
    if (posyPalette >= height-(hauteurPalette/2)) {
      posyPalette = height-(hauteurPalette/2); // limitation des déplacements au bas du sketch
    } else {
      posyPalette +=10;
    }
  }
  // Dessin palette mobile
  rect(limiteX, posyPalette, largeurPalette, hauteurPalette);

  // _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

  // 2 - Mise à jour de la position de la balle et affichage de celle-ci
  b.update();
  b.display();

  // _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

  // 3- Détection d’une collision

  // Test zone verticale
  // Attention : la largeur de cette zone doit être au moins aussi grande que le pas d’incrementation
  // de la balle, sinon on pourrait "échapper" certaines collisions
  borneZoneVerticaleGauche = posxPalette - (largeurPalette/2) - (diam/2); // pour effet visuel du contact entre masses blanches
  borneZoneVerticaleDroite = borneZoneVerticaleGauche + ceil(b.incrementx); // conversion de l'increment en entier, arrondi vers le haut
  if ((b.posx >= borneZoneVerticaleGauche) && (b.posx <= borneZoneVerticaleDroite)) {
    croiseZoneVerticale = true;
  } else {
    croiseZoneVerticale = false;
  }

  // Test zone horizontale
  borneZoneHorizHaut = posyPalette - (hauteurPalette/2) - (diam/2);
  borneZoneHorizBas = borneZoneHorizHaut + hauteurPalette + diam;
  if ((b.posy >= borneZoneHorizHaut) && (b.posy <= borneZoneHorizBas)) {
    croiseZoneHorizontale = true;
  } else {
    croiseZoneHorizontale = false;
  }


  // On valide le contact en fonction des deux conditions (les deux doivent être vrais)
  if ((croiseZoneVerticale) && (croiseZoneHorizontale)) {
    // modification de la variable membre de notre instance
    b.contact = true;
    b.sonJoue = true;
  }


  // _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

  // 4 - Jouer un son une fois par contact
  if (b.sonJoue) {
    soundfile.play();
    b.sonJoue = false;
  }



  // _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

  // 5 - Option d'affichage, pour mieux visualiser le travail d'évaluation des collisions
  if (afficheZone) {
    // On dessine la zone de détection de la collision
    pushStyle();
    noFill();
    stroke(255, 0, 0);
    line(b.posx, 0, b.posx, height);
    line(0, b.posy, width, b.posy);
    rectMode(CORNERS);
    rect(borneZoneVerticaleGauche, borneZoneHorizHaut, borneZoneVerticaleDroite, borneZoneHorizBas);
    popStyle();
  }
}

void keyPressed() {
  if (keyCode == UP) {
    haut = true;
  } else if (keyCode == DOWN) {
    bas = true;
  }

  if (key == ' ') {
    afficheZone=!afficheZone;
  }
}

void keyReleased() {
  haut = false;
  bas = false;
}


// Classe Balle
class Balle {
  // variables membres
  float posx, posy;
  float incrementx, incrementy;
  boolean contact;
  boolean sonJoue;

  // constructeur
  Balle () {
    // Valeurs par défaut à la création d'une instance

    posx = -diam; 
    posy = height/2; // départ toujours depuis le centre-gauche

    // Prendre note que la balle se déplacera à une vitesse pouvant varier
    // de 5 pixels à 10 pixels par frame.
    incrementx = 5 + constrain((frameCount*0.001), 0, 5); // augmentation progressive des vitesses, et donc, du niveau de difficulté
    incrementy = random(-2, 2);

    contact = false;
    sonJoue = false;
  }

  // méthode 1
  void update() {
    if (contact) {
      posx -= incrementx; // balle se déplace vers la gauche de l'écran
    } else {
      posx += incrementx; // balle se déplace vers la droite de l'écran
    }
    posy += incrementy; // déplacement suivant un angle

    // Lorsque la balle sort du sketch par l'un de ses côtés, on recrée une nouvelle instance
    if ((posx > (width+diam))||(posx < -diam)||(posy > (height+diam))||(posy < -diam)) {
      b = new Balle();
    }
  }

  // méthode 2
  void display() {
    ellipse(posx, posy, diam, diam);
  }
}