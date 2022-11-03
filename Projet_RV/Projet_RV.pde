//**----------------------------------------PROGRAMME PRINCIPAL----------------------------------------**//

//-------------IMPORTATION DES BIBLIOTHEQUES-------------

import processing.video.*;
import processing.vr.*;

//-------------TEXTURES DES CUBES-------------

//(Monde Nature)
PShape Cube_Herbe;   // Forme cube
PImage Texture_Cube_Herbe; // Texture associee : une image JPG
PShape Cube_Sable;   // Forme cube
PImage Texture_Cube_Sable; // Texture associee : une image JPG

//(Monde Neige)
PShape Cube_Neige;   // Forme cube
PImage Texture_Cube_Neige; // Texture associee : une image JPG
PShape Cube_Blue_Ice; // Forme cube
PImage Texture_Cube_Blue_Ice; // Texture associee : une image JPG

//(Monde Feu)
PShape Cube_Magma; // Forme cube
PImage Texture_Cube_Magma;  // Texture associee : une image JPG
PShape Cube_Lava_Flow; // Forme cube
PImage Texture_Cube_Lava_Flow; // Texture associee : une image JPG

//(Monde Candy)
PShape Cube_Pink_Concrete; // Forme cube
PImage Texture_Cube_Pink_Concrete; // Texture associee : une image JPG
PShape Cube_Pink_Concrete_Powder; // Forme cube
PImage Texture_Cube_Pink_Concrete_Powder; // Texture associee : une image JPG


//-------------CONSTANTES DES DIMENSIONS DU TERRAINS-------------

int dimension; // Dimension du terrain, ici on prends 30 cubes de largeur et 30 cubes de longueur
int taille_cube; // Taille d'un cube
int hauteur_max; // Hauteur maximale du terrain (= nombre maximum de cubes en hauteur)
int rajout_dessous; // Variable permettant de rajouter un certain nombre de cubes en dessous de la surface du terrain


//-------------VALEUR DE GENERATION DE TERRAIN-------------

float flying; // Variable qui correspond à la valeur de génération du terrain

//-------------GENERATION SPHERES INTERNES-------------

int[] PosSpheresX = new int[9]; //Tableau d'entiers qui contient la position des sphères internes sur les "coordonnées du terrain" sur l'axe X
int[] PosSpheresY = new int[9]; //Tableau d'entiers qui contient la position des sphères internes sur les "coordonnées du terrain" sur l'axe Y
int[] PosSpheresZ = new int[9]; //Tableau d'entiers qui contient la position des sphères internes sur les "coordonnées du terrain" sur l'axe Z
//Remarque : ces trois tableaux ont une taille de 9 pour contenir les 9 sphères internes du terrain

int[] PosTranslateSpheresX = {6,  6,   6,  -4,  -4,  -4,  -13,  -13,  -13}; //Tableau d'entiers qui contient la position des sphères internes sur les "coordonnées Translate" sur l'axe X
int[] PosTranslateSpheresY = {2, -8, -17,   2,  -8,  -17,  2,  -8,  -17}; //Tableau d'entiers qui contient la position des sphères internes sur les "coordonnées Translate" sur l'axe Y
//Remarque : ces deux tableaux permettent de connaître les coordonnées du translate a effectuer pour se déplacer sur une sphère

int[] regardSpheresInternes = new int[9]; //Tableau d'entiers qui contient pour chaque sphère interne, un compteur permettant de savoir si celle-ci est regardée depuis plus ou moins longtemps par le joueur

int[] CouleurSpheresR = {255, 170, 149, 203, 121, 90, 255, 214, 155}; //Tableau d'entiers contenant les couleurs des sphères internes sur l'élément R
int[] CouleurSpheresG = {13, 17, 68, 115, 39, 53, 147, 164, 133}; //Tableau d'entiers contenant les couleurs des sphères internes sur l'élément G
int[] CouleurSpheresB = {199, 22, 131, 167, 87, 75, 210, 193, 145}; //Tableau d'entiers contenant les couleurs des sphères internes sur l'élément B
//Remarque : ces trois tableaux permettent de générer les sphères internes et de connaître pour chaque sphère interne leur couleur en RGB

//-------------GENERATION SPHERES EXTERNES-------------

