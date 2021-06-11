Create a [Makefile](https://en.wikipedia.org/wiki/Make_(software)) to build a [tarball](https://en.wikipedia.org/wiki/Tar_(computing)) `bundle.tar` containing the following files:
- `hi.txt`
- `hello.json`

1. Create a rule `bundle.tar` to build the tarball
2. Create a rule `all` which call the rule `bundle.tar` to use `make` without arguments
3. Create a rule `clean` which remove the `bundle.tar`
4. Create a rule `re` which call the rules `clean`, then `all` to rebuild from scratch the tarball
