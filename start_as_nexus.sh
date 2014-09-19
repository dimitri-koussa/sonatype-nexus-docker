#!/bin/bash -e

chown nexus:nexus /opt/sonatype-work
if [ -z "$(ls -A /opt/sonatype-work)" ]; then
  cp -R --preserve=all /opt/sonatype-work-template /opt/sonatype-work
fi
su -m -c '/opt/start.sh "$@"' - nexus
