$TTL 3600
@	IN SOA	ns1 named (
				2019193010 ; serial
				300        ; refresh (5m)
				600        ; retry (5m)
				8467200    ; expire (14w)
				3600       ; minimum (1h)
				)

@		NS	ns.layeraleph.com.
@		NS	ns6.gandi.net.

		IN A	72.83.160.21

layerbeh.com.	IN CAA	0 issue "letsencrypt.org"
