#!/bin/bash

# Vérifier si un domaine est fourni
if [ -z "$1" ]; then
    echo "Usage: $0 <domaine>"
    exit 1
fi

domain=$1
echo "Recherche des sous-domaines, adresses IP, et codes HTTP pour : $domain ..."

# Récupérer les sous-domaines
subdomains=$(curl -s "https://crt.sh/?q=%25.$domain&output=json" | grep -o '"common_name":"[^"]*' | sed 's/"common_name":"//g' | sort -u)

# Boucle pour afficher chaque sous-domaine avec son adresse IP et code HTTP
for subdomain in $subdomains; do
    ip=$(dig +short $subdomain | head -n 1) # Récupère l'adresse IP
    http_code=$(curl -o /dev/null -s -w "%{http_code}" http://$subdomain) # Récupère le code HTTP
    echo "$subdomain | IP: ${ip:-Non trouvée} | HTTP Code: ${http_code:-N/A}"
done

