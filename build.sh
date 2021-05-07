#!/usr/bin/env bash

REPO_PATH="build_git_version"

# Build Version
GIT_SHA=$(git rev-parse --short HEAD || echo "GitNotFound")
BuildTimeStamp=$(date -u +%Y-%m-%d_%I:%M:%S%p)
GoVersion=$(go version)

# Set GO_LDFLAGS="-s" for building without symbols for debugging.
# 注意 BuildTimeStamp 和 GoVersion 中有空格，所以 -X 后面的值都要用单引号包起来
GO_LDFLAGS="$GO_LDFLAGS -X ${REPO_PATH}/version.GitSHA=${GIT_SHA} -X '${REPO_PATH}/version.BuildTimeStamp=${BuildTimeStamp} UTC' -X '${REPO_PATH}/version.GoVersion=${GoVersion}'"

build() {
  out="bin"
  if [[ -n "${BINDIR}" ]]; then out="${BINDIR}"; fi

  CGO_ENABLED=0 go build $GO_BUILD_FLAGS \
    -ldflags "$GO_LDFLAGS" \
    -o "${out}/runme" . || return
}

build
