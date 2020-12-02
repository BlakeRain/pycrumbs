import setuptools

with open("README.md", "rt") as fp:
    long_description = fp.read()

setuptools.setup(
    name="pycrumbs",
    version="0.0.1",
    author="Blake Rain",
    author_email="blake.rain@gmail.com",
    description="PyCrumbs is a command-line utility for the shell, for storing commands under a meaningful name in a hierarchy",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/BlakeRain/pycrymbs",
    packages=setuptools.find_packages(),
    scripts=["bin/pycrumbs"],
    install_requires=["argcomplete", "jinja2", "Pyyaml"],
    classifiers=[]
)
