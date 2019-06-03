select nom, prenom,  dateDeNaissance, lieuDeNaissance, adress, niveau 
from Person as pe right join Eleve as el on pe.idPerson = el.idEleve right join Eleve_Ni_An as ena on 
ena.idEleve = el.idEleve join Niveau as n on ena.idNiveau = n.idNiveau left join Annee as a 
on a.idAnnee = ena.idAnnee  where idPerson = 46;