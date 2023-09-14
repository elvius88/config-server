#!/bin/sh
getPort() {
    echo $1 | cut -d : -f 3 | xargs basename
}

echo "********************************************************"
echo "Inicializando el Conf-Server"
echo "********************************************************"
echo "********************************************************"
echo "Chequeando que el Discovery este activo en $DISCOVERY_URI "
echo "********************************************************"
while ! `nc -z discovery $DISCOVERY_PORT`; do sleep 3; done
echo ">>>>>>>>>>>> Discovery Server se inicializo"

echo "********************************************************"
echo "Iniciando el Conf-Server con Discovery en:  $DISCOVERY_URI";
echo "********************************************************"
cd /usr/local/@project.artifactId@/
java    -Djava.security.egd=file:/dev/./urandom  -Dserver.port=$SERVER_PORT \
        -Deureka.client.serviceUrl.defaultZone=$DISCOVERY_URI \
        -Dspring.profiles.active=$PROFILE \
        -jar @project.build.finalName@.jar