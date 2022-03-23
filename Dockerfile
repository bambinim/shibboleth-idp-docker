FROM jetty:9.4-jdk11
USER root
WORKDIR /var/lib

ARG IDP_VERSION=4.1.5

RUN wget https://shibboleth.net/downloads/identity-provider/${IDP_VERSION}/shibboleth-identity-provider-${IDP_VERSION}.zip && \
    unzip shibboleth-identity-provider-${IDP_VERSION}.zip && \
    mv shibboleth-identity-provider-${IDP_VERSION} shibboleth && \
    rm shibboleth-identity-provider-${IDP_VERSION}.zip && \
    chown -R jetty:jetty ./

USER jetty
WORKDIR /var/lib/jetty