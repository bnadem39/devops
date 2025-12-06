# Script de vérification et d'aide au démarrage
# Projet : Système de Gestion d'Hôtel - Java 21 + JavaFX 21

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Système de Gestion d'Hôtel" -ForegroundColor Cyan
Write-Host "  Vérification de l'environnement" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Vérification Java
Write-Host "[1/3] Vérification de Java..." -ForegroundColor Yellow
try {
    $javaVersion = java -version 2>&1 | Select-String "version" | Out-String
    Write-Host "✓ Java installé" -ForegroundColor Green
    Write-Host $javaVersion.Trim() -ForegroundColor Gray

    if ($javaVersion -match "21") {
        Write-Host "✓ Java 21 détecté" -ForegroundColor Green
    } else {
        Write-Host "⚠ Java 21 recommandé (version actuelle différente)" -ForegroundColor Yellow
    }
} catch {
    Write-Host "✗ Java non trouvé dans le PATH" -ForegroundColor Red
    Write-Host "  Téléchargez JDK 21 Temurin : https://adoptium.net/" -ForegroundColor Yellow
}

Write-Host ""

# Vérification Maven
Write-Host "[2/3] Vérification de Maven..." -ForegroundColor Yellow
try {
    $mavenVersion = mvn -version 2>&1 | Select-String "Apache Maven" | Out-String
    Write-Host "✓ Maven installé" -ForegroundColor Green
    Write-Host $mavenVersion.Trim() -ForegroundColor Gray
} catch {
    Write-Host "⚠ Maven non trouvé dans le PATH" -ForegroundColor Yellow
    Write-Host "  Maven est optionnel si vous utilisez IntelliJ IDEA" -ForegroundColor Gray
    Write-Host "  Pour ligne de commande : https://maven.apache.org/download.cgi" -ForegroundColor Gray
}

Write-Host ""

# Vérification de la structure du projet
Write-Host "[3/3] Vérification de la structure du projet..." -ForegroundColor Yellow

$requiredFiles = @(
    "pom.xml",
    "src\main\java\module-info.java",
    "src\main\java\com\hotel\main\MainApp.java",
    "src\main\java\com\hotel\data\StaticData.java",
    "src\main\java\com\hotel\view\fxml\login.fxml",
    "src\main\java\com\hotel\view\css\style.css"
)

$allFilesExist = $true
foreach ($file in $requiredFiles) {
    if (Test-Path $file) {
        Write-Host "  ✓ $file" -ForegroundColor Green
    } else {
        Write-Host "  ✗ $file manquant" -ForegroundColor Red
        $allFilesExist = $false
    }
}

Write-Host ""

if ($allFilesExist) {
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  ✓ PROJET PRÊT À FONCTIONNER !" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
} else {
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "  ✗ Certains fichiers manquent" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
}

Write-Host ""
Write-Host "----------------------------------------" -ForegroundColor Cyan
Write-Host "COMMENT DÉMARRER :" -ForegroundColor Cyan
Write-Host "----------------------------------------" -ForegroundColor Cyan
Write-Host ""
Write-Host "Méthode 1 (Recommandée) - IntelliJ IDEA :" -ForegroundColor White
Write-Host "  1. Ouvrez IntelliJ IDEA" -ForegroundColor Gray
Write-Host "  2. File → Open → Sélectionnez ce dossier" -ForegroundColor Gray
Write-Host "  3. Configurez JDK 21 (File → Project Structure)" -ForegroundColor Gray
Write-Host "  4. Clic droit sur pom.xml → Maven → Reload Project" -ForegroundColor Gray
Write-Host "  5. Ouvrez MainApp.java → Clic droit → Run" -ForegroundColor Gray
Write-Host ""
Write-Host "Méthode 2 - Ligne de commande Maven :" -ForegroundColor White
Write-Host "  mvn clean javafx:run" -ForegroundColor Gray
Write-Host ""
Write-Host "----------------------------------------" -ForegroundColor Cyan
Write-Host "COMPTES DE TEST :" -ForegroundColor Cyan
Write-Host "----------------------------------------" -ForegroundColor Cyan
Write-Host "  admin / 123      → Administrateur" -ForegroundColor White
Write-Host "  reception / 123  → Réceptionniste" -ForegroundColor White
Write-Host "  ali / 123        → Client" -ForegroundColor White
Write-Host "  sarra / 123      → Client" -ForegroundColor White
Write-Host ""
Write-Host "----------------------------------------" -ForegroundColor Cyan
Write-Host "DOCUMENTATION :" -ForegroundColor Cyan
Write-Host "----------------------------------------" -ForegroundColor Cyan
Write-Host "  README.md          → Documentation complète" -ForegroundColor Gray
Write-Host "  QUICK_START.md     → Résumé rapide" -ForegroundColor Gray
Write-Host "  INTELLIJ_SETUP.md  → Guide IntelliJ détaillé" -ForegroundColor Gray
Write-Host ""
Write-Host "Bon développement ! 🚀" -ForegroundColor Green
Write-Host ""

