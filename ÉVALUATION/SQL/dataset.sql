-- insertion des données test

USE facturation;

INSERT INTO client (nom, prenom) VALUES
    ('Doe', 'John'),
    ('Doe', 'Jane');

INSERT INTO facture (num_facture, date_emission, montant, est_payee, id_client) VALUES
    ('F-900-08', '2022-12-12', 120.50, 0, 1),
    ('F-500-02', '2023-01-13',  90.00, 1, 1);

INSERT INTO facture (num_facture, date_emission, montant, est_payee, id_client) VALUES
    ('Z-500-03', '2023-01-01', 1000.00, 0, 2),
    ('J-400-02', '2023-09-11',  800.00, 1, 2),
    ('F-434-04', '2022-12-23',  400.00, 0, 2),
    ('J-333-05', '2023-01-27', 1250.00, 0, 2);
