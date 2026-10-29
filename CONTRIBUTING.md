<!--
SPDX-FileCopyrightText: 2020 Alex Hedges <git@alexhedges.dev>

SPDX-License-Identifier: CC0-1.0
-->

# Contributing

This is a guide for contributing to this project.

## General

Most conventions are programmatically enforced. This document only specifies conventions that cannot be (or are not currently being) automatically checked.

To simplify this document, other style guides are incorporated by reference. This repository has priority over external documents, and specific rules take priority over general ones. When multiple guides are referenced together, they are sorted from highest to lowest priority.

Code should follow these guides:

- [Google Style Guides](https://google.github.io/styleguide/)

Prose (including within code) should be written in American English and follow these guides:

- [Google developer documentation style guide](https://developers.google.com/style)
- [Wikipedia:Manual of Style](https://en.wikipedia.org/wiki/Wikipedia:Manual_of_Style)
- [Merriam-Webster](https://www.merriam-webster.com/)
- [Wiktionary](https://en.wiktionary.org/wiki/Wiktionary:Main_Page)

If something is unspecified, ensure it is internally consistent. This should (preferably) be enforced programmatically or be documented here.

Here is some other miscellaneous guidance:

- Follow existing specifications and standards where possible
- Contribute changes upstream to reduce the local maintenance burden
- Avoid adopting proprietary dependencies
- Avoid using internal or undocumented interfaces of other projects
  - This includes avoiding monkey patching!
- Document anything that will be useful in the future, preferably in-tree or in the VCS log
- Prefer reproducible output to ease testing and debugging

### AI

For a [large][] [number] of [reasons], AI contributions are completely prohibited.

[large]: https://blog.codeberg.org/protecting-our-floss-commons-from-llms.html
[number]: https://sourcehut.org/blog/2026-08-27-tos-changes-and-llms/
[reasons]: https://sciactive.com/human-contribution-policy/

### License

Unless otherwise specified, contributions, VCS logs, forge contents, and any other ancillary development data fall under the project's default license. Material that is not under a compatible license will be rejected.

## Coding process

### Issues

Issues can be reported on [GitHub](https://github.com/aphedges/example-repo/issues).

Issues should be clear enough for a maintainer to resolve them. "[How to Report Bugs Effectively](https://www.chiark.greenend.org.uk/~sgtatham/bugs.html)" is a useful guide for writing issues.

### Commits

Commit messages should follow the style outlined in "[How to Write a Git Commit Message](https://cbea.ms/git-commit/)". In many cases, only a single line is necessary. Additional details that would be useful after review should be included in the commit body instead of in a PR description.

To ease review and ensure bisectability, ensure that each commit is a single, atomic change. Commit history should be cleaned up both before review and before merging.

### Pull requests

All development should be done on separate branches that are merged with PRs.

For non-trivial fixes, create an issue. If creating a new branch specifically for an issue, the branch name should start with the issue number.

Fill in the PR description and include the following (where relevant):

- Mention of related issue(s), if one exists
- Summary of changes made
- Explanation behind changes, such as the problem being solved, rationale for choosing specific solution, etc.
- Testing done to verify changes, when needed

Each PR requires:

- Passing CI tests
- At least one approving review
- Its branch to be ahead of the default branch

## Coding conventions

Unless otherwise specified, aim for a maximum line length of 100 characters for code files.

Prose files should avoid wrapping lines because rewrapping on wording changes makes diffs difficult to read.

### Markdown

Use [GitHub-Flavored Markdown](https://github.github.com/gfm/).

### Python

Follow these guides:

- [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html)
- [Typing Best Practices](https://typing.python.org/en/latest/reference/best_practices.html)
- [PEP 8 - Style Guide for Python Code](https://peps.python.org/pep-0008/)
- [PEP 257 - Docstring Conventions](https://peps.python.org/pep-0257/)

### Shell

All shell scripts must be written in Bash unless POSIX-compatibility is required.

Use the shebang `#!/usr/bin/env bash` to ensure the proper version of Bash is used.

Start files with `set -euo pipefail` to ensure the script stops execution when it errors.

## Testing

A test plan should be made for any non-trivial code change. It does not need to be exhaustive, but it should ensure the change does what it is supposed to do and doesn't cause any unexpected breakages.

Automated tests are preferred, but manual tests are acceptable if automation would be too difficult.

To test GitHub Actions workflows locally, install [`act`](https://github.com/nektos/act) and run it with `act`.
