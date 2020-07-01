# Dokumentation Modul 300 
## Einführung
Das ist meine Dokumentation zu meiner LB2. In meinem Vagrantfile habe ich einen einfachen Webserver mit PHP und MySQL Service eingebaut. 
Wie man auf meinem Server zugreift und wie man ihn benutzt, habe ich im **README.md** erklärt.
In dieser Dokumentation werde ich meinen Code im **vagrantfile** sowie **bootstrap.sh** ausführlich erklären. 

Wichtig: Ich werde meinen Code mit `//` markieren. 

## Vagrantfile
`// Vagrant.configure(2) do |config|`<br>
Mit folgender Zeile nimmt Vagrant verschiedene Konfigurationen vor, die jetzt folgen.

`// config.vm.box = "ubuntu/xenial64"`<br>
`// config.vm.network "forwarded_port", guest:80, host:8080, auto_correct: true`<br>
`// config.vm.synced_folder ".", "/var/www/html"`<br>
Die erste Zeile zeigt Vagrant, welches OS benutzt werden soll. In der zweiten Zeile wird ein Portforwarding erstellt. Der Gästeport lautet 80 und dieser wird zum Host Port 8080 weitergeleitet und bei Probleme selber korrigiert. Dieser Port wird von Apache benutzt. Zuletzt wird ein Syncfolder erstellt, dass heisst alles was im jetzigen Ordner (.) gemacht wird, hat auch auswirkungen im Guest Ordner /var/www/html .

`// config.vm.network "forwarded_port", guest: 3306, host: 3306`<br>
`// config.vm.provision :shell, path: "bootstrap.sh"`<br>
In der ersten Zeile wird ein Portforwarding erstellt. Der Gästeport lautet 3306 und dieser wird zum Host Port 3306 weitergeleitet. Dieser Port wird von MySQL benutzt. Mit der zweiten Zeile wird dem Shell angewiesen, es soll das Skript **bootstrap.sh** ausführen. 

`// config.vm.provider "virtualbox" do |vb|`<br>
`//  vb.memory = "512"`<br>
`// end`<br>
Nun werden Konfigurationen an der Virtualbox vorgenommen, nicht wie vorher an Vagrant. Das wird hier |vb| definiert. Bei diesen Konfigurationen wird der VM einen RAM-Speicher von 512MB gegeben. Zuletzt wird die Konfiguration von Vagrant und der VM geschlossen mit **end**. 

`// config.vm.provision "shell", inline: <<-SHELL`<br>
Hier werden nicht mehr die "äussere" Konfigurationen bearbeitet, sondern, dass was in der VM läuft. Mit dieser Zeile wird der Shell gesagt, dass was folgt, soll in der Shell geschrieben und ausgeführt werden.

`// sudo apt-get update`<br>
`// sudo apt-get -y install apache2`<br>
Die erste Zeile updatet verschiedenste Packages, falls nötig und die zweite Zeile installiert den Webserver Apache. 

`// sudo apt-get -y install php`<br>
`// sudo apt-get -y install php-{bcmath,bz2,intl,gd,mbstring,mcrypt,mysql,zip} && sudo apt-get -y install libapache2-mod-php`<br>
Zuerst wird PHP installiert und darauf verschiedenste PHP Module und Erweiterungen sowie eine Library für Apache und PHP zusammen. 

`// sudo systemctl enable apache2.service`<br>
Dieser Kommand erlaubt es Apache beim Starten der VM zu starten. 

`// sudo systemctl restart apache2.service`<br>
Hier wird Apache neugestartet, dass die Änderungen vorgenommen werden können.

`// sudo a2enmod rewrite`<br>
Mit diesem Kommand erhält Apache wichtige zusätzliche Funktionen, was einen Webserver im Webauftritt verbessert. 

`// SHELL`<br>
`// end`<br>
Zuletzt wird die Shell sowie die Konfigurationen geschlossen und beendet. Das Vagrantfile ist somit durch!

## Bootstrap.sh
Die Datei **Bootstrap.sh** ist ein zusätzlicher Shell Skript. Die Bennenung der Datei hat keine bestimmte Rolle. Es ist einfach ein Default, den man so normalerweise benutzt. Er könnte durch einen X-beliebigen Namen ersetzt werden. 

`// #!/usr/bin/env bash`<br>
Diese Zeile weist das Betriebssystem an, diese Datei mit dem Interpreter-Programm /usr/bin/env bash auszuführen. 

`// apt-get update`<br>
Hier werden die verschiedenen Packet geupdatet, falls nötig. 

`// debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'`<br>
`// debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'`<br>
Mit diesen Zeilen wird für den Benutzer **root** das Passwort **root** gesetzt. 

`// apt-get install -y mysql-server mysql-client`<br>
Diese Zeile installiert die Packages mysql-server und mysql-client. Die werden für den MySQL Server gebraucht. 

`// sudo sed -i -e 's/bind-addres/#bind-address/g' /etc/mysql/mysql.conf.d/mysqld.cnf`<br>
`// sudo sed -i -e 's/skip-external-locking/#skip-external-locking/g' /etc/mysql/mysql.conf.d/mysqld.cnf`<br>
`// mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root'; FLUSH privileges;"`<br>
`// sudo service mysql restart`<br>
Folgende Zeilen erlauben es externe Verbindungen zum MySQL Server aufzubauen. Zuerst werden zwei Änderungen in den MySQL Konfigurationsdatein vorgenommen, dann wird dem Benutzer root von überall aus Berechtigungen erteilt und zuletzt mysql neugestartet. Damit werden die Änderungen erfolgreich übernommen. 

`// mysql -u root -proot -e "CREATE DATABASE myDB;"`<br>
Dieser MySQL Befehl erstellt eine Test DB namens **myDB**.

## Fazit
Vagrant war für mich komplett neu. Ich hatte vor dem Modul noch nie davon gehört oder irgendetwas damit zu tun. Ich konnte dennoch relativ schnell mich mit Vagrant verstehen. Ich verstand es sehr gut, vielleicht liegt es daran, dass ich nur mit Unix Systemen zu tun habe und somit ein Wissen in diesem Bereich schon hatte. Das Modul hat mir gut gefallen, da wir selber etwas machen und so eine gewisse Freiheit geniessen konnten. 
