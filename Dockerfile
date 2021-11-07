FROM arm64v8/debian:bullseye-20210927

ADD bin/zetcd /usr/local/bin/zetcd

EXPOSE 2181

CMD ["/usr/local/bin/zetcd", "-zkaddr", "0.0.0.0:2181"]