int[] CouleurSpheresRE = {35, 255, 255, 231}; //Tableau d'entiers contenant les couleurs des sphères externes sur l'élément R
int[] CouleurSpheresGE = {255, 66, 255, 68}; //Tableau d'entiers contenant les couleurs des sphères externes sur l'élément G
int[] CouleurSpheresBE = {3,   3,  255, 232}; //Tableau d'entiers contenant les couleurs des sphères externes sur l'élément B
//Remarque : ces trois tableaux permettent de générer les 4 sphères externes

int[] PosSpheresEXTX = {750, 750, -300, 1800}; //Tableau d'entiers qui contient la position des sphères externes sur les coordonnées réelles du sketch sur l'axe X
int[] PosSpheresEXTY = {-300, 1800,750, 750}; //Tableau d'entiers qui contient la position des sphères externes sur les coordonnées réelles du sketch sur l'axe Y
int[] PosSpheresEXTZ = {1000, 1000, 1000, 1000}; //Tableau d'entiers qui contient la position des sphères externes sur les coordonnées réelles du sketch sur l'axe Z
//Remarque : Les sphères externes sont dans l'ordre suivant : VERTE (Nature) | ORANGE (Feu) | BLANCHE (Neige) | ROSE (Candy)

int[] regardSpheres2 = new int[4]; //Tableau d'entiers qui contient pour chaque sphère externe, un compteur permettant de savoir si celle-ci est regardée depuis plus ou moins longtemps par le joueur


//-------------POSITION DU TRANSLATE-------------

float posTranslateX; //Variable qui contient la position du translate sur l'axe X
float posTranslateY; //Variable qui contient la position du translate sur l'axe Y
/*Remarque : Ces deux positions permettent d'effectuer le dessin du terrain à un certain emplacement après avoir effectué un translate sur ces deux positions. 
             Ces variables sont alors utiles lors du déplacement du joueur sur des sphères*/

//-------------NUMERO DE SPHERE ACTUELLE-------------

int numeroSphereActuelle; //Variable contenant le numero de la sphere sur laquelle le joueur se situe (entre 0 et 8 inclus)

//-------------GENERATION DU TERRAIN-------------

float[][] terrain; // Tableaux de flottants à deux dimensions qui contiendra le terrain crée par le noise (chaque case contient une hauteur pour les coordonnées x et y)
float [][][] terrain3D; /* Tableaux de flottants à trois dimensions qui contiendra le terrain final, à chaque case accessible par un triplet x,y,z , se trouve soit la valeur 1 pour signifier 
                           qu'il doit y avoir un cube de dessiné, soit la valeur 0 pour signifier qu'il ne doit pas y avoir de cube de dessiné*/

int mode_terrain; //Variable entière qui contient le mode du terrain : 0 = NATURE | 1 = FEU | 2 = GLACE | 3 = CANDY

boolean reGenerer = true; //Variable booléenne pour la regénération d'un terrain

//-----------------------------------------------------------------------------SETUP-----------------------------------------------------------------------------
void setup()
{
  dimension = 30; // Dimension du terrain, ici on prends 30 cubes de largeur et 30 cubes de longueur
  taille_cube = 50; // Taille d'un cube
  hauteur_max = 17; // Hauteur maximale du terrain (= nombre maximum de cubes en hauteur)
  rajout_dessous = 3; // Variable permettant de rajouter un certain nombre de cubes en dessous de la surface du terrain
  
  flying = 0; //Flying initialisé à 0 au début du programme
  
  //Génération des deux terrains aux dimensions nécessaires :
  terrain = new float[dimension][dimension];
  terrain3D = new float[dimension][dimension][50]; //Remarque : on met ici la hauteur maximum à 50 pour avoir de la marge
  
  print(String.format("Width : %d", width)); //Affichage console de la largeur de la fenêtre
  print(String.format("Height : %d", height)); //Affichage console de la hauteur de la fenêtre
  
  fullScreen(STEREO); //Mode STEREO pour le rendu en réalité virtuelle
  
  mode_terrain = 0; //Terrain NATURE par défaut
  
  setupCreationCubesTextures(); //Initialisation des différentes textures de cubes
  
  //Coordonnées "TRANSLATE" initiales pour mettre le joueur au centre du terrain au début du programme :
  posTranslateX = -4;
  posTranslateY = -8;
  
  numeroSphereActuelle = 4; //Initialisation de la sphère actuelle à 4 (= sphère interne centrale)
  
}// fin du setup


