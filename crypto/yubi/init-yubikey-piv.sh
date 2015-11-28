umask 077

key=$(
	dd if=/dev/random bs=1 count=24 2>/dev/null |
		hexdump -v -e '/1 "%02X"'
)
echo "$key" >"yubico-internal-https-$USER-key.txt"

pin=$(
	dd if=/dev/random bs=1 count=6 2>/dev/null |
		hexdump -v -e '/1 "%u"' | cut -c1-6
)
echo "$pin" >"yubico-internal-https-$USER-pin.txt"

puk=$(
	dd if=/dev/random bs=1 count=6 2>/dev/null |
		hexdump -v -e '/1 "%u"' | cut -c1-8
)
echo "$puk" >"yubico-internal-https-$USER-puk.txt"

yubico-piv-tool -a set-mgm-key -n "$key"
yubico-piv-tool -k "$key" -a change-pin -P 123456 -N "$pin"
yubico-piv-tool -k "$key" -a change-puk -P 12345678 -N "$puk"
