FROM heroku/cedar:14
MAINTAINER Pat Brisbin <pbrisbin@gmail.com>

# Haskell setup from haskell:7.10
ENV LANG C.UTF-8

RUN echo 'deb http://ppa.launchpad.net/hvr/ghc/ubuntu trusty main' > /etc/apt/sources.list.d/ghc.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F6F88286 && \
    apt-get update && \
    apt-get install -y --no-install-recommends cabal-install-1.22 ghc-7.10.2 happy-1.19.5 alex-3.1.4 \
            zlib1g-dev libtinfo-dev libsqlite3-0 libsqlite3-dev ca-certificates && \
    rm -rf /var/lib/apt/lists/*

ENV PATH /root/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.2/bin:/opt/happy/1.19.5/bin:/opt/alex/3.1.4/bin:$PATH
# end: haskell:7.10

RUN mkdir -p /app/user
WORKDIR /app/user

RUN wget -O /app/user/cabal.config https://www.stackage.org/lts-5.0/cabal.config

# Install large dependencies in their own layer to speed up builds.
RUN cabal update && cabal install yesod-core

COPY LICENSE /app/user/LICENSE
COPY alac.cabal /app/user/alac.cabal
RUN cabal install --dependencies-only

COPY src /app/user/src
COPY app /app/user/app
RUN cabal install

RUN cd / && tar czfv /tmp/slug.tgz ./app

ENV PORT 3000
ENTRYPOINT ["/app/user/dist/build/alac/alac"]
