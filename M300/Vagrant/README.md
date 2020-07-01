# Modul 300 
Ich habe für die LB2 einen einfachen Webserver mit PHP Erweiterung und ein MySQL Service plus eine Test Datenbank erstellt. 

Wie gewohnt müssen Sie natürlich zuerst dieses Repo bei Ihnen Klonen. Meine Dokumentation finden Sie im Ordner **Dokumentation** und mein Vagrantfile im Ordner **M300**. Dann mit einem **vagrant init vagrantfile** und **vagrant up** meine Datei ausführen. 

Ich erkläre Ihnen, wie Sie meine Service benutzen können ohne selber lange zu suchen. 

### Webserver
Der Webserver ist unter **localhost:8080** erreichbar.

### MySQL
Der MySQL Server ist unter **vagrant ssh** -> **mysql -u root -proot** erreichbar. 
Mit dem Befehl **mysql -u root -proot -e "CREATE DATABASE ihredbname;"** können Sie schnell und einfach eine DB erstellen. 
