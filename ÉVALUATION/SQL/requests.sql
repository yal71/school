-- requête de consultation
-- exécution dans le bash 
--      mysql -u root -p facturation < requests.sql


USE facturation;

--les factures impayées // retourne toutes les factures dont est_payee = 0
SELECT
    f.num_facture,
    f.date_emission,
    f.montant,
    c.nom,
    c.prenom
FROM facture f
JOIN client c ON f.id_client = c.id_client
WHERE f.est_payee = 0
ORDER BY f.date_emission;


-- factures impayées dont le montant est supérieur à 500  // filtre sur est_payee = 0 ET montant > 500

SELECT
    f.num_facture,
    f.date_emission,
    f.montant,
    c.nom,
    c.prenom
FROM facture f
JOIN client c ON f.id_client = c.id_client
WHERE f.est_payee = 0
  AND f.montant > 500
ORDER BY f.montant DESC;


-- factures de l'année 2022
-- utilise YEAR() pour avoir l'année de la date d'émission

SELECT
    f.num_facture,
    f.date_emission,
    f.montant,
    f.est_payee,
    c.nom,
    c.prenom
FROM facture f
JOIN client c ON f.id_client = c.id_client
WHERE YEAR(f.date_emission) = 2022
ORDER BY f.date_emission;


-- factures impayées de l'année 2023
-- combine le filtre sur l'année and sur le statut de paiement

SELECT
    f.num_facture,
    f.date_emission,
    f.montant,
    c.nom,
    c.prenom
FROM facture f
JOIN client c ON f.id_client = c.id_client
WHERE f.est_payee = 0
  AND YEAR(f.date_emission) = 2023
ORDER BY f.date_emission;
