sonatype-nexus-docker
=====================

Docker version of Sonatype Nexus.

The versions of this docker container match that of Nexus itself.

Usage
------
```
docker run -p 8081:8081 --name nexus dkoussa/sonatype-nexus
```
And then point your browser at http://localhost:8081/nexus/

Or with an explicitly specified volume target:
```
mkdir -p /srv/nexus
docker run -v /srv/nexus:/opt/sonatype-work -p 8081:8081 --name nexus dkoussa/sonatype-nexus
```

Options / Environment variables
--------
The image supports an option NEXUS_WEBAPP_CONTEXT_PATH which you can set as an
environment variable when running the image that sets the URL prefix the
webapp uses when starting the server. Defaults to /nexus.

An example usage with the option:
```
docker run -e NEXUS_WEBAPP_CONTEXT_PATH=/ dkoussa/sonatype-nexus
```
Which changes the URL to http://localhost:8081/

Authors
-------
Based on: https://github.com/griff/sonatype-nexus-docker
