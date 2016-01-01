% YubiKey Neo (and Neo-n) / OS X 10.11

This directory contains a collection of things useful for YubiKey setup on OS X.

The configured features, when finished, include:

* [u2f](https://www.google.com/search?q=u2f&oq=u2f&aqs=chrome..69i57j69i60j69i61.401j0j7&sourceid=chrome&es_sm=91&ie=UTF-8)
* PIV/PKCS11 for ssh authentication
* OpenPGP interface for GPG key storage

Prerequisites:

* yubikey-neo-manager [yubico](https://developers.yubico.com/yubikey-neo-manager/)
* yubico-piv-tool (homebrew)
* opensc (homebrew)
* GPG Suite [gpgtools](https://gpgtools.org/)

Notes:

* If you manage to trigger the GPG PIN retry block, you will need to use 
  `gpg --change-pin` and choose the `unblock PIN` option along with 
  the PUK/Admin code you set up when configuring the card.
    * If you try to use the `unblock` option of the `gpg --card-edit` tool
      you will likely meet with failure.
* If you manage to trigger the PKCS11 PIN retry block, you may start to get very obscure error messages from SSH:

        Enter PIN for 'PIV_II (PIV Card Holder pin)':
        C_Login failed: 164
        Permission denied (publickey,password).

    To unblock/reset the PIN, you can use the `pkcs15-tool -u`
