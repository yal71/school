-- Création de la base de données  nommée facturation
-- Rejouable plusieurs fois sans erreur avec un "DROP IF EXISTS + CREATE IF NOT EXISTS"


-- Exécution en batch avec la commande si dessous : 
-- mysql -u root -p < schema.sql

DROP DATABASE IF EXISTS facturation;
CREATE DATABASE facturation
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE facturation;

CREATE TABLE client (
    id_client  INT          NOT NULL AUTO_INCREMENT,
    nom        VARCHAR(100) NOT NULL,
    prenom     VARCHAR(100) NOT NULL,
    CONSTRAINT pk_client PRIMARY KEY (id_client)
) ENGINE=InnoDB;

CREATE TABLE facture (
    id_facture    INT            NOT NULL AUTO_INCREMENT,
    num_facture   VARCHAR(20)    NOT NULL UNIQUE,
    date_emission DATE           NOT NULL,
    montant       DECIMAL(10, 2) NOT NULL,
    est_payee     TINYINT(1)     NOT NULL DEFAULT 0,
    id_client     INT            NOT NULL,
    CONSTRAINT pk_facture    PRIMARY KEY (id_facture),
    CONSTRAINT fk_fact_client FOREIGN KEY (id_client)
        REFERENCES client (id_client)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;
