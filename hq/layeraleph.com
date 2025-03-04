$TTL 3600
@	IN SOA	ns1 named (
				2025030400 ; serial
				300        ; refresh (5m)
				600        ; retry (5m)
				8467200    ; expire (14w)
				3600       ; minimum (1h)
				)

@		NS	ns.layeraleph.com.
@		NS	ns6.gandi.net.

		IN A	207.148.3.69
		IN AAAA	2001:19f0:6401:7ee:5400:2ff:fe9f:e7bd
ns		IN A	207.148.3.69
ns		IN AAAA	2001:19f0:6401:7ee:5400:2ff:fe9f:e7bc
hq		IN A	207.148.3.69
hq		IN AAAA	2001:19f0:6401:7ee:5400:2ff:fe9f:e7bb

reactor		IN CNAME layeraleph.com.

mail		CNAME	ghs.googlehosted.com.
@		MX 	1 ASPMX.L.GOOGLE.COM.
@		MX	5 ALT1.ASPMX.L.GOOGLE.COM.
@		MX	5 ALT2.ASPMX.L.GOOGLE.COM.
@		MX	10 ALT2.ASPMX.L.GOOGLE.COM.
@		MX	10 ALT4.ASPMX.L.GOOGLE.COM.
@		TXT	"google-site-verification=rQUB_YcOTXiA8ofeg2SPLztMtfLbiOPUHd_NSdX_c9g"
@		TXT	"v=spf1 include:_spf.google.com ~all"
google._domainkey	TXT	(
	"v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiIksx"
	"7+9wYcgwgvkg4bUtY17j+TVVdQ4r2kdZKXkVN1+hKMWH0pKZ+1xmdWyDct2KMms9tDh"
	"u6S+RZ1AWrOL3fKZzQ6/coAe8AyyLXlKMAes5a0eSvU9eeJD+LazSkpX/tfQ2znfqZK"
	"kQf/FmZ5CkqMh5EgDVxJY9mPwA6R40UlNToXT6tMOR+5VDN2UvEaMbD2K5OJH+YEiwN"
	"sYq3E6vyj59jG+8pXiD1ZGL5aENmVzGv1SAWhrza+k9cAwi+uwbAZx4Bue2Pz5WQCNv"
	"8QmQJnAfy24uU5cWHbOhchJVvlF1HwoUP4AjGxTgsUqLQkte0wo++umMVCVRiAToWLI"
	"kQIDAQAB")

layeraleph.com.	IN CAA	0 issue "letsencrypt.org"
