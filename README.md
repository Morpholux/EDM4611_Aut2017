EDM4611
=======

Contenu du cours «Image de synthèse et interactivité : processus génératifs»<br>
UQAM - Université du Québec à Montréal<br>
Programme de Baccalauréat en médias interactifs<br>
Session automne 2017

Enseignant : <a href="mailto:renaud.jean-francois@uqam.ca">Jean-François Renaud</a> (professeur)

<br>
_ _ _

<br>
<br>

![Our Medium is Computation](https://dl.dropboxusercontent.com/s/hsvcnobh727vwki/medium_is_computation.jpg
"Citation tirée d’une conférence donnée par Jessica Rosenkrantz")

<br>
<br>
_ _ _

### Description des travaux d’atelier

A1 . **Atelier Pixels** - semaine 2

• Expérimenter avec les méthodes de lecture et d’écriture des composants d’un affichage matriciel, les pixels. Ceux-ci sont interprétés/altérés directement dans le sketch ou depuis des fichiers importés. On évite l’utilisation des commandes set() ou get() pour lire ou écrire la donnée de couleur. On lui préfère la commande pixels[]. Enfin, on voit comment extraire les valeurs RGB ou HSB à l’aide d’opérations <i>Bitwise</i>. Voir le dossier comprenant les notes de cours.

Notions à considérer :

`pixels[], loadPixels(), updatePixels(), loadImage(), PImage`

<br>
<br>

A2 . **Atelier tracé vectoriel** - semaine 3

• Expérimenter avec la création d’un motif ou d’une structure graphique, potentiellement animée. Le dessin des figures se fait à l’aide d’une méthode exclusivement vectorielle, c’est-à-dire que les formes sont constituées de tracés (droites, courbes), et donc de points de contrôle (ancrages, leviers) pouvant être modifiés à travers le code. On évite l’utilisation des primitives 2D rect() ou ellipse(), bien que ces dernières soient également de la famille des objets vectoriels. Votre sketch pourrait permettre l’exportation en format PDF, donnant l’accès à la structure de dessin, contrairement à une sauvegarde matricielle.

Notions à considérer :

`vertex(), curve(), bezier(), curveVertex(), bezierVertex(), beginShape() endShape(), PShape`

<br>
<br>

A3 . **Atelier animation** - semaine 4

![Quatre mouvements](https://dl.dropboxusercontent.com/s/43mw0pwvltokoir/quatre_mouvements.jpg
"Distinction entre mouvement et trajectoire")

• Créer des animations aux mouvements plus riches que ceux issus de simples interpolations temporelles linéaires (par incrémentation d’une valeur constante). Nous explorons d’abord les diverses possibilités du «moteur» d’une animation. On examine ensuite les méthodes qui vont permettre de modifier une valeur à l’aide de fonctions d’atténuation, le cas le plus simple étant un mouvement oscillatoire (sin, cos), puis les diverses formules d’interpolation temporelle courbe (tweening). Votre sketch devrait permettre de bien afficher les caractéristiques d’un mouvement organique, plutôt que mécanique.

Notions à considérer :

`frameCount, millis(), sin(), cos(), lerp(), noise()`

`Fonctions de Penner (EaseIn, EaseOut, EaseInOut), Librairie Ani`

<br>
<br>

A4 . **Atelier programmation orientée objet** - semaine 5

• La démultiplication d’une primitive dans un sketch par une technique visant à laisser une trace est rapidement contraignante : les figures ne sont plus modifiables une fois qu’elles sont dessinées. Une solution beaucoup plus intéressante consiste à créer autant d’instances que nécessaire, tout en conservant un accès à leurs paramètres, incluant celui d’être affiché. C’est la force de la programmation orientée objet (POO). Vous êtes donc conviés à construire un «univers» doté de «nombreuses réplications», des «entités» qui se ressemblent, mais qui sont bien plus que le simple clonage d’une classe d’origine. Bien au contraire, chaque instance permet l’encapsulation de paramètres uniques et spécifiques, avec des «variables membres» adressables en tout lieu, en tout temps.
En clair, il faut construire une animation avec une multitude d’objets, chacun ayant un comportement unique.

Notions à considérer :

`class, ArrayList, <>, .size(), .add(), new, .clear(), .remove(), .get()`

<br>
<br>

A5 . **Atelier géométrie et espace 3D** - semaine 6

![Flèches](https://dl.dropboxusercontent.com/s/mugn2vnyf3g9nqg/arrows_sm.jpg
"Flèches paramétriques dans un espace 3D")

• La gestion de la 3D dans Processing demeure rudimentaire : utilisation de géométries simples (seulement deux primitives, mais possibilité de modélisation paramétrique et d’importation de fichiers OBJ); distribution des objets dans un espace 3D; gestion de quelques paramètres d’éclairage. Rien de comparable aux environnements de production spécialisés, surtout pas si l’on vise une grande qualité au niveau des rendus. Mais Processing permet de se frotter aux règles mathématiques sous-jacentes à la réalisation de volumes et de mieux comprendre les composantes d’un maillage 3D (vertex, polygones). À la suite de cet atelier, vous êtes invité à construire un volume paramétrique, à l’éclairer et à l’animer à travers des transformateurs (translate, rotate, scale) ou des mouvements de caméra. La création d’un «ruban» ou d’un «tube» (une ligne avec une épaisseur) constitue un cas intéressant à explorer.

Notions à considérer :

`mode P3D, coordonnées X Y Z, box(), sphere(), transformateurs géométriques, pushMatrix() et popMatrix(), PShape (modèle en format OBJ)`

`beginShape(TRIANGLE_STRIP), beginShape(QUAD_STRIP)`

`camera, lights(), ambientLight(), directionalLight(), pointLight(), spotLight(), texture()`

`Librairie PeasyCam`

<br>
<br>
