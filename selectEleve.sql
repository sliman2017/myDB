-- select nom, prenom,  dateDeNaissance, lieuDeNaissance, adress, niveau 
-- from Person as pe right join Eleve as el on pe.idPerson = el.idEleve right join Eleve_Ni_An as ena on 
-- ena.idEleve = el.idEleve join Niveau as n on ena.idNiveau = n.idNiveau left join Annee as a 
-- on a.idAnnee = ena.idAnnee  where idPerson = 46;
-- update Classe 
-- set ClasseNb = 21, salle = 21, nbEleve = 61 
-- where idAnnee = (select idAnnee from Annee where Left(annee, 4) = '2015')
-- and idNiveau = (select idNiveau from Niveau where idNiveau = 40)
-- and idClasse ;

-- update Classe
-- set idEleve=
-- Case 
-- when idClasse = 1 then 92
-- when idClasse = 2 then 48
-- when idClasse = 3 then 46
-- when idClasse = 4 then 44 
-- when idClasse = 5 then 46
-- when idClasse = 6 then 98
-- when idClasse = 7 then 99
-- when idClasse = 8 then 100
-- else 100
-- End;
alter table Evaluation
add constraint foreign key(idEleve) references Eleve(idEleve) on delete cascade on update cascade,
add constraint foreign key(idMatiere) references Matiere(idMatiere) on delete cascade on update cascade,
add constraint foreign key(idTrimester) references Trimester(idTrimester) on delete cascade on update cascade,
add constraint foreign key(idNiveau) references Niveau(idNiveau) on delete cascade on update cascade,
add constraint foreign key(idAnnee) references Annee(idAnnee) on delete cascade on update cascade;
