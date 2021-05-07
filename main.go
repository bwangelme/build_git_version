package main

import (
	"build_git_version/version"
	"fmt"
)

func main() {
	fmt.Println("Git Version", version.GitSHA)
}
