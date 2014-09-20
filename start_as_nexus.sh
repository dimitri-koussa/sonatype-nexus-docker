#!/bin/bash -e

chown -R nexus:nexus /opt/sonatype-work
su -m -c '/opt/start.sh "$@"' - nexus
