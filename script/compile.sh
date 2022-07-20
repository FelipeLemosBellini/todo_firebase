#! /bin/bash

for d in ../*/
do
	if [ "${d%/}" != "../script" ] && [ "${d%/}" != "../keys" ]
		then
		echo "Entrando na pasta ${d%/}";
		cd "${d%/}";
		echo "Limpando ... ";
		flutter clean;
		echo "Executando pub get ... ";
		flutter pub get;
	fi
done
exit 0;
		

