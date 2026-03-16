-- CANDIDATS
INSERT INTO Candidat (id, nom, prenom, matricule) VALUES
(1,'Candidat1','c1','C001'),
(2,'Candidat2','c2','C002');

-- CORRECTEURS
INSERT INTO Correcteur (id, nom) VALUES
(1,'Correcteur1'),
(2,'Correcteur2'),
(3,'Correcteur3');

-- MATIERES
INSERT INTO Matiere (id, nom) VALUES
(1,'JAVA'),
(2,'PHP');

-- RESOLUTIONS
INSERT INTO Resolution (id, nom) VALUES
(1,'plus petit'),
(2,'plus grand'),
(3,'moyenne');

-- OPERATEURS
INSERT INTO Operateur (id, nom) VALUES
(1,'<'),
(2,'<='),
(3,'>'),
(4,'>=');

-- PARAMETRES
-- Ici les deux paramètres doivent être valides et avoir la même distance
-- mais le programme doit choisir celui avec le seuil le plus petit (5)

-- PARAMETRES
-- PARAMETRES
INSERT INTO Parametres (id,id_matiere,seuil,id_operateur,id_resolution) VALUES
(1,1,5,4,3);   -- >= 5 → moyenne

-- NOTES
INSERT INTO Note (id_candidat,id_matiere,id_correcteur,note) VALUES
(1,1,1,10),
(1,1,2,16);