# Documentation Pipelines for Publishing to Github Pages.
This is a cloneable pipeline and toolset for setting up an `mkdocs` or `sphinx`
based documentation site. Both tools are supported and it's simple changes
in the code to switch between the two.

## Why do we need this?
Documentation is a deliverable and should be treated as such. This repo aims
to be an easy place for anyone to be able to come and pickup a `mkdocs` or
`sphinx` pipeline and easily integrate it into their projects. The pipeline 
doesn't need to be run via a CICD pipeline. You can build and publish the docs
with the `Makefile` targets.

## Why not just use a wiki or other internal documentation tool?
It has been my experience that _most_ developers do not care for writing
documentation, however are the first to complain when documentation does not
meet their standards. Using external web based WSIWYG editors with terrible
seach functionality, terrible user interfaces and a slew of other problems
only make developers loathe the documentation process more. However, if we 
keep the documentation as close to the code as possible (literally in the same
repo) and create an automated process around building and publishing it, developers
will be way more likely to work on it. Updating the documentation becomes part
of the development process and can be brought into code reviews.

## Setup and Usage

### Required tools
Every part of this documentation can be built, tested, and deployed from
within the `Dockerfile` included, so the only requirement would be Docker.

### CICD Pipeline
In order to facilitate open source workflows I chose to build this part with 
[Travis CI](https://travis-ci.com/). The `.travis.yml` file in this repository
will build the selected type of documents and upload them to the github pages
associated with the repository. You will have to enable the project on Travis
for it to start building.

### Commands
The top level targets are listed below. The CICD pipeline calls the build
command to create the documentation then uses the `pages` deploy provider to 
upload to GitHub pages. 
 
| Make target    | Usage                                                      |
| -------------- | ---------------------------------------------------------- |
| `make build`   | Build the html files for the documentation.                |
| `make run`     | Run a docker web server on port 8000 to view documenation. |
| `make clean`   | Clean up output directory where html files are put.        |
| `make publish` | Publish documentation to ghpages.                          |

To select a documentation pipeline, simply change what the top level targets
point to.

**Note** `sphinx` publishing with the `Makefile` isn't supported yet. Just
haven't had time to do it. PRs accepted.

Example: 
```
build: build-mkdocs

run: run-mkdocs

publish: publish-mkdocs
```
