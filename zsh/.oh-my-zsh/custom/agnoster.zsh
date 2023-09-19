# agnoster theme customizations
prompt_working_line() {
	echo -n '\n'
	# 21D2 = ⇒
	# 27F4 = ⟴
	# 
	prompt_segment 'green' 'black' '\U27F4'
	prompt_end
}
