FROM ocaml/opam:ubuntu-20.04-ocaml-4.08

# Install dependencies
USER root

RUN apt-get install -y \
    pkg-config \
    libsqlite3-dev \
    libgmp-dev \
    libpcre3-dev \
    libssl-dev \
    zlib1g-dev

# Install OCaml packages
RUN opam install sqlite3 ocsipersist-sqlite eliom js_of_ocaml-lwt

# Copy sources
WORKDIR /home/opam/game
COPY --chown=opam:opam Makefile Makefile
COPY --chown=opam:opam Makefile.options Makefile.options
COPY --chown=opam:opam game.conf.in game.conf.in

COPY --chown=opam:opam creet.eliom creet.eliom
COPY --chown=opam:opam game.eliom game.eliom
COPY --chown=opam:opam playground.eliom playground.eliom
COPY --chown=opam:opam static static

# Build & Run
CMD opam config exec make install && make test.byte