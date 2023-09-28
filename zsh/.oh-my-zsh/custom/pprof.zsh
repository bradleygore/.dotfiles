# Analyze a heap or cpu profile w/ pprof in http mode
# $1 = file path
# [$2] = port (default=6080)
func pprof.analyzProfile() {
	if [[ -z $1 ]]; then
		echo "$fg_bold[red]Usage: $fg_no_bold[blue]pprof.analyzProfile $fg[cyan]<filePath> $fg[default][port(default=6080)]"
		return 1
	fi

	local PORT=6080;
	if [[ ! -z $2 ]]; then 
		PORT=$2
	fi
	go tool pprof -http=:$PORT $1
}

# Analyze a heap or cpu profile w/ pprof in http mode
# $1 = file path
# [$2] = port (default=6081)
func pprof.analyzeTrace() {
	if [[ -z $1 ]]; then
		echo "$fg_bold[red]Usage: $fg_no_bold[blue]pprof.analyzeTrace $fg[cyan]<filePath> $fg[default][port(default=6081)]"
		return 1
	fi

	local PORT=6081;
	if [[ ! -z $2 ]]; then 
		PORT=$2
	fi
	go tool trace -http=:$PORT $1

}