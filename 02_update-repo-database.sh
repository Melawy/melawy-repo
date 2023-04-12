#!/bin/bash
#set -e
##################################################################################################################
# Author 	: 	Valeria Fadeeva
# Website : 	https://valeria.fadeeva.me
# Website	:	https://fadeeva.me
# Website	:	https://github.com/Valeria-Fadeeva
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

repo="melawy"

rm ./x86_64/$repo.db
rm ./x86_64/$repo.files
rm ./x86_64/$repo.db.sig
rm ./x86_64/$repo.files.sig
rm ./x86_64/$repo.db.tar.gz
rm ./x86_64/$repo.files.tar.gz
rm ./x86_64/$repo.db.tar.gz.sig
rm ./x86_64/$repo.files.tar.gz.sig

repo-add --verify --sign --key 95F48000540A4DB146583A47C49B5E77FD80302D --new --remove --prevent-downgrade ./x86_64/$repo.db.tar.gz ./x86_64/*.pkg.tar.{zst,xz}

mv -f ./x86_64/$repo.db.tar.gz ./x86_64/$repo.db
mv -f ./x86_64/$repo.files.tar.gz ./x86_64/$repo.files
mv -f ./x86_64/$repo.db.tar.gz.sig ./x86_64/$repo.db.sig
mv -f ./x86_64/$repo.files.tar.gz.sig ./x86_64/$repo.files.sig

echo "################################################################"
echo "###################    Update Done        ######################"
echo "################################################################"