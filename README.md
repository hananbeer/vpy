# vpy
virtualize python packages; vpy to pip is similar to what yarn is to npm

## I hate virtualenv

instead of installing packages via venv I came up with an elegant solution

simply `run.sh` (or `run.bat` on Windows) to see demo.

peek under the hood, it's very simple.

## how it works

by changing the directory structure of `site-packages` and symlinking modules.

instead of:

- your_project/venv/site-packages
  - foo (==1.6.1)
  - bar (==3.1.4)

the new structure is:

- site-packages (the global one)
  - foo_1.6.1
  - bar_3.1.4
- your_project/local-site-packages
  - foo -> site-packages/foo_1.6.1 (symlink)
  - bar -> site-packages/foo_1.6.1 (symlink)

## setup

**TODO:** need to write script to automate the process (probably use `requirements.txt` or simply pip normally and move everything with prejudice)

## how to setup manually

install the packages normally via pip:

```sh
pip install example-1.0.0
```

now the package is in `site-packages/<package>` so move it:

```sh
# run in python installation path where your site-packages are
mkdir site-packages/<package_version>
mv site-packages/<package> site-packages/<package_version>/<package>
```

in the example above, you would move:

```sh
mv site-packages/example site-packages/example_1.0.0/example.py
```

(`example.py` or just `example` or wherever your module is)

in your project's directory create directory where packages will be symlinked to their respective versions:

```sh
mkdir <your_project>/local-site-packages
```

now create symlinks for your packages:

```sh
ln -s site-packages/<package_version>/<package>
```

replace `<package_version>` with the version you want to use in your project. this will not interfere with other projects using other versions of the module.

optionally for compatibility create a symlink from `site-packages/<package>` to `site-packages/<package_version>/<package>` where package_version would be the default version used

before running your project, change where packages are loaded from:

```sh
export PYTHONPATH=<your_project>/local-site-packages
```

and now python will load modules from this directory. they are simply symlinks to the globally installed modules in `site-packages`.

now run your project normally:

```sh
python project.py
```
