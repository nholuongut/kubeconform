FROM alpine:3.20.2 as certs
LABEL maintainer="Nho Luong <luongutnho@hotmail.com>"
RUN apk add ca-certificates

FROM scratch AS kubeconform
LABEL org.opencontainers.image.authors="Nho Luong <luongutnho@hotmail.com>" \
      org.opencontainers.image.source="https://github.com/nholuongut/kubeconform/" \
      org.opencontainers.image.description="A Kubernetes manifests validation tool" \
      org.opencontainers.image.documentation="https://github.com/nholuongut/kubeconform/" \
      org.opencontainers.image.licenses="Apache License 2.0" \
      org.opencontainers.image.title="kubeconform" \
      org.opencontainers.image.url="https://github.com/nholuongut/kubeconform/"
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY kubeconform /
ENTRYPOINT ["/kubeconform"]
