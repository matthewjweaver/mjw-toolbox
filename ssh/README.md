Authorized ssh keys, signed.

To generate sk key:
`ssh-keygen -t ed25519-sk -O resident -C "matt@ice-nine.org"`

To create signature:
`ssh-keygen -Y sign -f ~/.ssh/id_ed25519_sk.pub -n "file" authorized_keys`

To verify signature:
`ssh-keygen -Y verify -I matt@ice-nine.org -f ./allowed_signers -n "file" -s authorized_keys.sig < authorized_keys`

