REBAR := rebar3

all: validate release

compile:
	${REBAR} compile

validate: compile
	${REBAR} xref
	${REBAR} eunit
	${REBAR} ct

clean:
	${REBAR} clean

release: compile
	${REBAR} release

console: release
	./_build/default/rel/robot_utopia/bin/robot_utopia console

.PHONY: compile validate release all clean console
