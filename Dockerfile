FROM docker:20.10.12
COPY --from=docker/buildx-bin:0.7.1 /buildx /usr/libexec/docker/cli-plugins/docker-buildx
