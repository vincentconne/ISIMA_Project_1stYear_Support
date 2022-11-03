//-------------SPHERES INTERIEURES-------------

void dessine_sphere(int x, int y, int hauteur) //Fonction permettant de dessiner une sphère (interne)
{ 
  pushMatrix(); //Assure la sécurité de coordonnées
  translate(x * taille_cube, y * taille_cube, hauteur*(taille_cube) + 200); /*On se déplace aux coordonnées prises en paramètre que l'on multiplie par la 
                                                                              taille des cubes et on ajoute 200 à notre hauteur afin de positionner les sphères au dessus des cubes*/
  sphere(30); //On affiche notre sphère de taille 30
  popMatrix(); //Fin de la sécurité coordonnées
}

void grille_spheres() //Dessin des sphères intérieures dans l'espace
{ 
  int numero_sphere = 0; //Variable entière contenant le numéro de la sphère que l'on va dessiner. Cette variable est utile pour pouvoir dessiner uniquement les sphères autours du joueur et non pas toutes les sphères internes
  for (int x=5; x<dimension; x+=10) //On parcourt les x, avec une incrémentation de 10 pour avoir un total de 9 sphères internes sur le terrain
  {
    for (int y=5; y<dimension; y+=10) //On parcourt les y, avec une incrémentation de 10 pour avoir un total de 9 sphères internes sur le terrain.
    {                                 //Remarque : on débute notre parcourt à 5 pour éviter de positionner une sphère interne sur le bord du terrain
    
      int hauteur = trouverPointMaxHauteur(x, y); //On calcul la hauteur maximale du terrain à ces coordonnées (coordonnées terrains)
      
      stroke(CouleurSpheresR[numero_sphere], CouleurSpheresG[numero_sphere], CouleurSpheresB[numero_sphere]); //Définit la couleur utilisée pour dessiner des lignes et des bordures autour des spheres
      fill(CouleurSpheresR[numero_sphere], CouleurSpheresG[numero_sphere], CouleurSpheresB[numero_sphere]); //Définit la couleur utilisée pour remplir la sphere
      //Remarque : ces couleurs étant stockées définitivement dans des tableaux, ce qui permettra par la suite de détecter ces sphères par le regard du joueur
      
      switch(numeroSphereActuelle) //Switch sur la position actuelle de la sphère donc du joueur pour pouvoir uniquement dessiner les sphères internes qui l'entoure
      {
        case 0: //Si le joueur est actuellement sur la sphere 0 :
        {
          if(numero_sphere == 3 || numero_sphere == 4 || numero_sphere == 1) //Si on veut dessiner les sphères qui l'entoure donc les numéros 3, 4 et 1 alors :
          {
            dessine_sphere(x, y, hauteur); //On dessine les sphères
          }
          break;
        }
        case 1: //Si le joueur est actuellement sur la sphere 1 :
        {
          if(numero_sphere == 0 || numero_sphere == 3 || numero_sphere == 4 || numero_sphere == 2 || numero_sphere == 5) //Si on veut dessiner les sphères qui l'entoure donc les numéros 0, 3, 4, 2 et 5 alors :
          {
            dessine_sphere(x, y, hauteur); //On dessine les sphères
          }
          break;
        }
        case 2: //Si le joueur est actuellement sur la sphere 2 :
        {
          if(numero_sphere == 1 || numero_sphere == 4 || numero_sphere == 5) //Si on veut dessiner les sphères qui l'entoure donc les numéros 1, 4 et 5 alors :
          {
            dessine_sphere(x, y, hauteur); //On dessine les sphères
          }
          break;
        }
        case 3: //Si le joueur est actuellement sur la sphere 3 :
        {
          if(numero_sphere == 0 || numero_sphere == 1 || numero_sphere == 4 || numero_sphere == 7 || numero_sphere == 6) //Si on veut dessiner les sphères qui l'entoure donc les numéros 0, 1, 4, 7 et 6 alors :
          {
            dessine_sphere(x, y, hauteur); //On dessine les sphères
          }
          break;
        }
        case 4: //Si le joueur est actuellement sur la sphere 4 :
        {
          if(numero_sphere >= 0 && numero_sphere < 9) //Si on veut dessiner les sphères qui l'entoure donc toutes les sphères autour de la centrale :
          {
            dessine_sphere(x, y, hauteur); //On dessine les sphères
          }
          break;
        }
        case 5: //Si le joueur est actuellement sur la sphere 5 :
        {
          if(numero_sphere == 1 || numero_sphere == 2 || numero_sphere == 4 || numero_sphere == 7 || numero_sphere == 8) //Si on veut dessiner les sphères qui l'entoure donc les numéros 1, 2, 4, 7 et 8 alors :
          {
            dessine_sphere(x, y, hauteur); //On dessine les sphères
          }
          break;
        }
        case 6: //Si le joueur est actuellement sur la sphere 6 :
        {
          if(numero_sphere == 3 || numero_sphere == 4 || numero_sphere == 7) //Si on veut dessiner les sphères qui l'entoure donc les numéros 3, 4 et 7 alors :
          {
            dessine_sphere(x, y, hauteur); //On dessine les sphères
          }
          break;
        }
        case 7: //Si le joueur est actuellement sur la sphere 7 :
        {
          if(numero_sphere == 3 || numero_sphere == 6 || numero_sphere == 4 || numero_sphere == 5 || numero_sphere == 8) //Si on veut dessiner les sphères qui l'entoure donc les numéros 3, 6, 4, 5 et 8 alors :
          {
            dessine_sphere(x, y, hauteur); //On dessine les sphères
          }
          break;
        }
        case 8: //Si le joueur est actuellement sur la sphere 8 :
        {
          if(numero_sphere == 4 || numero_sphere == 5 || numero_sphere == 7) //Si on veut dessiner les sphères qui l'entoure donc les numéros 4, 5 et 7 alors :
          {
            dessine_sphere(x, y, hauteur); //On dessine les sphères
          }
          break;
        }
        default: //Sinon :
        {
          println("ERROR 'Gestion_Spheres_Interieures'"); //Erreur !
        }
      }
      
      PosSpheresX[numero_sphere] = x; //On remplis les tableaux qui contiennent les positions des sphères internes en "coordonnées tableau" sur l'axe X
      PosSpheresY[numero_sphere] = y; //On remplis les tableaux qui contiennent les positions des sphères internes en "coordonnées tableau" sur l'axe Y
      PosSpheresZ[numero_sphere] = hauteur; //On remplis les tableaux qui contiennent les positions des sphères internes en "coordonnées tableau" sur l'axe Z

      numero_sphere += 1; //On incremente le numero de la sphère interne
    }
  }
}


