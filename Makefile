.PHONY : build run publish

build: build-docker build-mkdocs

run: run-mkdocs

publish: publish-mkdocs

clean:
	rm -rf output

build-docker:
	docker build -t docs-pipeline .

run-mkdocs:
	docker run --rm -it -v `pwd`/docs/mkdocs:/data -p 8000:8000 docs-pipeline mkdocs serve -a 0.0.0.0:8000

build-mkdocs: clean
	docker run --rm -it -v `pwd`/docs:/data docs-pipeline mkdocs build 
	mkdir -p output
	cp -r docs/site/* output/

publish-mkdocs:
	docker run --rm -it -v `pwd`/docs:/data -v "$(HOME)/.ssh":/.ssh mkdocs gh-deploy

run-cookiecutter: build-docker
	docker run --rm -it docs-pipeline cookiecutter https://github.com/UnlockedEdu/documentation-pipeline-generator.git
