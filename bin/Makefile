all: \
  /home/sysop/bin/backup.sh \
  /home/sysop/bin/maintain.sh

/home/sysop/bin/backup.sh : backup.sh
	doas install -o sysop -g wheel -m 0750 \
	  backup.sh /home/sysop/bin/backup.sh

/home/sysop/bin/maintain.sh : maintain.sh
	doas install -o sysop -g wheel -m 0750 \
	  maintain.sh /home/sysop/bin/maintain.sh

