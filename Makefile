install: 
	cp -TRf src /usr/local/bin/blocked
	chmod 755 /usr/local/bin/blocked/main.py
	install -o root -g root -m 755 blocked /etc/init.d/ 		
	update-rc.d blocked defaults
	service blocked restart
