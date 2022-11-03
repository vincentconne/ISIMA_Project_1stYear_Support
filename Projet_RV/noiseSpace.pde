//-------------FONCTION DE GENERATION DU TERRAIN PAR BRUIT-------------

//Fonction de bruit permettant de générer aléatoirement un terrain 3D :
void noiseSpace(float flying) //Prend en argument le flying
{
  float yoff = flying; //Variable permettant le noise sur l'axe y
  for (int y = 0; y<dimension; y++) //On parcourt les y
  {
    float xoff = 0; //Variable permettant le noise sur l'axe x
    for (int x = 0; x<dimension; x++) //On parcourt les x
    {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, 0, 1); // On génère le terrain : à chaque coordonnées (x,y) , on stocke une valeur de hauteur entre 0 et 1
      xoff += 0.1; //On incremente la variable x de noise
    }
    yoff += 0.1; //On incremente la variable y de noise
  }
}
//Remarque : cette procédure ne renvoi rien, elle remplie uniquement le tableau 2D "terrain"
