# php-sandbox

Script to install PHP in sandboxed mode for development against a particular
version.

usage
=====

* Run Debian or Ubuntu.
* Download or clone from git.
* Run as a user with privileges to install applications:

```bash
sudo ./build-php-sandbox.sh <version>
```

To install version *5.6.22* just type:
```bash
sudo ./build-php-sandbox.sh 5.6.22
```

* Run php in installed version using command:
```bash
php-<version> myscript.php
```

for instance:
```bash
php-5.6.22 myscript.php
```

warning
=======

Application tries to preinstall libs: `libcurl4-openssl-dev` `libtidy-dev` `libmcrypt-dev`
`libgmp-dev` `libxslt-dev` yet you may be prompted to install more of them during
configuration of PHP. I have not included many - like `libssl-dev` on purpose. Be
sure to install them if required.

You may be prompted for confirmations few times - it is not a silent installation.

hints
=====

Depending on your Debian / Ubuntu version some manual symlinking may be required.
If you get `cUrl` or `gmp` headers missing error link these libs' dev folders
to your includes folder - by default on *64-bit* environment:
```bash
sudo ln -s  /usr/include/x86_64-linux-gnu/curl  /usr/include/curl
sudo ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h
```

Default php.ini should be placed under:
```
<sandboxes dir>/php-<version>/config
```

For *5.6.22*
```
<sandboxes dir>/php-5.6.22/config/php.ini
```

contribution
============

In case you like the approach any contribution is more than welcome!