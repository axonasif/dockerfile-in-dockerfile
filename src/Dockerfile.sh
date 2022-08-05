ARG base
FROM ${base}

ARG hey

ENV hello="World!"

RUN echo "$hello" \
	&& echo "$hey"

# Interactive shell
RUN bash -l
