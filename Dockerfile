# uribrowser-docker OCI image
#
# Build from tellmesh workspace root:
#   docker build -f uribrowser-docker/Dockerfile /home/tom/github/tellmesh
#
FROM python:3.12-slim
WORKDIR /build
COPY uriresolver /build/uriresolver
COPY uriguard /build/uriguard
COPY uricontrol /build/uricontrol
COPY uribrowser /build/uribrowser
COPY uribrowser-docker /build/uribrowser-docker
RUN pip install --no-cache-dir \
    -e /build/uriresolver \
    -e /build/uriguard \
    -e /build/uricontrol \
    -e /build/uribrowser \
    -e /build/uribrowser-docker
WORKDIR /build/uribrowser-docker
EXPOSE 8792
CMD ["urisys-browser", "serve", "--host", "0.0.0.0", "--port", "8792"]
