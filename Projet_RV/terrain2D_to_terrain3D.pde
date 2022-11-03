//-------------Fonction permettant de convertir le terrain 2D en terrain 3D en rajoutant la hauteur-------------

void terrain2D_to_terrain3D()
{
  for (int x = 0; x < dimension; x++) //On parcourt les x
  {
    for (int y = 0; y < dimension; y++) //On parcourt les y
    {
      //On met dans le tableau final issu de la conversion un 1 pour signifier qu'il doit y avoir un cube aux coordonnées x, y, et à la hauteur contenue dans le tableau issu du noise :
      terrain3D[x][y][(int)((terrain[x][y] * 100)) / 4] = 1; // 1 pour dire qu'il y a un cube | 0 si y'a pas de cube
      
      //On rajoute des cubes dessous pour simuler un terrain réel :
      for(int dessous = hauteur_max; dessous < (int)((terrain[x][y] * 100)) / 4; dessous++) //On parcourt la hauteur sous le cube
      {
        terrain3D[x][y][dessous] = 1; //1 pour signifier qu'il y a un cube à dessiner à cet emplacement
      }
      
      //Ajout MANUEL de cube en dessous :
      int compteur = 1; //Compteur d'ajout pour savoir combien de cubes on a rajouté en dessous, initialisé à 1 au début
      while (compteur!=rajout_dessous) //Tant que l'on a pas ajotué le nombre de cube choisi dessous :
      {
        if (((int)((terrain[x][y] * 100)) / 4) - compteur >= 0) //Si on peut rajouter un cube en dessous :
        {
          terrain3D[x][y][((int)((terrain[x][y] * 100)) / 4) - compteur] = 1; //On stocke 1 pour signifier qu'il faut mettre un cube
          compteur += 1; //On incremente le compteur d'ajout
        }
      }
    }
  }
}
