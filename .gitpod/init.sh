printf "\033[3J\033c\033[3J"
printf 'info: %s\n' \
        "Run: bashbox run --release -- hey=man" \
        "Make edits to src/Dockerfile.sh"

(gp ports await 23000 1>/dev/null && gp open src/Dockerfile.sh) &
bashbox run --release -- hey=man