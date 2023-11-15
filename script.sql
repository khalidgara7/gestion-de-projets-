-- creation de base de donnée
create database if not exists gestion_database;

-- pour utiliser la base de donnée en utilise la requete "use name 'de base donnée'"
use gestion_database;

-- la craetaion des tables 
 create table if not exists utilisateur(id_utilisateur int primary key AUTO_INCREMENT,
                         nom varchar(50),
                         email varchar(50));
                         
create table if not exists projet(id_projet int primary key AUTO_INCREMENT,
                    nom varchar(50),
                    description varchar(500),
                    date_debut date,
                    date_fin date);  

 create table if not exists squads(id_squad int primary key AUTO_INCREMENT,
                    id_utilisateur int,
                    id_projet int,
                    FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur),
                    FOREIGN key (id_projet) REFERENCES projet(id_projet) );
   

create table if not exists category(id_category int primary key AUTO_INCREMENT);

create table if not exists subcategory(id_subcategory int primary key AUTO_INCREMENT,
                        id_category int,
                         FOREIGN key (id_category) REFERENCES category(id_category));                                      
create table if not exists ressource(id_ressource int primary key AUTO_INCREMENT,
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

 insert into utilisateur (nom,email) values('khalid','khalidgara@gmail.com')

