source .buildkite/steps/utils.sh

export REVISION=${BUILDKITE_TAG:-${BUILDKITE_COMMIT}}
docker build . -t neonlabsorg/dops-tools:${REVISION}
handle_error "Failed to build neonlabsorg/dops-tools:${REVISION}"

docker images

docker login -u=${DHUBU} -p=${DHUBP}
handle_error "Failed to docker login, user: ${DHUBU}"

docker push neonlabsorg/dops-tools:${REVISION}
handle_error "Failed to push neonlabsorg/dops-tools:${REVISION}"
