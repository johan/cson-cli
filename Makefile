.PHONY: all clean setup test

all: clean setup test

test:
	npm test

clean:
	rm -rf node_modules

setup:
	npm install

release-%: clean setup
	./node_modules/.bin/npub publish $(subst release-,,$@)
