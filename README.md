# livery-example

A small shared repository for [livery](https://github.com/Pnakoryn/livery): one team's setup for
Claude Code and Kiro (IDE and CLI), installed and kept up to date on every developer's machine.

Try it:

```sh
livery setup --source https://github.com/Pnakoryn/livery-example
```

Then copy it and make it your team's: see
[Start a shared repository](https://github.com/Pnakoryn/livery/blob/main/docs/onboarding.md).

## The idea

Claude Code and Kiro already ship strong commands for reviewing, planning, debugging and
delegating work. This setup does not replace them with its own. It gives them the team's rules,
and adds a skill only where they have no command. The names below are those of Claude Code 2.1
and Kiro IDE 1.0 / CLI v3; newer versions may name them differently.

## What is in it

| File | What it is | What it steers or adds |
|---|---|---|
| `base/instructions/commits.md` | always on | how every session commits and opens pull requests |
| `base/instructions/review.md` | always on | the criteria for every review: Claude Code's `/code-review` and `/security-review`, a review you ask Kiro for, and the `reviewer` agent below |
| `base/instructions/testing.md` | for test files only | what a test looks like; used whenever the agent writes or changes one |
| `base/instructions/github.md` | always on | how the team uses GitHub: `gh` first, what a pull request says, and that pushing, merging and commenting happen only when asked |
| `base/skills/review-pr/` | skill | reviews a GitHub pull request by number: purpose, checks, diff, existing comments, then the review itself with the coding agent's own review command where it has one (Claude Code: `/code-review <number>`). In Claude Code also `/review-pr` |
| `base/skills/changelog/` | skill (since v0.2.0) | user-facing notes for the next release, from the commits since the last tag. In Claude Code also `/changelog` |
| `base/mcp/context7.json` | MCP server, no key needed | current library documentation instead of what the model remembers |
| `base/mcp/github.json` | MCP server | GitHub's own MCP server in its read-only mode (issues, pull requests, code search; it cannot change anything); needs `GITHUB_TOKEN` in your shell, see below |
| `base/claude/agents/reviewer.md` | Claude Code subagent | a reviewer with no edit or write tool, told to use the shell for git read commands only; it works in its own context, follows the review rule and reports back |
| `base/kiro/agents/reviewer.json` | Kiro custom agent | the same reviewer for Kiro; pick it as the session agent or delegate to it. Its prompt repeats the core of `review.md`, because a custom agent has its own context |
| `teams/web/instructions/accessibility.md` | team `web`, for front-end files | accessibility rules |

Instructions become rules in Claude Code (`~/.claude/rules/`) and steering files in Kiro
(`~/.kiro/steering/`). The files below `claude/` and `kiro/` are copied as they are, for that
coding agent only.

## Built in, so not here

Use these as they come; the instructions above are what they follow.

- **Claude Code:** `/code-review` and `/security-review` for a change, `/simplify` to clean up,
  `/plan` before a larger change, `/verify` and `/run` to see a change working, `/init` for a
  project's own `CLAUDE.md`.
- **Kiro:** specs for a feature (requirements, design, tasks) and bugfix specs for a defect; the
  bundled workflows `investigate`, `feature-pipeline` and `publish-pr` (opens a pull request and
  handles the review feedback); powers from
  [kiro.dev/powers](https://kiro.dev/powers), which Kiro installs itself.

## The GitHub token

The GitHub MCP server reads `GITHUB_TOKEN` from the shell you start your coding agent in; livery
never stores it, and prints a `note` while it is not set. The server is installed in read-only
mode, so use a token that can only read: a
[fine-grained personal access token](https://github.com/settings/personal-access-tokens) with
read access to the repositories you work on.

```sh
export GITHUB_TOKEN=...   # in your shell profile or secret manager, not in a repository
```

The skills and instructions work without it: they use `gh`. A team that wants its agents to write
through the server changes the address in `base/mcp/github.json` to
`https://api.githubcopilot.com/mcp/`.

## The team `web`

A team adds its own layer on top of `base/`:

```sh
livery setup --team web
```

## Releases

livery installs tagged releases. `v0.1.0` is the first; `v0.2.0` adds the `changelog` skill
and one line in `commits.md`, so you can try `livery update` and the way back:

```sh
livery setup --source https://github.com/Pnakoryn/livery-example --channel v0.1.0
livery setup --channel stable     # follows releases again: installs v0.2.0
```

## Make it yours

1. Copy this repository (or use it as a template) into your organisation.
2. Change the instructions to your team's rules; delete what you do not need.
3. Run `livery check`, commit, and tag a release (`git tag v0.1.0`).
4. Tell your team: `livery setup --source <your address>`.

## License

Apache-2.0, see [LICENSE](LICENSE).
