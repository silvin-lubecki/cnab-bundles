FROM golang:1.13 AS build
ARG GOOS
RUN go get github.com/docker/cnab-to-oci
WORKDIR /go/src/github.com/docker/cnab-to-oci
RUN make bin/cnab-to-oci

FROM scratch
COPY --from=build /go/src/github.com/docker/cnab-to-oci/bin/cnab-to-oci /cnab-to-oci
ENTRYPOINT [ "/cnab-to-oci" ]