Introduction
============

This is a HOWTO for configuring a YubiKey NEO as an OpenPGP smartcard and
use as an OpenSSH authentication token. The instructions are written for OS
X, but should be nearly identical for Linux and *BSDs. The only dependencies
are the YubiKey command-line utilities and GnuPG with native CCID support.
If installing GnuPG from source, you'll also need libusb.

I've assembled these instructions from myriad different sources, including
my own trial+error experiences. I abstain from citing them here because no
particular source was uniquely useful. Rather, for any particular operation
it was rather simple to find examples online. But nowhere could I find a
document that fit all the pieces together.

The original HOWTO is located at <http://25thandClement.com/~william/YubiKey_NEO.md>

Preparation
===========

1. Purchase YubiKey NEO
2. Install X Code and Command Line Tools, if installing anything from source.
	* X Code can be installed from the App Store.
	* Command Line Tools are installed from X Code: X Code -> Preferences
	  -> Downloads -> Components -> Command Line Tools.
3. Install YubiKey reader library libyubikey (aka yubico-c)
	* From source code
		1. $ sudo mkdir /usr/local/yubi
		2. $ sudo chown $(id -nru):$(id -nrg) /usr/local/yubi
		3. $ mkdir /usr/local/yubi/src
		4. $ cd /usr/local/yubi/src
		5. $ ftp http://yubico-c.googlecode.com/files/libyubikey-1.10.tar.gz
		6. $ tar -xzf libyubikey-1.10.tar.gz
		7. $ cd libyubikey-1.10
		8. $ ./configure --prefix=/usr/local/yubi
		9. $ make && make install
4. Install YubiKey personalization utilities, ykinfo(1) and ykpersonalize(1)
	* From source code
		1. $ cd /usr/local/yubi/src
		2. $ ftp http://opensource.yubico.com/yubikey-personalization/releases/ykpers-1.14.0.tar.gz
		3. $ tar -xzf ykpers-1.14.0.tar.gz
		4. $ cd ykpers-1.14.0
		5. $ ./configure --prefix=/usr/local/yubi
		6. $ make && make install
5. Install GnuPG with native CCID support.
	* GPG Tools: https://gpgtools.org/
		* To access the command-line utilities after installation
			* Open a new Terminal window; or
			* $ eval $(path\_helper)
	* From source code
		* I got close but gave up after finding GPG Tools. Some tips:
			* You need both libusbx and libusb-compat to get native
			  CCID support.
			* If installing GPG2: yes, you need to install _all_
			  of those crazy libraries---libgpg-error, libgcrypt,
			  libassuan, and libkbsa.
			* GPG2 expects the old libusb-compat API, not
			  the updated API. libusb-compat requires libusb-1.0
			  (aka libusbx), so you must install both.
			* When compiling libusb-compat, you need to
			  explicitly link against libusb-1.0 by passing
			  LDFLAGS="-lusb-1.0" to configure, otherwise you'll
			  get an error about not finding \_libusb\_init when
			  running gpg.

YubiKey Setup
=============

The YubiKey NEO has three different device modes.

1. OTP HID-only device, mode 0x80. The key behaves like a regular YubiKey
or YubiKey Nano when inserted. This is the factory setting.
2. OpenPGP CCID-only device, mode 0x81. The key only operates as an OpenPGP
CCID smartcard token when inserted. The button acts to enable/disable the
reader.
3. OTP HID+OpenPGP CCID, mode 0x82. The key is visible both as an HOTP HID
device and OpenPGP CCID smartcard. The button functions as on a regular
YubiKey.

Most people change the mode to 0x82, judging by various HOWTOs, FAQs, and Q&amp;As.

1. $ ykpersonalize -m82
	* May need to give full path: /usr/local/yubi/bin/ykpersonalize -m82
2. Remove and reinsert card to reboot.


Change the PIN
==============

The PIN numbers can be changed after key generation, if desired.

1. $ gpg --change-pin
	* The factory default PINs are 123456 (user) and 12345678 (admin).


Key Generation
==============

Key generation is quite simple. So don't worry about going through the
process multiple times at first, in case you want to change something.

