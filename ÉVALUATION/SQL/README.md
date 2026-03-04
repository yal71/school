# Facturation // Scripts SQL

Projet de gestion de facturation réalisé dans le cadre du cours de MYSQL


```bash
# Créer la base de données et les tables
mysql -u root -p < schema.sql

# Insérer les données de test
mysql -u root -p facturation < dataset.sql

# Exécuter les requêtes de consultation
mysql -u root -p facturation < requests.sql

# Générer le rapport
php facturation-report.php
```
