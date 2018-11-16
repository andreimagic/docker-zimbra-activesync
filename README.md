[![Docker hub](https://img.shields.io/badge/docker%20pull-andreimagic%2Fzimbra--activezync-green.svg)](https://hub.docker.com/r/andreimagic/zimbra-activesync/)

[![Github](https://img.shields.io/badge/github-andreimagic%2Fdocker--zimbra--activezync-orange.svg)](https://github.com/andreimagic/docker-zimbra-activesync)
[![LinkedIn](https://img.shields.io/badge/linkedin-andrei%20dragulescu-blue.svg)](https://linkedin.com/in/andrei-dragulescu-a51220107)

# Z-Push with ActiveSync and Autodiscover for Zimbra Mail Server compatible with Outlook 2016

## Get started

Docker pull:

```bash
docker pull andreimagic/zimbra-activesync
```

Run:

```bash
docker run -d \
	-p 80:80 \
	-p 443:443 \
	-e ZIMBRA_HOST=emaildomain.com \
	-e ZIMBRA_SSL=false \
	-e ZPUSH_URL=zpushdomain.com \
	--name zimbra-activesync
	andreimagic/zimbra-activesync
```
**NOTE:** Set the ZIMBRA_SSL flag based on your Zimbra service (true for https, false for http)

## From Github

Clone from the Github project, build it and launch it

```bash
git pull https://github.com/andreimagic/docker-zimbra-activesync.git
cd docker-zimbra-activesync
docker build -t zimbra-activesync .
docker run [...] zimbra-activesync
```
## Test in WEB

Testing this URL https://ipaddress-domain/Microsoft-Server-ActiveSync should prompt for login, use an active Zimbra email account.  

Should return:

	Z-Push - Open Source ActiveSync
	Version 2.3.7
	GET not supported
	This is the Z-Push location and can only be accessed by Microsoft ActiveSync-capable devices


	More information about Z-Push can be found at:
	Z-Push homepage
	Z-Push download page
	Z-Push Bugtracker
	Z-Push Wiki and Roadmap

	All modifications to this sourcecode must be published and returned to the community.
	Please see AGPLv3 License for details.

# Zimbra Whitelist

You might have to add the z-push activesync domain to Zimbra Whitelist  

	zmprov mcf zimbraHttpThrottleSafeIPs 192.168.1.111/32
	zmprov gcf zimbraHttpThrottleSafeIPs
	zmmailboxdctl restart

[Download - Zimbra](http://download.z-push.org/final/2.3/z-push-2.3.7.tar.gz)  
[Download - Zimbra Backend](http://downloads.sourceforge.net/project/zimbrabackend/Release66/zimbra66.tgz)  
[Wiki - Zimbra DoSFilter](https://wiki.zimbra.com/wiki/DoSFilter)  