#!/bin/sh

#$list of sun processes pid
pids=""

#signal handler
on_die() {
	echo "Arrêt de tous les processus ..."
	for pid in $pids
	do
		kill -TERM $pid
		echo "$pid arrete"
	done
	echo "done"
	exit 0
}

#enregistrement du handler
trap 'on_die' INT


#Base de données
if ../../mongodb/bin/mongod --dbpath=../../mongodb/data/db > /dev/null 2>&1 &
then
	pids="$pids $!"
	echo "base de données démarrée ($!)"
else
	echo "erreur lors du demarrage de la base de donnée"
	kill -SIGINT $$
fi

#Environnement virtuel
if source ../bin/activate
then
	echo "environnement virtuel activé"
else
	echo "erreur lors de l'activation de l'environnement virtuel"
	kill -SIGINT $$
fi

#Script lireSerial.py
if ../bin/python lireSerial.py $1 > /dev/null 2>&1 &
then
	pids="$pids $!"
	echo "démarrage de l'écoute sur le Serial ($!)"
else
	echo "erreur lors du démarrage du script d'écoute sur le Serial"
	kill -SIGINT $$
fi


#Serveur 
if ../bin/pserve ../serveur/serveur.ini $1 > /dev/null 2>&1 &
then
	echo "Demarrage du serveur web ($!)"
	pids="$pids $!"
else
	echo "erreur lors du démarrage du serveur web ($!)"
	kill -SIGINT $$
fi

#checks sun processes
while true
do
	if [ -n "$pids" ]
	then
		for pid in $pids
		do
			kill -0 "$pid" 2> /dev/null || pids=$(echo $pids | sed "s/\b$pid\s*//")
		done
	else
		echo "All your process completed"
		break
	fi
	sleep 1
done
