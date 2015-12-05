umask 077

yubico-piv-tool -k "$(cat ./yubico-internal-https-${USER}-key.txt)" \
	-a generate -s 9a -o public.pem
yubico-piv-tool -a verify-pin \
	-P "$(cat ./yubico-internal-https-${USER}-pin.txt)" \
	-a selfsign-certificate -s 9a -S "/CN=SSH key/" -i public.pem -o cert.pem
yubico-piv-tool -k "$(cat ./yubico-internal-https-${USER}-key.txt)" \
	-a import-certificate -s 9a -i cert.pem
ssh-keygen -D /usr/local/lib/opensc-pkcs11.so
