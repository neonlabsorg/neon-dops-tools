source .buildkite/steps/utils.sh

export REVISION=${BUILDKITE_TAG:-${BUILDKITE_COMMIT}}

docker login -u=${DHUBU} -p=${DHUBP}
handle_error "Failed to docker login, user: ${DHUBU}"

docker push neonlabsorg/dops-tools:${REVISION}
handle_error "Failed to push neonlabsorg/dops-tools:${REVISION}"

