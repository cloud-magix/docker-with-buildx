ARG BUILDX_VERSION=0.7.1
ARG DOCKER_VERSION=latest
ARG TARGETPLATFORM

FROM alpine AS buildx

RUN apk add curl

ARG BUILDX_VERSION
RUN curl -L \
  --output /docker-buildx \
  "https://github.com/docker/buildx/releases/download/v${BUILDX_VERSION}/buildx-v${BUILDX_VERSION}.linux-${TARGETPLATFORM}"

RUN chmod a+x /docker-buildx

ARG DOCKER_VERSION
FROM docker:${DOCKER_VERSION}

COPY --from=buildx /docker-buildx /usr/lib/docker/cli-plugins/docker-buildx
