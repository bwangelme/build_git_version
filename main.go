package main

import (
	"fmt"

	"build_git_version/version"
)

func main() {
	fmt.Println("Git Version", version.GitSHA)
	fmt.Println("Build TimeStamp", version.BuildTimeStamp)
	fmt.Println("Build Go Version", version.GoVersion)
}
