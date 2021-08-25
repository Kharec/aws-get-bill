# aws-get-bill - Get your current AWS bill !

## What
This is just a simple Perl script which get your current AWS bill.

## How it works
It simply uses the CostExplorer API to get the amount due from the first day of the month to the current.

## How to use
First, you'll have to install all the requirements, and you'll need `cpanm`.

Once you have it, just do :

`make install-requirements`

To be sure you can run the script, just run the unit tests :

`make test`

Beware your credentials AWS are located to `~/.aws/credentials`.

If all good, then you can install with :

`make install`

It'll move the script to `/usr/local/bin` **using `sudo`**.

## Licence & Copyright
This software is copyright (c) 2021 by Sandro CAZZANIGA.

This is free software, you can use/redistribute it and/or modify it under the GNU GPLv3 terms.