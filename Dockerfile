FROM debian:10

ADD ./ /docker

WORKDIR /docker

RUN ./setup_machine.sh

CMD ["./build.sh"]
