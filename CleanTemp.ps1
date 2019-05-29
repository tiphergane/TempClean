Set-ExecutionPolicy unrestricted
######################################################################
# Script vider les fichers temporaire
# version: 1.1
# Auteur: tiphergane / Meoowrwa
# Synopsis: Effacer les différents répertoires de fichiers temporaire.
# Usage: dans un powershell en mode admin, executer le script pour faire le ménage
######################################################################

function CleanTemp {
    #Pour effacer le contenu du repertoire sans distinction d'extensions
    Remove-Item *
}

function testrep {

    #On test si le répertoire existe
    if (Test-Path -Path $repertoire)
    {
    #et si oui alors on le vide
    Write-Output "Nettoyage de $repertoire en cours…"
    Set-Location -Path $repertoire
    CleanTemp
    }
    else
    {
    #si non, on affiche qu'il n'existe pas et on passe au suivant.
    Write-Output "le repertoire $repertoire n'existe pas"
    }
}

$repertoire = "C:\Windows\Temp"
testrep
$repertoire = "C:\$([Environment]::UserName)\Temp"
testrep
Remove-Variable repertoire
