# Modul 300 
Mein Dockerfile für die LB3 beinhaltet einen einfachen Webserver mit PHP erweiterung und ein MySQL Service plus eine Test DB. 

Wie gewohnt müssen Sie natürlich zuerst dieses Repo bei Ihnen Klonen. Meine Dokumentation finden Sie im Ordner **Dokumentation** und mein Dockerfile liegt in diesem Verzeichnis. Doch damit Sie das Dockerfile erfolgreich ausführen können, müssen Sie zuerst den Befehl **sudo docker build -t EinBeliebigerName.** ausführen und dann mit folgendem Befehl **sudo docker run -dit -p 8080** das Dockerfile starten. 

Ich erkläre Ihnen, wie Sie meine Service benutzen können ohne selber lange zu suchen. 

### Webserver
Der Webserver ist unter **localhost:8080** erreichbar. 

### MySQL
Der MySQL Server ist unter **mysql --user jgn --password Pa$$w0rd** erreichbar. 
Mit dem Befehl **mysql -u root -proot -e "CREATE DATABASE ihredbname;"** können Sie schnell und einfach eine DB erstellen. 
