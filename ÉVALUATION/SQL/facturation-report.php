<?php

// programme rapport de facturationù

// exécution dans le bash
// php facturation-report.php

// connexion mysql
$host     = 'localhost';
$dbname   = 'facturation';
$user     = 'root';
$password = 'adminpw';            

try {
    $pdo = new PDO(
        "mysql:host=$host;dbname=$dbname;charset=utf8mb4",
        $user,
        $password,
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
} catch (PDOException $e) {
    echo "Erreur de connexion : " . $e->getMessage() . PHP_EOL;
    exit(1);
}

// nmbre total de factures
$stmt = $pdo->query("SELECT COUNT(*) FROM facture");
$totalFactures = (int) $stmt->fetchColumn();

// nombre de factures impayées
$stmt = $pdo->query("SELECT COUNT(*) FROM facture WHERE est_payee = 0");
$totalImpayes = (int) $stmt->fetchColumn();

/// nombre de factures impayées > 500 €
$stmt = $pdo->query("SELECT COUNT(*) FROM facture WHERE est_payee = 0 AND montant > 500");
$totalImpayesGt500 = (int) $stmt->fetchColumn();

// montant des totaux impaye
$stmt = $pdo->query("SELECT COALESCE(SUM(montant), 0) FROM facture WHERE est_payee = 0");
$montantTotalImpaye = (float) $stmt->fetchColumn();

// affichage du rapport sur stdout
$dateGeneration = (new DateTime())->format('d/m/y');

echo "Facturation - Rapport généré le $dateGeneration" . PHP_EOL;
echo "- Nombre total de factures : $totalFactures"                                    . PHP_EOL;
echo "- Nombre de factures impayées : $totalImpayes"                                  . PHP_EOL;
echo "- Nombre de factures impayées > 500 : $totalImpayesGt500"                       . PHP_EOL;
echo "- Montant total impayé : " . number_format($montantTotalImpaye, 2, '.', '') . " EUROS" . PHP_EOL;
