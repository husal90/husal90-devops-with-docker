FROM docker:27-cli
RUN apk add --no-cache git
COPY builder.sh /builder.sh
RUN chmod +x /builder.sh
ENTRYPOINT ["/builder.sh"]
