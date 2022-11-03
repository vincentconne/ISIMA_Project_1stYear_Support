//-------------CREATION DE CUBE-------------

//Fonction permettant de créer un cube d'une certaine taille et de lui appliquer une texture
PShape CreerCubeTexture(PImage tex, float taille)
{
  PShape formeCube; //On crée la forme en PShape

  formeCube = createShape(); //Création d'une forme
  formeCube.beginShape(QUADS); //On démare la création de notre Pshape en mode géométrique "QUADS"

  formeCube.noFill(); //Désactive la géométrie de remplissage
  formeCube.noStroke(); //Désactive le dessin du contour

  formeCube.texture(tex); //On définis notre texture à utiliser

  // Face +Z = Avant
  formeCube.vertex(-1, -1, 1, 0, 0); //FACE HAUT
  formeCube.vertex( 1, -1, 1, 0.5, 0);
  formeCube.vertex( 1, 1, 1, 0, 0.5);
  formeCube.vertex(-1, 1, 1, 0.5, 0.5);

  // Face -Z = Arriere
  formeCube.vertex( 1, -1, -1, 0, 0); //FACE BAS
  formeCube.vertex(-1, -1, -1, 0, 0);
  formeCube.vertex(-1, 1, -1, 0, 0);
  formeCube.vertex( 1, 1, -1, 0, 0);

  // Face +Y = Dessous
  formeCube.vertex(-1, 1, 1, 0, 0.5); //FACE DESSOUS
  formeCube.vertex( 1, 1, 1, 0.5, 0.5);
  formeCube.vertex( 1, 1, -1, 0, 1);
  formeCube.vertex(-1, 1, -1, 0.5, 1);

  // Face -Y = Dessus
  formeCube.vertex(-1, -1, -1, 0, 0.5); //FACE DESSUS
  formeCube.vertex( 1, -1, -1, 0.5, 0.5);
  formeCube.vertex( 1, -1, 1, 0, 1);
  formeCube.vertex(-1, -1, 1, 0.5, 1);

  // Face +X = Droite
  formeCube.vertex( 1, -1, 1, 0, 0.5); //FACE DROITE
  formeCube.vertex( 1, -1, -1, 0.5, 0.5);
  formeCube.vertex( 1, 1, -1, 0, 1);
  formeCube.vertex( 1, 1, 1, 0.5, 1);

  // Face -X = Gauche
  formeCube.vertex(-1, -1, -1, 0, 0.5); //FACE GAUCHE
  formeCube.vertex(-1, -1, 1, 0.5, 0.5);
  formeCube.vertex(-1, 1, 1, 0, 1);
  formeCube.vertex(-1, 1, -1, 0.5, 1);

  formeCube.endShape(); //Fin de la création de notre PShape

  // Mise a l'echelle :
  formeCube.scale(taille/2.0); // taille proportionnelle

  return formeCube; //On retourne notre Cube créé
}
