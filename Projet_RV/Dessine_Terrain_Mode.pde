//-------------DESSIN DES 4 DIFFERENTS TERRAINS-------------

//Fonction permettant de dessiner un terrain selon le mode choisi
void DessineTerrainMode()
{
  for (int x=0; x<dimension; x++) //On parcourt les x
  {
    for (int y=0; y<dimension; y++) //On parcourt les y
    {
      for (int z=0; z<hauteur_max; z++) //On parcourt les z
      {
        if (terrain3D[x][y][z] == 1) //Si le tableau contient un 1 pour signifier de mettre un cube :
        {
          pushMatrix(); //Assure la sécurité de coordonnées
          
          translate(x * taille_cube, y * taille_cube, z*(taille_cube)); /*On se déplace aux coordonnées indiquées par nos 3 boucles "for" que l'on multiplies par la taille de notre cube que l'on souhaite placer pour
                                                                          ainsi être aux bonnes coordonnées sketch */
          if (z > 10) //Si la hauteur (coordonnées terrain) est plus grand que 10 :
          {
            if(mode_terrain == 0) // Si le mode terrain est 0 pour NATURE :
            { 
              shape(Cube_Herbe); //On place un Cube d'Herbe
            }
            else if(mode_terrain == 2) // Si le mode terrain est 2 pour NEIGE :
            { 
              shape(Cube_Neige); //On place un Cube de Neige
            }
            else if(mode_terrain == 1) // Si le mode terrain est 1 pour LAVE :
            {
              shape(Cube_Magma); //On place un Cube de Magma
            }
            else //Sinon le mode du terrain est 3 pour CANDY :
            {
              shape(Cube_Pink_Concrete_Powder); //On place un cube Bonbon
            }
          }
          else //Sinon si la hauteur n'est pas au dessus de 10 :
          {
            if(mode_terrain == 0) // Si le mode terrain est 0 pour NATURE :
            { 
              shape(Cube_Sable); //On place un Cube de Sable    
            }
            else if(mode_terrain == 2) // Si le mode terrain est 2 pour NEIGE :
            { 
              shape(Cube_Blue_Ice); //On place un Cube de Glace
            }
            else if(mode_terrain == 1) // Si le mode terrain est 1 pour LAVE :
            {
              shape(Cube_Lava_Flow); //On place un Cube de Lave
            }
            else //Sinon le mode du terrain est 3 pour CANDY :
            {
              shape(Cube_Pink_Concrete); //On place un cube Bonbon différent
            }
          }
          popMatrix(); //Fin de sécurité de coordonnées
        }
      }
    }
  }
}
