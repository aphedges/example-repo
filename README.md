# < Project name >

## Template usage

This repository template is marked with CC0 1.0 Universal. To view a copy of this license, visit <http://creativecommons.org/publicdomain/zero/1.0>.

When setting up this repository, make sure to complete the following steps:

- Replace the `LICENSE` file with `LICENSE.MIT` and fill in the project owner in the new `LICENSE` file. If you would rather keep the CC0 license, then just delete `LICENSE.MIT` and edit the "License" section of `README.md` accordingly.
- Fill in the project title in `README.md`
- Delete the "Template usage" section from `README.md`

## Installation

Use the provided Makefile to install this project by running the following from the project root directory (the same directory as this README). Ensure the `python` in `PATH` is 3.11 before running this command:

```shell
make install
```

If the installation process fails, is interrupted, or for any reason needs to be restarted, run `git clean -xdf` to reset the repository's state.

## Contributing

This project uses various code quality tooling, all of which is automatically installed with the rest of the development requirements.

All checks can be run with `make check`, and some additional automatic changes can be run with `make fix`.

## License

[MIT](https://choosealicense.com/licenses/mit/)
