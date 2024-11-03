FROM bats/bats:1.11.0
LABEL maintainer="Nho Luong <luongutnho@hotmail.com>"
RUN apk --no-cache add ca-certificates parallel libxml2-utils
COPY dist/kubeconform_linux_amd64_v1/kubeconform /code/bin/
COPY acceptance.bats acceptance-nonetwork.bats /code/
COPY fixtures /code/fixtures
