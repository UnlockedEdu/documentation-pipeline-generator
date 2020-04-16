build: build-mkdocs

docker-build: docker-build-mkdocs

run: run-mkdocs

publish: publish-mkdocs

clean:
	rm -rf output

build-docker:
	docker build -t {{ cookiecutter.repository_name }} .

{% if cookiecutter.documentation_engine in ["Sphinx", "Both"] %}  
docker-run-sphinx: build
	docker run --rm -it -v `pwd`/${sphinx_build_dir}:/data -p 8000:8000 {{ cookiecutter.repository_name }} python -m http.server 8000 --directory build/html

docker-build-sphinx: clean
	docker run --rm -v `pwd`/${sphinx_build_dir}:/data -it {{ cookiecutter.repository_name }} sphinx-build source build/html

docker-publish-sphinx:
	@echo "Currently not supported. Just haven't had time to do it. PR accepted"

run-sphinx: build
	python -m http.server 8000 --directory build/html

build-sphinx: clean
	sphinx-build source build/html

publish-sphinx:
	@echo "Currently not supported. Just haven't had time to do it. PR accepted"

{% endif %}

{% if cookiecutter.documentation_engine in ["MkDocs", "Both"] %}  
docker-run-mkdocs:
	docker run --rm -it -v `pwd`/${mkdocs_build_dir}:/data -p 8000:8000 {{ cookiecutter.repository_name }} mkdocs serve -a 0.0.0.0:8000

docker-build-mkdocs: clean
	docker run --rm -it -v `pwd`/${mkdocs_build_dir}:/data {{ cookiecutter.repository_name }} mkdocs build 
	mkdir -p output/
	cp -r  ${mkdocs_build_dir}/site/* output/

docker-publish-mkdocs:
	docker run --rm -it -v `pwd`:/data -v "$(HOME)/.ssh":/root/.ssh {{ cookiecutter.repository_name }} mkdocs gh-deploy -f ${mkdocs_build_dir}/mkdocs.yml

run-mkdocs:
	mkdocs serve -f docs/mkdocs.yml -a 0.0.0.0:8000

build-mkdocs: clean
	mkdocs build -f docs/mkdocs.yml
	mkdir -p output/
	cp -r  ${mkdocs_build_dir}/site/* output/

publish-mkdocs:
	mkdocs gh-deploy -f ${mkdocs_build_dir}/mkdocs.yml

{% endif %}
