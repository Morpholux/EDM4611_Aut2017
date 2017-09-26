// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0a3
// mardi, 23 septembre 2014

// ATTENTION : La libraire Processing Sound n’existe qu’avec la version 3 et +
// Sinon, substituer les lignes de code avec celles de la libraire externe Minim

import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

import processing.sound.*; // Avec version 3 de Processing
SoundFile soundfile;

/*
import ddf.minim.*;
 Minim minim;
 AudioSample punkt;
 */

float taille = 50, opaciteCercle = 0, opaciteFond = 0;

AniSequence seq1, seq2;

void setup() {
  size(600, 600);

  // you have to call always Ani.init() first!
  Ani.init(this);

  // create a sequence
  seq1 = new AniSequence(this);
  seq1.beginSequence();

  seq1.beginStep();
  seq1.add(Ani.to(this, 0.5, "taille", 500, Ani.BOUNCE_OUT));
  seq1.add(Ani.to(this, 0.2, "opaciteCercle", 255, Ani.BOUNCE_OUT));
  seq1.endStep();

  seq1.beginStep();
  seq1.add(Ani.to(this, 1.0, "taille", 460, Ani.EXPO_OUT));
  seq1.add(Ani.to(this, 2.0, "opaciteCercle", 0, Ani.CUBIC_IN));
  seq1.endStep();

  seq1.endSequence();

  // Deuxièeme séquence
  seq2 = new AniSequence(this);
  seq2.beginSequence();
  seq2.beginStep();
  seq2.add(Ani.to(this, 1.0, "opaciteFond", 255, Ani.EXPO_OUT));
  seq2.endStep();
  seq2.beginStep();
  seq2.add(Ani.to(this, 1.0, "opaciteFond", 0, Ani.EXPO_IN));
  seq2.endStep();
  seq2.endSequence();

  /*
  // Gestion du son avec Minim
   minim = new Minim(this);
   
   // load BD.wav from the data folder
   punkt = minim.loadSample( "son_5sec.mp3", // filename
   512      // buffer size
   );
   
   if ( punkt == null ) println("Ne trouve pas le son");
   */

  //Load a soundfile
  soundfile = new SoundFile(this, "son_5sec.aif");

  background(0);
  noStroke();
}

void draw() {
  background(0);

  fill(150, 30, 0, opaciteFond);
  rect(0, 0, width, height);

  //fill(0, opaciteFond);
  //ellipse(width/2, height/2, taille+50, taille+50);


  fill(255, opaciteCercle);
  ellipse(width/2, height/2, taille, taille);


  //if (seq.isEnded()) println("done");
  //else println("current time: "+seq.getTime()+"  current step: "+seq.getStepNumber()+" of "+seq.getStepCount());
}


void mousePressed() {
  seq1.start();
  seq2.start();


  soundfile.play();
  //punkt.trigger();
}

