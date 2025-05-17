# Script pour créer un fichier de taille X Go

# Demande la taille en Go
$tailleGo = Read-Host "Entrez la taille du fichier en Go (ex: 5)"

# Convertit la taille en Int64 (long) et calcule en octets
$tailleGoInt64 = [int64]$tailleGo
$tailleOctets = $tailleGoInt64 * 1GB

# Demande le chemin complet du fichier à créer
$cheminFichier = Read-Host "Entrez le chemin complet du fichier à créer (ex: C:\temp\monfichier.bin)"

# Création du fichier avec fsutil
Write-Host "Création du fichier $cheminFichier de $tailleGo Go..."

# Utilisation de fsutil (requiert d’être lancé en administrateur)
Start-Process -FilePath "fsutil" -ArgumentList "file createnew `"$cheminFichier`" $tailleOctets" -Wait

Write-Host "Fichier créé avec succès."
