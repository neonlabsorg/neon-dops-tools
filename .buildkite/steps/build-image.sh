source .buildkite/steps/utils.sh

export REVISION=${BUILDKITE_TAG:-${BUILDKITE_COMMIT}}
docker build . -t neonlabsorg/dops-tools:${REVISION}
handle_error "Failed to build neonlabsorg/dops-tools:${REVISION}"

docker images
