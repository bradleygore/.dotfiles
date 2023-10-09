# usage: docker.shImage image-name-here
function docker.shImage() {
  docker run --entrypoint "/bin/sh" -it $1
}