1. $ gpg --card-edit
	1. gpg/card> admin
	2. gpg/card> generate
		* The factory default PINs are 123456 (user) and 12345678 (admin)
		* Other than the PIN and expiration times, you'll be asked
		  for three additional pieces of information which are
		  ultimately appended together like "Joe Smith (Comment)
		  &lt;jsmith@gmail.com&gt;".
			1. Real Name
			2. E-mail Address
			3. Comment
	3. gpg/card> quit


Multimachine Usage
==================

For some inexplicable reason, GnuPG cannot extract the public key from a
smartcard except during generation. That means that to use the key from
another computer, you either have to copy the public key from the original
computer's GnuPG keyring, or you need to set the URL attribute to a file
which contains the PGP public key block. Otherwise, the token is effectively
locked to a single computer, and unuseable if you happen to trash your
keyring unless you regenerate a key.

Export Public Key
-----------------
1. $ gpg --card-status
	* Make note of the 4-byte (8 hex character) Signature key identifier.
	  The identifier is the last 4 bytes (8 hex characters) of the
	  Signature key fingerprint.
2. $ gpg --armor --export XXXXXXXX
	* XXXXXXXX is the Signature key identifier from Step 1.
	* Copy the output as a regular text file to a publicly accessible
	  web server. You can re-run this command as many times as
	  necessary.
3. $ gpg --card-edit
	1. gpg/card> admin
	2. gpg/card> url
	3. Enter the URL from Step 2.
	4. Optionally, set the name, language, and other attributes.
	4. gpg/card> quit

Import Public Key
-----------------

Presuming you've set the URL attribute on the card, and the URL is visible
from your new machine, then

1. $ gpg --card-status
	* As long as the URL attribute is configured properly, then
	  GnuPG will fetch and import the public key automatically, and the
	  token will be available for use.

If for some reason this fails (e.g. you didn't have network access when
GnuPG attempted to fetch the key), you may need to fetch explicitly.

1. $ gpg --card-edit
	1. gpg/card> fetch


OpenSSH Setup
=============

GnuPG's gpg-agent has native support for the OpenSSH ssh-agent protocol, but
it needs to be explicitly enabled.

1. $ echo "enable-ssh-support" >> ~/.gnupg/gpg-agent.conf
2. Start and restart gpg-agent.
	* GPG Tools will have added gpg-agent to your launchd configuration, so
	  it should already be running. Kill it and launchd will restart it.
		* $ pkill gpg-agent
3. $ gpg --card-status
	* Make note of the 4-byte (8 hex character) Authentication identifier.
	  The identifier is the last 4 bytes (8 hex characters) of the
	  Authentication key fingerprint.
4. $ gpgkey2ssh XXXXXXXX
	* XXXXXXXX is the Authentication key identifier from Step 3.
	* Append the output to .ssh/authorized\_keys on your remote
	  machines. You can re-run this command as many times as necessary.
5. $ export SSH\_AUTH\_SOCK=~/.gnupg/S.gpg-agent.ssh
	* You don't necessarily need to stop OpenSSH's ssh-agent. What
	  matters is that SSH\_AUTH\_SOCK points to GnuPG's ssh-agent socket
	  at the time you invoke ssh.
	* You may or may not want to fiddle with setting SSH\_AUTH\_SOCK
	  in ~/.profile or similar shell initialization file.
	* It's possible that _your_ GnuPG installation places the ssh-agent
	  socket elsewhere. To get the path:
		1. $ gpg-connect-agent "getinfo ssh\_socket\_name" /bye
6. $ ssh your@machine
	* You probably want to verify somehow that you're authenticating
	  with your smartcard and not a key under ~/.ssh.


Signed Revocation Failsafe
==========================

FIXME.


Debugging
=========

"Card not present"
------------------

Try the command again. GnuPG's quality of implementation leaves much to be
desired when it comes to device detection and changes in status.


"Conditions of use not satisfied"
---------------------------------

Try unblocking the PIN.

1. $ gpg --change-pin
	* Select menu option "2 - unblock PIN".

Somehow I got one of my cards into this state, and it manifested as an
inability to authenticate SSH sessions or sign other keys. I didn't see this
particular error message until I tried to sign another key (as opposed to
authenticate OpenSSH sessions), and again when I tried to change the PIN in
an attempt to debug the situation.


About Author
============

William Ahern &lt;<william@25thandClement.com>&gt;

Homepage: <http://25thandClement.com/~william/>

Last Updated: 2014-01-13T23:43:40
