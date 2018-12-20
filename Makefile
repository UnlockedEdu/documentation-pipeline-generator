build: build-mkdocs

run: run-mkdocs

publish: publish-mkdocs

clean:
	rm -rf output

build-docker:
	docker build -t docs-pipeline .

run-mkdocs:
	docker run --rm -it -v `pwd`/docs/mkdocs:/data -p 8000:8000 docs-pipeline mkdocs serve -a 0.0.0.0:8000

run-sphinx: build
	docker run --rm -it -v `pwd`/output/html:/data -p 8000:8000 docs-pipeline python -m http.server 8000

build-sphinx: clean
	docker run --rm -v `pwd`:/data -it docs-pipeline sphinx-build /data/docs/sphinx/source docs/sphinx/build/html
	mkdir -p output
	cp -r docs/sphinx/build/html/* output/
 
build-mkdocs: clean
	docker run --rm -it -v `pwd`/docs/mkdocs:/data docs-pipeline mkdocs build 
	mkdir -p output/
	cp -r docs/mkdocs/site/* output/

publish-mkdocs:
	docker run --rm -it -v `pwd`/docs/mkdocs:/data -v "$(HOME)/.ssh":/.ssh mkdocs gh-deploy

publish-sphinx:
	@echo "Currently not supported. Just haven't had time to do it. PR accepted"
