//-------------DESSIN DES AXES-------------

void dessine_axes() // Fonction permettant de dessiner des axes servant de support lors de la création du projet
{ 
  stroke(#F22B18); // Définit la couleur utilisée pour dessiner des lignes et des bordures autour de la ligne X
  fill(#F22B18); // Définit la couleur utilisée pour remplir la ligne X
  line(0, 0, 0, 5000, 0, 0); // Affichage de l'axe X en rouge
  stroke(#18F2D7); // Définit la couleur utilisée pour dessiner des lignes et des bordures autour de la ligne Y
  fill(#18F2D7); // Définit la couleur utilisée pour remplir la ligne Y
  line(0, 0, 0, 0, 5000, 0); // Affichage de l'axe Y en bleu
  stroke(#1BF218); // Définit la couleur utilisée pour dessiner des lignes et des bordures autour de la ligne Z
  fill(#1BF218); // Définit la couleur utilisée pour remplir la ligne Z
  line(0, 0, 0, 0, 0, 5000); // Affichage de l'axe Z en vert
}
