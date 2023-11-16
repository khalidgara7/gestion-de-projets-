
drop database if EXISTS gestion_database;
-- creation de base de donnée
create database if not exists gestion_database;

-- pour utiliser la base de donnée en utilise la requete use name de base donnée
use gestion_database;

-- la craetaion des tables 
-- -- creation de la table utilisateur
 create table if not exists utilisateur(id_utilisateur int primary key AUTO_INCREMENT,
                            nom varchar(50),
                            email varchar(50));

-- creation de la table utilisateur                        
create table if not exists projet(id_projet int primary key AUTO_INCREMENT,
                                    nom varchar(50),
                                    description varchar(500),
                                    date_debut date,
                                    date_fin date);  

-- creation de la table squads
 create table if not exists squads(id_squad int primary key AUTO_INCREMENT,
                                    id_utilisateur int,
                                    id_projet int,
                                    FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur),
                                    FOREIGN key (id_projet) REFERENCES projet(id_projet) );

-- creation de la table category
create table if not exists category(id_category int primary key AUTO_INCREMENT, nom_category varchar(20) unique);

-- creation de la table subcategory
create table if not exists subcategory(id_subcategory int primary key AUTO_INCREMENT,
                                        nom varchar(20),
                                        id_category int,
                                        unique(nom, id_category),
                                        FOREIGN key (id_category) REFERENCES category(id_category));   
-- creation de la table ressource
create table if not exists ressource(id_ressource int primary key AUTO_INCREMENT,
                                    nom varchar(20),
                                    id_category int,
                                    id_subcategory int,
                                    id_squad int,
                                    id_projet int,
                                    FOREIGN KEY (id_category) REFERENCES category(id_category),
                                    FOREIGN key (id_subcategory) REFERENCES subcategory(id_subcategory),
                                    FOREIGN KEY (id_squad) REFERENCES squads(id_squad),
                                    FOREIGN key (id_projet) REFERENCES projet(id_projet));

-- insertion des donnée / En tant qu'administrateur système, 
-- je veux créer de nouveaux utilisateurs dans la base de données 
-- pour maintenir une liste actualisée des membres de l'équipe

 insert into utilisateur (nom,email) values('khalid','khalidgara@gmail.com'),
                                            ('mouad','mouadfifel@gmail.com'),
                                            ('youssef','youssefmati@gmail.com'),
                                            ('khaldi','khalidfifel@gmail.com');



-- En tant que chef de projet, je veux créer un nouveau projet en fournissant
--  des détails tels que le nom, la description et les dates, 
--  pour définir clairement les paramètres de chaque projet.
insert into projet VALUES(null,'travel projet','Travel is the movement of people between distant geographical locations. Travel can be done by foot, bicycle, automobile,','2023-11-15','2023-12-15'),
                          (null,'formation sertifier','Une formation certifiante est une formation reconnue permettant de décrocher une certification officielle.','2023-11-15','2023-12-15'),
                          (null,'creation d\'entreprise',' Celle-ci figure automatiquement dans la liste du RNCP ','2023-11-15','2023-12-15');
                          
-- insertion des donnée de projet 
-- En tant que leader de squad, je souhaite créer un nouveau squad,
-- spécifiant le nom et ajoutant des membres à ce squad, 
-- pour former rapidement des équipes dédiées à des projets spécifiques.

INSERT into squads(id_projet,id_utilisateur) VALUES ('2','3'),
                                                    ('1','2');


-- En tant que membre de squad, je veux voir la liste des projets pour 
-- lesquels mon squad est responsable pour comprendre les projets actuels et suivre les responsabilités.                          
select p.id_projet, p.nom, p.description, p.date_debut, p.date_fin from utilisateur u 
INNER JOIN squads s ON u.id_utilisateur = s.id_squad
INNER JOIN projet p ON p.id_projet = s.id_projet 
where u.id_utilisateur = 1;

-- SELECT projet.* from projet, squads where projet.id_projet = squads.id_projet and squads.id_utilisateur = 2;

-- En tant que responsable des catégories et sous-catégories,
-- je souhaite créer de nouvelles catégories et sous-catégories
-- pour classer les ressources et organiser efficacement la base de données.

insert into category VALUES(null,'santé'),(null,'e-commerce');
insert into subcategory VALUES(null,'pharmacie',1),(null,'shipping',2);

-- En tant que responsable des ressources, je veux ajouter une nouvelle ressource en spécifiant son nom,
-- sa catégorie, sa sous-catégorie et son association éventuelle à un squad ou à un projet,
-- pour gérer efficacement les ressources disponibles.
insert into ressource VALUES(null,'minister santé',1,1,2,2),(null,'ali-baba',1,1,1,2); 

-- En tant que développeur Fullstack, je veux pouvoir mettre à jour les détails d'un utilisateur,
-- d'un squad, d'un projet ou d'une ressource existante pour ajuster les informations en fonction des évolutions.
update utilisateur set nom = 'anass' where id_utilisateur = 1;
UPDATE squads set id_utilisateur = 4 where id_squad = 1;
update projet set date_fin = '2023-12-20' where id_projet = 2;
update ressource set nom = 'gotntag' where id_ressource = 1;


select * from utilisateur;
DELETE from utilisateur where id_utilisateur >4;


