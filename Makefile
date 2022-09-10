all: clean build

build:
	cd src ; \
	zip ../alfred-workflow-kdeconnect.alfredworkflow . -r --exclude=*.DS_Store*

clean:
	rm -f *.alfredworkflow
