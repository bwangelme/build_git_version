REPO_PATH="github.com/bwangelme/build_git_version"
GIT_SHA=$(git rev-parse --short HEAD || echo "GitNotFound")

# Set GO_LDFLAGS="-s" for building without symbols for debugging.
GO_LDFLAGS="$GO_LDFLAGS -X ${REPO_PATH}/version.GitSHA=${GIT_SHA}"
