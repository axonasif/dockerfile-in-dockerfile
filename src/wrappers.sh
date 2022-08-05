function FROM() {
	# Placeholder function
	true;
}

function ENV() {
	local args=("$@");
	if [[ ! "${args[*]}" =~ '=' ]] && test "${args[1]}" == " "; then {
		args="${args[0]}=${args[2]}";
	} else {
		args="${args[*]}";
	} fi

	log::info "Setting global variable ${GREEN}$args${RC}";
	export "$args";
}

function ARG() {
	local input="$1";
	local passed_arg;
	local found;
	for passed_arg in "${arguments[@]}"; do {
		if [[ "${input}=" =~ ${passed_arg%%=*}= ]]; then {
			eval "$passed_arg";
			log::info "Setting local variable ${BLUE}$passed_arg${RC}";
			found=true;
		} fi
	} done

	if test ! -v found; then {
		log::warn "No ARG such as $input= was passed";
	} fi
}

function RUN() {
	log::info "Executing ${RED}$*${RC} and it's following && commands (if any)";
	"$@"
}

function COPY() {
	true '!TODO';
}