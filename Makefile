.PHONY:lint
lint:
	shellcheck -x -P SCRIPTDIR bin/hello.sh lib/log.sh
