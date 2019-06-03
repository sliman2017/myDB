drop database if exists GestionDeScolarite;
create database GestionDeScolarite;
use GestionDeScolarite;

create table if not exists Person(idPerson int primary key auto_increment, nom varchar(25) not null, 
                    prenom varchar(25) not null, adress varchar(25), dateDeNaissance date not null,
                    lieuDeNaissance varchar(25), email varchar(25), numPhone varchar(25), sex bool, longBlob photos);
create table if not exists Directeur(idDirecteur int primary key, username varchar(25), uPassword varchar(25),
                       constraint Person_Directeur_fk foreign key(idDirecteur) references Person(idPerson)
                       on delete cascade on update cascade);
create table if not exists Administrateur(idAdmin int primary key, username varchar(25), uPassword varchar(25),
                            constraint person_admin_fk foreign key (idAdmin) references Person(idPerson)
                            on delete cascade on update cascade);
create table if not exists Enseignant(idEnseignant int primary key, nbClasse smallint, username varchar(25), uPassword varchar(25),
                        idMatiere int, constraint Person_Enseignant_fk foreign key(idEnseignant) references Person(idPerson)
                         on delete cascade on update cascade);
create table if not exists Matiere(idMatiere int primary key auto_increment, matiere varchar(25), fondamental bool, 
                      coefficient int, idEnseignantResponsable int, constraint Enseignant_Matiere_fk foreign key(idEnseignantResponsable)
                      references Enseignant(idEnseignant) on delete cascade on update cascade);
alter table Enseignant
add constraint Matiere_Enseignant_fk foreign key(idMatiere) 
    references Matiere(idMatiere) on delete cascade on update cascade; 

create table if not exists Classe(idClasse int primary key auto_increment, Classe varchar(25), salle varchar(25), nbEleve smallint,
                    idEnseignantResponsable int, constraint Enseignant_Classe_fk foreign key(idEnseignantResponsable) 
                    references Enseignant(idEnseignant) on delete cascade on update cascade);
create table if not exists Enseignant_Classe(idEnseignant int, idClasse int, constraint Enseignant_E_Classe_fk foreign key(idEnseignant)
                               references Enseignant(idEnseignant) on delete cascade on update cascade, 
                               constraint Classe_Enseignant_C_fk foreign key(idClasse)
                               references Classe(idClasse) on update cascade on delete cascade, primary key(idEnseignant, idClasse));
create table if not exists Eleve(idEleve int primary key, moyenneGeneral DECIMAL(4,2), idClasse int, parentPhone varchar(25),
                   constraint Person_Eleve_fk foreign key(idEleve) references Person(idPerson) on delete cascade on update cascade,
                   constraint Classe_Eleve_fk foreign key(idClasse) references Classe(idClasse)on delete cascade on update cascade);
create table if not exists Rapport(idRapport int primary key auto_increment, idEnseignant int, idEleve int, sujet varchar(25), detail TEXT, dateEcriture date,
                     constraint Enseignant_Rapport_fk foreign key(idEnseignant) references Enseignant(idEnseignant) on delete cascade on update cascade, 
                     constraint Eleve_Rapport_fk foreign key(idEleve) references Eleve(idEleve) on delete cascade on update cascade);
create table if not exists ConseilDiscipline(idConseil int primary key auto_increment, dateDeConseil date, idRapport int, idEnseignantMatiereR int,idEnseignantClasseR int,
                               idDirecteur int, idAdmin int, constraint Rapport_ConseilDiscipline_fk foreign key(idRapport) references Rapport(idRapport)
                               on delete cascade on update cascade, constraint EnseignantM_ConseilDiscipline_fk foreign key(idEnseignantMatiereR)
                               references Enseignant(idEnseignant) on delete cascade on update cascade, constraint EnseignantC_ConseilDiscipline_fk 
                               foreign key(idEnseignantClasseR) references Enseignant(idEnseignant) on delete cascade on update cascade, constraint Directeur_conseilDiscipline_fk
                               foreign key(idDirecteur) references Directeur(idDirecteur) on delete cascade on update cascade, constraint Admin_ConseilDiscipline_fk 
                               foreign key(idAdmin) references Administrateur(idAdmin) on delete cascade on update cascade);
create table if not exists Niveau(idNiveau int primary key auto_increment, niveau varchar(50));
create table if not exists Annee(idAnnee int primary key auto_increment, annee Date);
create table if not exists Eleve_Ni_An(idEleve int, idNiveau int, idAnnee int, constraint Eleve_ENA_fk foreign key(idEleve)
                         references Eleve(idEleve) on delete cascade on update cascade, constraint Niveau_ENA_fk
                         foreign key(idNiveau) references Niveau(idNiveau) on delete cascade on update cascade, 
                         constraint Annee_ENA_fk foreign key(idAnnee) references Annee(idAnnee) on delete cascade on update cascade);
create table if not exists Trimester(idTrimester int primary key auto_increment, trimester varchar(25));
create table if not exists Evaluation(idEleve int, idMatiere int, idTrimester int, idNiveau int, idAnnee int, participation DECIMAL(4,2), devoir1 DECIMAL(4,2), devoir2 DECIMAL(4,2), examen DECIMAL(4,2));
create table if not exists Seance(idSeance int primary key auto_increment, seance varchar(40), heur Time, idMatiere int, constraint Matiere_Seance_fk foreign key(idMatiere)
                    references Matiere(idMatiere) on delete cascade on update cascade);
create table if not exists la_Date(idDate int primary key auto_increment, laDate date);
create table if not exists Absence_Eleve(idEleve int, idSeance int, idDate int, siJustifier bool, constraint Eleve_Abs_E_fk foreign key(idEleve)
                           references Eleve(idEleve) on delete cascade on update cascade, constraint Seance_Abs_E_fk foreign key(idSeance)
                           references Seance(idSeance) on delete cascade on update cascade, constraint la_Date_Abs_E_fk foreign key(idDate)
                           references la_Date(idDate) on delete cascade on update cascade);
create table if not exists Absence_Enseignant(idEnseignant int, idSeance int, idDate int, siJustifier bool, constraint Enseignant_Abs_E_fk foreign key(idEnseignant)
                           references Enseignant(idEnseignant) on delete cascade on update cascade, constraint Seance_Abs_En_fk foreign key(idSeance)
                           references Seance(idSeance) on delete cascade on update cascade, constraint la_Date_Abs_En_fk foreign key(idDate)
                           references la_Date(idDate) on delete cascade on update cascade);
create table if not exists Matiere_Niveau(idMatiere int, idNiveau int, constraint Matiere_M_Niveau_fk foreign key(idMatiere) references Matiere(idMatiere)
                                          on delete cascade on update cascade, constraint Niveau_Matiere_N_fk foreign key(idNiveau) references Niveau(idNiveau)
                                          on delete cascade on update cascade);
<<<<<<< HEAD
/*ehllo wrold*/
||||||| merged common ancestors

=======
/*this comment its came from the github remote myDB */
/*and this is the seconde commit from github remote myDB*/

>>>>>>> e55c4d43dbe5261dddc234e787439788b774c221
