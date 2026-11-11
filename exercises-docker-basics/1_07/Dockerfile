FROM ubuntu:24.04
RUN sed -i 's#//[a-z]*\.ubuntu\.com#//mirrors.edge.kernel.org#g' $(ls /etc/apt/sources.list /etc/apt/sources.list.d/*.sources 2>/dev/null)
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
WORKDIR /usr/src/app
COPY script.sh .
RUN sed -i 's/\r$//' script.sh
CMD ["./script.sh"]
