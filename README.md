<!--
SPDX-FileCopyrightText: 2024 Alex Hedges <git@alexhedges.dev>

SPDX-License-Identifier: CC0-1.0
-->

# < Project name >

## Template usage

When setting up this repository, make sure to complete the following steps:

- Fill in the project title of `README.md`
- Update the below sections of `README.md` to match the project's information
- Make changes so `just check` passes
- Delete the "Template usage" section from `README.md`

## Installation

Use the provided justfile to install this project by running the following from the project root directory (the same directory as this README).

Ensure these commands are in `PATH` and at least as new as the required versions:

- `bash`: 5.0
  - Older versions might work but haven't been tested
- `just`: 1.55.0
  - Declared in [`justfile`](justfile)
- `pip`: 25.1
  - Needed for the `--group` option
- `python`: 3.13
  - Declared in [`pyproject.toml`](pyproject.toml)

Then, run this command to set up the repository:

```shell
just install
```

If the installation process fails, is interrupted, or for any reason needs to be restarted, run `git clean -xdf` to reset the repository's state.

## Contributing

This project uses various code quality tooling, all of which is automatically installed with the rest of the development requirements.

All checks can be run with `just check`, and some additional automatic changes can be run with `just fix`.

To test GitHub Actions workflows locally, install [`act`](https://github.com/nektos/act) and run it with `act`.

## License

This project follows the [REUSE](https://reuse.software/) specification to express copyright information. All relevant licenses are in [`LICENSES/`](LICENSES/).

This repository template is distributed under [CC0 1.0 Universal](LICENSES/CC0-1.0.txt).
