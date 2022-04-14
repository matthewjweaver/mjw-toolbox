Authorized ssh keys, signed.

To create signature:
`ssh-keygen -Y sign -f ~/.ssh/id_ed25519_sk.pub -n "file" authorized_keys`

To verify signature:
`ssh-keygen -Y verify -I matt@ice-nine.org -f ./allowed_signers -n "file" -s authorized_keys.sig < authorized_keys`

