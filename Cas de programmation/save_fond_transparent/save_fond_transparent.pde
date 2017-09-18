// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.3.3
// dimanche, 21 mai 2017

PGraphics layer;


void setup() {
  size(600, 600);
  layer = createGraphics(600, 600);
  layer.smooth(8);
}

void draw() {
  background(127);
  
  layer.beginDraw();
  layer.clear(); // utile pour voir le PGraphics dans le sketch sans artefact, étant donné le draw() en boucle
  layer.ellipse(300, 300, 500, 500);
  layer.endDraw();
  layer.save("transparent.png");
  
  image(layer, 0, 0);
}