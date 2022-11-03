//-------------SPHERES EXTERNES-------------

void grille_spheresEXT() //Fonction permettant de dessiner les sphères exterieures :
{ 
  for (int numero_sphere = 0; numero_sphere < 4; numero_sphere++) // Pour chacune des 4 spheres externes :
  {
    stroke(CouleurSpheresRE[numero_sphere], CouleurSpheresGE[numero_sphere], CouleurSpheresBE[numero_sphere]); //Définit la couleur utilisée pour dessiner des lignes et des bordures autour des spheres
    fill(CouleurSpheresRE[numero_sphere], CouleurSpheresGE[numero_sphere], CouleurSpheresBE[numero_sphere]); ////Définit la couleur utilisée pour remplir la sphere
    //Remarque : ces couleurs sont issues des tableaux de couleurs qui permettent de connaître les couleurs définitives des sphères externes
    
    pushMatrix(); //Assure la sécurité de coordonnées
    
    translate(PosSpheresEXTX[numero_sphere], PosSpheresEXTY[numero_sphere], PosSpheresEXTZ[numero_sphere]); //On se déplace sur la position où l'on souhaite dessiner notre sphere
    sphere(80); //On affiche notre sphère de taille 80
    
    popMatrix(); //Fin de sécurité de coordonnées
  }
}

void detectRegardSpheresExternes() //Fonction permettant de détecter le regard du joueur vers les sphères externes :
{
  for (int x = 0; x < 4; x++) //On parcourt les 4 sphères externes :
  { 
    int find = 0; // Variable "find" qui compte le nombre de fois où une sphère est détectée dans le regard "central" du joueur
    
    color valeur = color(CouleurSpheresRE[x], CouleurSpheresGE[x], CouleurSpheresBE[x]); //On récupère la couleur de la sphère grâce aux tableaux de couleurs définitives
    for(int dec1 = 1080 - 60; dec1 <= 1080 + 60; dec1++) //On parcourt les pixels centraux, avec une marge de 60 pixels
    {
      for(int dec2 = height/4 - 60; dec2 <= height/4 + 60; dec2++) //On parcourt les pixels centraux, avec une marge de 60 pixels
      {
        if (valeur == get(dec1, dec2)) //Si un des pixels centraux correspond à la couleur de la sphère externe, alors c'est que le joueur regarde celle-ci donc :
        {
          find += 1; //On incremente la variable "find" qui compte le nombre de fois où cette sphère est détectée dans le regard "central" du joueur
        }
      }
    }
    if(find > 0) //Si on a trouvé au moins une fois la sphère dans le regard central du joueur, alors cela signifie qu'il l'a bien regardé
    {
      regardSpheres2[x] += 1; //On increment le compteur ("timer") de la sphère ce qui permettra de savoir si celle-ci est regardée depuis plus ou moins longtemps
      println(String.format("Sphere extérieure %d détectée", x)); //Affichage console de la détection d'une sphère exterieure
    }
    else //Sinon, cela signifie que l'on ne regarde pas cette sphère donc :
    {
      regardSpheres2[x] = 0; //On reset son compteur ("timer") à 0
    }
  }
}

void remiseAZeroCompteurRegardE() //Reset notre tableau de compteur pour les 4 spheres externes
{
  for (int x = 0; x < 4; x++) // Pour chaque sphère
  {
    regardSpheres2[x] = 0; // Chaque case prend la valeur 0
  }
}

void regenerationRegardSpheresExternes() //Permet de regénerer terrain si le joueur regarde une des spheres Externes
{
  for (int x = 0; x < 4; x++) //On parcourt les sphères externes :
  {
    if (regardSpheres2[x] == 30) //Si la case compteur de la sphère externe vaut 30 correspondant à ~ 2 secondes :
    {
      remiseAZeroCompteurRegardE(); // Alors on appelle la méthode qui permet de reset tableau de compteur pour nos 4 spheres
      remiseAZeroCompteurRegardInternes(); //Reset du tableau de compteur des sphères internes afin de réinitialiser complétement le regard du joueur
      reGenerer = true; //Notre variable globale reGenerer passe à True, permettant ainsi la regénération du terrain et des spheres
      mode_terrain = x; //Le mode de terrain change en fonction de la sphère externe qui a été regardée
      println(String.format("Mode de terrain changé : %d", x)); //On effectue un bref affichage console
    }
  }
}