//-----------------------------------------------------------------------------DRAW----------------------------------------------------------------------------------------------------
void draw()
{
    background(0); //Coloration en noir du fond de la scène
    
    if(reGenerer) //S'il faut regénérer le terrain :
    {
      resetTerrains(); //On remet à 0 les deux terrains (celui pour le noise, et le terrain finale issu de la conversion)
      flying += dimension; //On incremente le flying pour changer la génération aléatoire du terrain
      System.out.println("REGENERATION"); //Affichage en console de la regénération du terrain
      noiseSpace(flying); //Calcul du terrain par le noise
      terrain2D_to_terrain3D(); //Conversion du terrain issu du noise, en terrain final
      reGenerer = false; //La variable booléenne prend la valeur "false" car le terrain a été regénéré
    }
    
    pushMatrix(); //Assure la sécurité de coordonnées
    
    int temp = trouveMaxZ(); //Variable entière pour stocker la hauteur maximum sur tout le terrain (coordonnées terrain)
    
    //Variable entière "t" permettant de stocker la hauteur du terrain à l'emplacement actuelle du joueur : 
    int t = -trouverPointMaxHauteur(PosSpheresX[numeroSphereActuelle], PosSpheresY[numeroSphereActuelle]) * taille_cube - temp * taille_cube;
    rotateX(radians(90)); //Rotation sur l'axe X de 90 degré pour mettre le terrain à plat
    translate(posTranslateX * taille_cube, posTranslateY * taille_cube, t); //Translate en coordonnées sketch à la position de dessin du terrain
    DessineTerrainMode(); //Dessin du terrain selon le mode
    grille_spheres(); //Dessin des sphères internes sur le terrain
    grille_spheresEXT(); //Dessin des sphères externes
    
    popMatrix(); //Fin de la sécurité coordonnées
    
    //PHASE DE DEPLACEMENT AVEC LES SPHERES INTERNES :
    detectRegardSpheresNonExternes(); //Detection du regard du joueur sur les sphères internes
    deplacementRegardSpheresNonExternes(); //Déplacement du joueur sur les sphères internes si nécessaire
    
    //PHASE DE REGENERATION AVEC LES SPHERES EXTERNES :
    detectRegardSpheresExternes(); //Detection du regard du joueur sur les sphères externes
    regenerationRegardSpheresExternes(); //Detection de regénération du terrain selon le regard des sphères externes
    
}//fin du draw


//-------------FONCTIONS AUXILIAIRES-------------

//Fonction permettant de trouver la hauteur maximale (en coordonnées terrains) à un certain emplacement sur le terrain :
int trouverPointMaxHauteur(int posX, int posY)
{
  for(int z=hauteur_max - 1; z>=0; z--) //On parcourt la hauteur de haut en bas
  {
    if (terrain3D[posX][posY][z] == 1) //Si le tableau contient 1, alors cela signifie qu'il faut mettre un cube donc c'est la hauteur maximum
    {
      return z; //On renvoi la hauteur en "coordonnées terrains"
    }
  }
  //System.out.println("ERREUR : hauteur max en un point non trouvée !");
  return -1; //Sortie erreur
}

//Fonction permettant de trouver la hauteur maximale (en coordonnées terrains) sur tout le terrain généré :
int trouveMaxZ()
{
  int max = -1; //Hauteur maximale initialisée à -1
  for(int x=0; x<dimension; x++) //On parcourt les x
  {
    for(int y=0; y<dimension; y++) //On parcourt les y
    {
      for(int z=0; z<hauteur_max; z++) //On parcourt les z
      {
        if(z > max) //Si la hauteur est strictement supérieur au maximum alors :
        {
          max = z; //Le maximum prend comme valeur cette hauteur
        }
      }
    }
  }
  return max; //On retourne la hauteur maximale en "coordonnées terrains"
}


//Fonction permettant de reset les deux terrains :
void resetTerrains()
{
  for (int x = 0; x < dimension; x++) //On parcourt les x
  {
    for (int y = 0; y < dimension; y++) //On parcourt les y
    {
      terrain[x][y] = 0; //On reset le terrain issu du noise
      for (int z = 0; z < 50; z++) //On parcourt les z
      {
        terrain3D[x][y][z] = 0; //On reset le terrain issu de la conversion
      }
    }
  }
}
