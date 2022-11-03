//-------------FONCTION DE SETUP DES TEXTURES DES CUBES-------------

void setupCreationCubesTextures() //Fonction de setup des textures, elle ne renvoit rien
{
  //Textures monde NATURE :
  Texture_Cube_Herbe = loadImage("green_concrete_powder.png"); // Chargement de la texture
  textureMode(NORMAL); // Les coordonnees de la texture sont normalisees de 0 a 1 en U et en V
  Cube_Herbe = CreerCubeTexture(Texture_Cube_Herbe, taille_cube); //Création du cube et application de sa texture
  
  Texture_Cube_Sable = loadImage("sand.png"); // Chargement de la texture
  textureMode(NORMAL); // Les coordonnees de la texture sont normalisees de 0 a 1 en U et en V
  Cube_Sable = CreerCubeTexture(Texture_Cube_Sable, taille_cube); //Création du cube et application de sa texture
  
  //Textures monde NEIGE :
  Texture_Cube_Neige = loadImage("snow.png"); // Chargement de la texture
  textureMode(NORMAL); // Les coordonnees de la texture sont normalisees de 0 a 1 en U et en V
  Cube_Neige = CreerCubeTexture(Texture_Cube_Neige, taille_cube); //Création du cube et application de sa texture
  
  Texture_Cube_Blue_Ice = loadImage("blue_ice.png"); // Chargement de la texture
  textureMode(NORMAL); // Les coordonnees de la texture sont normalisees de 0 a 1 en U et en V
  Cube_Blue_Ice = CreerCubeTexture(Texture_Cube_Blue_Ice, taille_cube); //Création du cube et application de sa texture
  
  //Textures monde LAVE :
  Texture_Cube_Magma = loadImage("magma.png"); // Chargement de la texture
  textureMode(NORMAL); // Les coordonnees de la texture sont normalisees de 0 a 1 en U et en V
  Cube_Magma = CreerCubeTexture(Texture_Cube_Magma, taille_cube); //Création du cube et application de sa texture
  
  Texture_Cube_Lava_Flow = loadImage("lava_flow.png"); // Chargement de la texture
  textureMode(NORMAL); // Les coordonnees de la texture sont normalisees de 0 a 1 en U et en V
  Cube_Lava_Flow = CreerCubeTexture(Texture_Cube_Lava_Flow, taille_cube); //Création du cube et application de sa texture
  
  //Textures monde CANDY :
  Texture_Cube_Pink_Concrete = loadImage("pink_concrete.png"); // Chargement de la texture
  textureMode(NORMAL); // Les coordonnees de la texture sont normalisees de 0 a 1 en U et en V;
  Cube_Pink_Concrete = CreerCubeTexture(Texture_Cube_Pink_Concrete, taille_cube); //Création du cube et application de sa texture
  
  Texture_Cube_Pink_Concrete_Powder = loadImage("pink_concrete_powder.png"); // Chargement de la texture
  textureMode(NORMAL); // Les coordonnees de la texture sont normalisees de 0 a 1 en U et en V
  Cube_Pink_Concrete_Powder = CreerCubeTexture(Texture_Cube_Pink_Concrete_Powder, taille_cube); //Création du cube et application de sa texture
}
