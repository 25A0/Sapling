# Sapling
A lightweight and flexible tool to quickly get you started with new projects.

Whenever you start a new project, there are always those few tedious minutes
where you need to set up a few files and folders that always look the same.
This might be a bare-bones document for LaTeX,
or a `Makefile` and a bit of source code wrapping some `main` method for your
favorite programming language.

With Sapling, all of these setup processes come down to three easy steps:

1. Specify what kind of project you want to start.
2. If necessary, configure details about the project.
3. There is no step 3. You're done. Go get more coffee.

### Examples

Here is how you set up a new Java project with Sapling:
```
	% spawn Java
```
That's it. One command. This will create a source folder,
a simple class that contains a `main` function, a `Makefile`
to compile the code, and a `run.sh` to execute your glorious new software.

## Built-in templates

There is a template for each type of project that Sapling can set up for you.
The content of the template determines what happens when you set up a new instance.
These are the templates that are included in this repo:

- `LaTeX`: Sets up a folder with a mostly empty LaTeX document.
	Adds a `Makefile` that compiles the document using `pdflatex`.
- `Java`: Sets up a minimal Java project.
	Adds a `Makefile` for compilation,
	and a `run.sh` for running the program.
- `template`: Helps you to define new templates.

## Define new templates

You will probably want to define your own templates.
Luckily, there's a template that will help you with that:

First, spawn a new template:
```
	% spawn template
```
You will need to enter a name for the template.
Choose a name that describes the kind of project that
the new template will set up
(e.g. `python`, `website`, `tax-return`, `world-domination`...).

By default, the new template is stored in `~/.sapling/templates`.
In there you should now find a directory for your newly created template.
It contains a directory `files` and a file `config.sh`.

The content of `files` is what Sapling will clone when you use this template.
For example, the `files` directory of the LaTeX template contains
the bare-bones `.tex` file and a `Makefile` to compile the document.

Which files you need for your new template depends of course on the project type and your workflow.
A straightforward approach is to take an existing instance of this project type,
copy it to the `files` folder of your template,
and strip it down to the essential parts.

If you need to customize the template files, you can edit and expand `config.sh`.
Take a look at the `template` template for a simple example.

## Template search paths

How does Sapling know where to find templates, you may wonder.
When you issue a `spawn` command, Sapling will search these locations for
the template that you want to use:

- the current directory
- `~/.sapling/templates`
- the folder `templates` in the directory where Sapling is installed

Sapling will use the first template that matches your request.

## Install

To make the `spawn` command accessible in your terminal,
just clone or download this repository
and add it to your `$PATH`
(see e.g. [this page](http://superuser.com/q/251038) if you don't know how to do that).

## Compatibility

Tested on OS X 10.11 with [zsh](http://zsh.sourceforge.net).
If you run into problems on Linux or with other shells,
feel free to open an issue,
or make a PR if you already know how to fix it.
