FROM dkoussa/oracle-jdk7:1.0
MAINTAINER Dimitri Koussa "dimitri.koussa@gmail.com"

RUN mkdir -p /opt/sonatype-nexus /opt/sonatype-work
RUN wget -O /tmp/nexus-latest-bundle.tar.gz http://www.sonatype.org/downloads/nexus-2.7.2-03-bundle.tar.gz
RUN tar xzvf /tmp/nexus-latest-bundle.tar.gz -C /opt/sonatype-nexus --strip-components=1
RUN useradd --user-group --system --home-dir /opt/sonatype-nexus nexus
RUN chown -R nexus:nexus /opt/sonatype-work /opt/sonatype-nexus
ENV NEXUS_WEBAPP_CONTEXT_PATH /nexus
ADD start_as_nexus.sh /opt/start_as_nexus.sh
ADD start_nexus.sh /opt/start_nexus.sh
RUN ln -s /opt/start_nexus.sh /opt/start.sh
RUN rm -f /tmp/nexus-latest-bundle.tar.gz

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install --yes unzip
RUN apt-get clean --yes
ENV DEBIAN_FRONTEND newt

RUN mkdir -p /opt/sonatype-work/nexus/plugin-repository
RUN wget --no-verbose -O /tmp/nexus-artifact-usage-plugin.zip https://github.com/dimitri-koussa/nexus-artifact-usage-plugin/releases/download/v0.12.0-alpha-01/artifact-usage-plugin-0.11.1-SNAPSHOT-bundle.zip
RUN unzip /tmp/nexus-artifact-usage-plugin.zip -d /opt/sonatype-work/nexus/plugin-repository
RUN rm --force /tmp/nexus-artifact-usage-plugin.zip

CMD ["/opt/start_as_nexus.sh"]
VOLUME /opt/sonatype-work
EXPOSE 8081
