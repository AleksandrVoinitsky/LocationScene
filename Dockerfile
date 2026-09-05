FROM ubuntu:22.04

WORKDIR /app

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        libasound2 \
        libglib2.0-0 \
        libgomp1 \
        libnss3 \
    && rm -rf /var/lib/apt/lists/*

COPY Build/LinuxServer/ /app/

RUN chmod +x /app/Build.x86_64

EXPOSE 7770/udp

ENTRYPOINT ["/app/Build.x86_64"]
CMD ["-batchmode", "-nographics", "-logFile", "-"]
