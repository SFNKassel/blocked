install: 
	cp -TRf src /usr/local/bin/blocked
	chmod 755 /usr/local/bin/blocked/main.py
	install -o root -g root -m 755 blocked /etc/init.d/ 		
	update-rc.d blocked defaults
	sed 's/Listen 80/Listen 192.168.1.1:80/' -i /etc/univention/templates/files/etc/apache2/ports.conf
	sed 's/Listen 443/Listen 192.168.1.1:443/' -i /etc/univention/templates/files/etc/apache2/mods-available/ssl.conf
	univention-config-registry commit /etc/apache2/ports.conf
	univention-config-registry commit /etc/apache2/mods-available/ssl.conf
	service apache2 restart
	service blocked restart
