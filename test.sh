#! /bin/sh
if [[ -d ".test" ]]; then
	rm -rf ".test"
fi
spawn test
