FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y curl unzip bash dos2unix \
    && rm -rf /var/lib/apt/lists/*

ENV ALLOY_VERSION="v1.0.0"
ENV ALLOY_ZIP="alloy-linux-amd64.zip"
ENV ALLOY_URL="https://github.com/grafana/alloy/releases/download/${ALLOY_VERSION}/${ALLOY_ZIP}"

RUN curl -L -o /tmp/${ALLOY_ZIP} ${ALLOY_URL} \
 && unzip /tmp/${ALLOY_ZIP} -d /tmp/ \
 && mv /tmp/alloy-linux-amd64 /usr/bin/alloy \
 && chmod +x /usr/bin/alloy \
 && rm -rf /tmp/${ALLOY_ZIP}

COPY agent-config.river /etc/alloy-config.river
COPY start.sh /start.sh

RUN dos2unix /start.sh && chmod +x /start.sh

CMD ["bash", "/start.sh"]
