FROM alpine:3.9.3
COPY cnab/app/run /cnab/app/run
RUN chmod +x /cnab/app/run
COPY --from=bitnami/kubectl:latest /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/kubectl
CMD /cnab/app/run
