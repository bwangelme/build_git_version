Golang 编译时注入额外信息
===

## Go 链接时的 -X 选项

> -X importpath.name=value
> 
> Set the value of the string variable in importpath named name to value.
This is only effective if the variable is declared in the source code either uninitialized
or initialized to a constant string expression. -X will not work if the initializer makes
a function call or refers to other variables.
Note that before Go 1.5 this option took two separate arguments.
 
链接，go 编译工具读取 package main 和它的依赖(是 archive 文件或对象)，将它们组合在一起生成一个可执行文件。

Go 在链接时支持 `-X` 选项，它的用法为 `-X importpath.name=value`，它将会替换字符串变量`importpath.name`的值，将其设置为`value`。

注意: 只有在`importpath.name`未初始化或者初始化为常量字符串的时候才会生效。如果 `importpath.name` 是通过一个函数调用或者变量来执行初始化的话，`-X`选项将不会生效。

注意: `value`中有空格时， -X 后面的值都要用单引号包起来，例如 `-X '${REPO_PATH}/version.BuildTimeStamp=${BuildTimeStamp} UTC'`

## 运行效果

```sh
ø> ./build.sh && ./bin/runme
Git Version c530ca1
Build TimeStamp 2021-05-07_04:01:35AM UTC
Build Go Version go version go1.16 darwin/amd64
```

## 参考链接

+ [Go cmd Link](https://golang.org/cmd/link/)
+ [Golang -ldflags 的一个技巧
  go version 信息注入](https://ms2008.github.io/2018/10/08/golang-build-version/)