import os
import shutil
from mako.lookup import TemplateLookup
from collections import OrderedDict

mylookup = TemplateLookup(directories=".", strict_undefined=True)

provider_lookup = {
    "GitHub Pages": "pages"
}


def serve_template(templatename, **kwargs):
    mytemplate2 = mylookup.get_template(templatename)
    return mytemplate2.render(**kwargs)


# Render each template explicitly
def save_template(workfolder=None, file_name=None, context=None):
    newtemplate = serve_template(file_name, **context)
    f = open(os.path.join(workfolder, file_name), 'w')
    f.write(newtemplate)
    f.close()


def main():
    context = {{cookiecutter}}  # noqa

    if "{{ cookiecutter.documentation_hosting_provider }}" != "None":
        context['documentation_hosting_provider_rendered'] = provider_lookup["{{cookiecutter.documentation_hosting_provider}}"]
        file_name = '.travis.yml'
        # Re-Render the template
        save_template(".", file_name, context)

    if "{{ cookiecutter.documentation_engine }}" is "Both":
        context['mkdocs_build_dir'] = 'docs/mkdocs'
        context['sphinx_build_dir'] = 'docs/sphinx'
        shutil.copytree("docs_templates", "docs")
    else:
        engine = "{{ cookiecutter.documentation_engine }}".lower()
        if engine == "mkdocs":
            context["mkdocs_build_dir"] = "docs"
        elif engine == "sphinx":
            context["sphinx_build_dir"] = "source"
        shutil.copytree("docs_templates/{0}".format(engine), "docs")

    shutil.rmtree("docs_templates")
    file_name = "Makefile"
    save_template(".", file_name, context)

    # None comes in as a string from cookiecutter. Bleh
    if "{{ cookiecutter.license }}" != "None":
        shutil.copyfile("licenses/{{cookiecutter.license}}", "{{cookiecutter.license}}")
    shutil.rmtree('licenses')


if __name__ == '__main__':
    main()
    print("Done!")
