# Dokumentation Docker Modul 300 
## Einführung
Das ist meine Dokumentation zu meiner LB3. Mit meinem Docker- und Docker-Compose File habe ich einen einfachen Webserver mit PHP und MySQL Service eingebaut. 
Wie man auf meinem Server zugreift und wie man ihn benutzt, habe ich im **README.md** erklärt.
In dieser Dokumentation werde ich meinen Code im **Dockerfile** sowie **docker-compose.yml** ausführlich erklären. 

Wichtig: Ich werde meinen Code mit `//` markieren. 

Zum Schluss gibt es noch ein kleines Fazit zu meiner Erfrahrung mit Docker.

## Dockerfile
`// FROM nginx:latest`<br>
Mit FROM wird das neuste Nginx Docker Image benutzt für den Webserver. 

`// MAINTAINER Erduan erduan.saiti@edu.tbz.ch`<br>
Als Maintainer wird der Admin des Containers festgehalten. Bei mir jetzt, bin ich, Erduan der Admin. Als Zusatzinformation gebe ich noch die Mail an. 

`// RUN apt-get -y update && apt-get -y upgrade && apt-get install -y php-fpm`<br>
RUN führt einen beliebigen Command aus. Der obige Command updatet und upgradet das Betriebsystem auf dem neusten Stand. Dazu wird noch PHP installiert. 

`// COPY index.html /var/www/html/`<br>
COPY kopiert ein beliebes File/Verzeichnis an einem gewünschten Ort. Hier wird das Index File meines Webserver in das Root Verzeichnis meines Websever (nginx) kopiert. 

`// EXPOSE 80`<br>
EXPOSE gibt an welchen Port dieser Container benutzen soll. In diesem Fall der Port 80.

## Docker-Compose

`// version: '3'`<br>
Mit Version wird die gewünschte Docker Compose Version genutzt. Version 3 bzw. 3.8 ist die neuste Version. 

`// services:`<br>
Unter Services sind alle Dienste, die der Container installieren und konfigurieren soll, aufgelistet.

`// web:`<br>
Web steht für den Dienst des Webservers und somit werden Installationen und Konfigurationen von Webdiensten erwartet.

`// build: .`<br>
Mit Build werden die Service des Docker Compose gebildet. Es gibt auch ein Dockerfile Build. Hier wird mit dem Punkt angegeben, es soll das Dokerfile benutzen, das im gleichen Verzeichnis liegt.

`// ports:`<br>
`//   - "8080:80"`<br>
Mit Ports wird eine Portweiterleitung erstellt. In diesem Fall wird der Port 80 des Container auf den Host Port 8080 weitergeleitet.

`// db:`<br>
DB steht für den Dienst des Datenbankservers und somit werden Installationen und Konfigurationen von Datenbankdiensten erwartet.

`// image: mysql`<br>
Image wird benutzt, wenn man ein bestimmtes Docker Image braucht und hier ist das gewünschte Image MySQL. 

`// ports:`<br>
`//   - "3306:3306"`<br>
Mit Ports wird eine Portweiterleitung erstellt. In diesem Fall wird der Port 3306 des Container auf den Host Port 3306 weitergeleitet.

`// environment:`<br>
`//    - MYSQL_ROOT_PASSWORD=erdu`<br>
`//    - MYSQL_USER=erdu`<br>
`//    - MYSQL_PASSWORD=erdu`<br>
`//    - MYSQL_DATABASE=M300`<br>
Mit Environment ist die Umgebung des MySQL Sever gemeint. In der ersten Zeile wird das Root Passwort (erdu) gesetzt, dann ein Benutzer (erdu) erstellt, dazu noch ein Passwort (erdu) und deine Datenbank namens M300. 

## Fazit 
Docker kannte ich, doch nie benutzt. Ich habe in diesem Modul vieles neues über Docker gelernt und gelesen. Nicht nur das, ich habe auch zum ersten mal mit Docker arbeiten können, was eine Premiere für mich ist. Das Modul hat mir gut gefallen und ich konnte neues Wissen mir aneignen in einem neuen Themengebiet. 
