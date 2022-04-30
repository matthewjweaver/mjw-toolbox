Authorized ssh keys, signed, plus instructions for managing keys and
signatures using a FIDO2 token capable of storing resident credentials.

These instructions produce resident credentials, meaning the public part
of the key, along with the 'handle' used to reference the private key on
the hardware, may be retrieved from the device. This makes them easily
portable between computers, and does not require storing the 'handle'
used to reference the private key as a file anywhere.

It also makes it feasible for someone use the hardware device to
authenticate after stealing it. Be sure to set a strong PIN, since that
is what protects an attacker with physical access to the hardware from
authenticating with the key.

On a new yubikey, disable OTP so accidental touches don't produce
keystrokes, and set a FIDO2 PIN:
```
ykman config usb -d OTP
ykman fido access change-pin
```

The following command generates a key, leaving it on a FIDO2 device.
The resulting on-disk ~/.ssh/id_ed25519_sk{,.pub} files are unnecessary.
They may be rm'd them after adding the .pub to authorized_keys:
```
ssh-keygen -t ed25519-sk -O resident -C "matt@ice-nine.org"
```

To create signature using a FIDO2 key:
```
ssh-keygen -K
< authorized_keys ssh-keygen \
  -Y sign -f ./id_ed25519_sk_rk.pub -n "file" >\
  authorized_keys.sig-$(ssh-keygen -lf id_ed25519_sk_rk.pub|cut -d' ' -f2)
rm id_ed25519_sk_rk{,.pub}
```

To verify signature using a FIDO2 key:
```
ssh-keygen -K
< authorized_keys ssh-keygen \
  -Y verify -I matt@ice-nine.org \
  -f ./allowed_signers -n "file" \
  -s authorized_keys.sig-$(ssh-keygen -lf id_ed25519_sk_rk.pub|cut -d' ' -f2)
rm id_ed25519_sk_rk{,.pub}
```

To add all keys on a hardware token to an ssh-agent on a machine
(requires PIN):
```
ssh-add -K
```
