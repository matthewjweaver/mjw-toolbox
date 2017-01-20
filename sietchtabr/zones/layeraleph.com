$TTL 3600
@	IN SOA	ns1 named (
				2017012001 ; serial
				300        ; refresh (5m)
				300        ; retry (5m)
				8467200    ; expire (14w)
				3600       ; minimum (1h)
				)
		NS	ns1.nodeless.net.
		NS	ns6.gandi.net.

		IN A	108.56.184.72

mail		CNAME	ghs.googlehosted.com.
@		MX 	1 ASPMX.L.GOOGLE.COM.
@		MX	5 ALT1.ASPMX.L.GOOGLE.COM.
@		MX	5 ALT2.ASPMX.L.GOOGLE.COM.
@		MX	10 ALT2.ASPMX.L.GOOGLE.COM.
@		MX	10 ALT4.ASPMX.L.GOOGLE.COM.
@		TXT	"google-site-verification=rQUB_YcOTXiA8ofeg2SPLztMtfLbiOPUHd_NSdX_c9g"
google._domainkey	TXT	(
	"v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiIksx"
	"7+9wYcgwgvkg4bUtY17j+TVVdQ4r2kdZKXkVN1+hKMWH0pKZ+1xmdWyDct2KMms9tDh"
	"u6S+RZ1AWrOL3fKZzQ6/coAe8AyyLXlKMAes5a0eSvU9eeJD+LazSkpX/tfQ2znfqZK"
	"kQf/FmZ5CkqMh5EgDVxJY9mPwA6R40UlNToXT6tMOR+5VDN2UvEaMbD2K5OJH+YEiwN"
	"sYq3E6vyj59jG+8pXiD1ZGL5aENmVzGv1SAWhrza+k9cAwi+uwbAZx4Bue2Pz5WQCNv"
	"8QmQJnAfy24uU5cWHbOhchJVvlF1HwoUP4AjGxTgsUqLQkte0wo++umMVCVRiAToWLI"
	"kQIDAQAB")

