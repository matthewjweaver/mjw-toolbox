ETC=hostname.* pf.conf

.PHONY: install
install: ${ETC} unbound.conf
	cp ${ETC} /etc/
	cp unbound.conf /var/unbound/etc/unbound.conf

