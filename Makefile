.PHONY: lint
lint:
	shellcheck -x -P SCRIPTDIR bin/*.sh lib/*.sh
