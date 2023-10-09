# Ginkgo-specific shortcuts/aliases

func ginkgo.vf () {
  ginkgo -v --fail-fast $(passthrough_args ${@})
}

func ginkgo.vff () {
  ginkgo -v --fail-fast --focus="${@:1}" $(passthrough_args ${@})
}

