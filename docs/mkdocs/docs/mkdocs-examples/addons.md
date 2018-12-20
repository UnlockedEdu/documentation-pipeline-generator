# Markdown Addons and Extensions

## UML Diagrams
Most developers opt to use some form of graphical editor to create their
diagrams. This is usually a good option if they work for a large company
with a subscription, but this is usually a less optimal solution for open
source. The chart can be saved as an image but is most likely under a 
developers login and if they leave the project, or if another developer wishes
to modify it the there are many barriers to getting access. By diagraming
simple workflows in Markdown we ensure that everyone is always able to edit
the charts.

### Flow Chart
[flowchart.js](http://flowchart.js.org/) documentation and live editor

~~~
```flow
st=>start: Start
op=>operation: Your Operation
cond=>condition: Yes or No?
e=>end

st->op->cond
cond(yes)->e
cond(no)->op
```
~~~

```flow
st=>start: Start
op=>operation: Your Operation
cond=>condition: Yes or No?
e=>end

st->op->cond
cond(yes)->e
cond(no)->op
```

### Sequence Diagram
[js-sequence-diagrams](https://bramp.github.io/js-sequence-diagrams/) documentation and live editor

~~~
```sequence
Title: Here is a title
A->B: Normal line
B-->C: Dashed line
C->>D: Open arrow
D-->>A: Dashed open arrow
```
~~~

```sequence
Title: Here is a title
A->B: Normal line
B-->C: Dashed line
C->>D: Open arrow
D-->>A: Dashed open arrow
```

## Progress Bar
~~~
```
[=0% "0%"]
[=5% "5%"]
[=25% "25%"]
[=45% "45%"]
[=65% "65%"]
[=85% "85%"]
[=100% "100%"]
```
~~~

[=0% "0%"]
[=5% "5%"]
[=25% "25%"]
[=45% "45%"]
[=65% "65%"]
[=85% "85%"]
[=100% "100%"]

## Task List
~~~
```
To Do

- [X] Pycon Proposal
    * [X] Come up with topic
    * [ ] Write proposal
        STUFF!
        + [x] stuffs
        + [ ] stuffz
        + [x] stuffd
    * [X] Laundry
- [ ] Make dinner
- [ ] Laundry
```
~~~

To Do

- [X] Pycon Proposal
    * [X] Come up with topic
    * [ ] Write proposal
        STUFF!
        + [x] stuffs
        + [ ] stuffz
        + [x] stuffd
    * [X] Laundry
- [ ] Make dinner
- [ ] Laundry

## Details Panes
~~~
```
??? optional-class "Summary"
    Here's some content.

???+ note "Open styled details"

    ??? danger "Nested details!"
        And more content again.
```
~~~

??? optional-class "Summary"
    Here's some content.

???+ note "Open styled details"

    ??? danger "Nested details!"
        And more content again.

## Emoji
Emojis from https://emojicopy.com

:thumbsup: :snake: :shrug:

## Code Highlighting
To have the code highlight for a certain language, simply put the language
after the three \` that start your codeblock. ex: \`\`\`python

```python
""" Flask Hello World """
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'
```

## Keys
This looks different depending on the mkdocs theme. Doesn't look great in 
the Read the Docs theme. 

~~~
```
++ctrl+alt+delete++

++ctrl+alt+"Custom Key"++

++cmd+alt+"&Uuml;"++
```
~~~

++ctrl+alt+delete++

++ctrl+alt+"Custom Key"++

++cmd+alt+"&Uuml;"++

## MagicLink
Just paste links directly in the document like this: https://google.com.

Or even an email address: fake.email@email.com.

### Users
You can reference different users from github or other social media platforms.
~~~
```
@zelgius

@twitter:masonegger
```
~~~

@zelgius

@twitter:masonegger

### Issues
Reference issues via https://facelessuser.github.io/pymdown-extensions/extensions/magiclink/#options

Issue #1

Issue backrefs#1

Issue Python-Markdown/markdown#1

Issue gitlab:pycqa/flake8#385

Pull request !13

Pull request backrefs!4

Pull request Python-Markdown/markdown!598

Pull request gitlab:pycqa/flake8!213

### Comparisons
You can have links to git comparisons. Simply put the first commit hash, then ...
then the second commit hash.

~~~
```
e2ed7e0b3973f3f9eb7a26b8ef7ae514eebfe0d2...90b6fb8711e75732f987982cc024e9bb0111beac

Python-Markdown/markdown@007bd2aa4c184b28f710d041a0abe78bffc0ec2e...de5c696f94e8dde242c29d4be50b7bbf3c17fedb

gitlab:pycqa/flake8@1ecf97005a024391fb07ad8941f4d25c4e0aae6e...9bea7576ac33a8e4f72f87ffa81dfa10256fca6e
```
~~~

e2ed7e0b3973f3f9eb7a26b8ef7ae514eebfe0d2...90b6fb8711e75732f987982cc024e9bb0111beac

Python-Markdown/markdown@007bd2aa4c184b28f710d041a0abe78bffc0ec2e...de5c696f94e8dde242c29d4be50b7bbf3c17fedb

gitlab:pycqa/flake8@1ecf97005a024391fb07ad8941f4d25c4e0aae6e...9bea7576ac33a8e4f72f87ffa81dfa10256fca6e


### SmartSymbols
~~~
```
(tm)

(c)

(r)

c/o

+/-

-->

<--

=/=

1/4, etc.

1st 2nd etc.
```
~~~

(tm)

(c)

(r)

c/o

+/-

-->

<--

=/=

1/4, etc.

1st 2nd etc.
