# Example repository

## Installation

Use the provided Makefile to install this project by running the following from the project root directory (the same directory as this README). Ensure your current active python path is 3.11 before running this command:

```bash
make install
```

If the installation process fails, is interrupted, or for any reason needs to be restarted, run `git clean -xdf` to reset the repository's state.

## Contributing

This project uses [pre-commit](https://pre-commit.com/), which is automatically installed with the rest of the development requirements.

Pre-commit checks will now run automatically when you make a commit. If you want to run a subset of checks for formatting `make precommit` still runs some checks.

## License

[MIT](https://choosealicense.com/licenses/mit/)
