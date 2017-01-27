# Notes

## acme-client workflow (OpenBSD 6.0)
    doas acme-client -C /var/www/acme \
      -c /etc/ssl/acme/${DOMAIN} \
      -k /etc/ssl/acme/private/${DOMAIN}/privkey.pem \
      -f /etc/acme/privkey.pem \
      -vNn ${DOMAIN}

## opendnssec workflow
    doas cp zones/${DOMAIN} /var/opendnssec/unsigned/
    doas ods-signer sign ${DOMAIN}
    doas cp /var/opendnssec/signed/${DOMAIN} /var/nsd/zones/master/
    doas nsd-control reload ${DOMAIN}