void detectRegardSpheresNonExternes() //Fonction permettant de détecter lorsque le joueur regarde une sphère interne
{
  //color center = get(1080, height/4); //Recuperation du centre AVEC LE REGARD POUR ANDROID VR
  //color recup = get(mouseX, mouseY); //AVEC LA SOURIS POUR TESTER SUR PROCESSING
  for(int x = 0; x < 9; x++) //On parcourt les sphères internes
  {
    int find = 0; // Variable "find" qui compte le nombre de fois où une sphère interne est détectée dans le regard "central" du joueur
    color valeur = color(CouleurSpheresR[x], CouleurSpheresG[x], CouleurSpheresB[x]); //On récupère la couleur de la sphère interne grâce aux tableaux de couleurs définitives
    for(int dec1 = 1080 - 60; dec1 <= 1080 + 60; dec1++) //On parcourt les pixels centraux, avec une marge de 60 pixels
    {
      for(int dec2 = height/4 - 60; dec2 <= height/4 + 60; dec2++) //On parcourt les pixels centraux, avec une marge de 60 pixels
      {
        if (valeur == get(dec1, dec2)) //Si un des pixels centraux correspond à la couleur de la sphère interne, alors c'est que le joueur regarde celle-ci donc :
        {
          find += 1; //On incremente la variable "find" qui compte le nombre de fois où cette sphère est détectée dans le regard "central" du joueur
        }
      }
    }
    if(find > 0) //Si on a trouvé au moins une fois la sphère interne dans le regard central du joueur, alors cela signifie qu'il l'a bien regardé
    {
      regardSpheresInternes[x] += 1; //On increment le compteur ("timer") de la sphère interne ce qui permettra de savoir si celle-ci est regardée depuis plus ou moins longtemps
      println(String.format("Sphere intérieure %d détectée", x)); //Affichage console de la détection d'une sphère interieure
    }
    else //Sinon, cela signifie que l'on ne regarde pas cette sphère donc :
    {
      regardSpheresInternes[x] = 0; //On reset son compteur ("timer") à 0
    }
  }
}


void remiseAZeroCompteurRegardInternes() //Permet de remettre à 0 notre tableau de compteur de regard pour les 9 spheres internes
{ 
  for (int x = 0; x < 9; x++) // A chaque passage sur le tableau de compteur, donc pour chaque sphère interne :
  {
    regardSpheresInternes[x] = 0; // Chaque case compteur prend la valeur 0
  }
}


void deplacementRegardSpheresNonExternes() //Fonction permettant d'effectuer le déplacement du joueur sur une sphère interne :
{
  for (int x = 0; x < 9; x++) //On parcourt les spheres internes
  {
    if (regardSpheresInternes[x] == 20) //Si la case compteur de la sphère externe vaut 20 correspondant à ~ 1 seconde :
    {
      numeroSphereActuelle = x; //On change la sphère actuelle sur laquelle le joueur se situe
      remiseAZeroCompteurRegardE(); //Reset des compteurs de regard des spheres externes afin de réinitialiser complétement le regard du joueur
      remiseAZeroCompteurRegardInternes(); // On appelle la méthode qui permet de reset les compteurs de regard pour les 9 spheres internes
      posTranslateX = PosTranslateSpheresX[x]; //On change la position actuelle de TRANSLATE sur l'axe X par la position de translate correspondant à la sphère interne
      posTranslateY = PosTranslateSpheresY[x]; //On change la position actuelle de TRANSLATE sur l'axe Y par la position de translate correspondant à la sphère interne
      //Remarque : ces changements sur les positions de translate permettront de dessiner le terrain de façon à ce que le joueur soit bien positionner sur celui-ci
    }
  }
}
