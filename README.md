# mooapis [![CI](https://github.com/CowNetwork/mooapis/actions/workflows/generator.yml/badge.svg)](https://github.com/CowNetwork/mooapis/actions/workflows/generator.yml)

This is a central place where we store all of our protocol definitions (i.e. Protobuf files) regarding our services and apis.
We automatically generate the language specific code and push them to different repositories (e.g. [mooapis-go](https://github.com/CowNetwork/mooapis-go)) via CI.

# How does it work?

After we put our service definitions in the specific folders (note: every path need to end in a version tag like `v1`), a CI script will start to lint the files and generate code from it.

And we use [Protobuf](https://developers.google.com/protocol-buffers) simply because it works. We can define services completely language unspecific and let it handle the rest for Java, Go etc. Additionally, it's really fast.  
For generating the code we use [Buf.build](https://buf.build/), as it provides a nice way of generating code from Protobuf files, without the hassle of managing the *protoc* executions yourself.
