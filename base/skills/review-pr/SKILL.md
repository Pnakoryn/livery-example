---
name: review-pr
description: Review a GitHub pull request by the team's review rules, given its number or URL. Use when asked to review a PR, look at a pull request, or check someone's change on GitHub.
---

# Review a pull request

Needs the `gh` command line tool, logged in (`gh auth status`).

1. Read what the change is for: `gh pr view <number> --json title,body,author,baseRefName,headRefName,isDraft,closingIssuesReferences`, and the linked issue when there is one.
2. Read the state of its checks: `gh pr checks <number>`. A failing check is the first finding.
3. Get the change: `gh pr diff <number>`. For more than the diff shows, read the surrounding code
   in the files of the base branch. Check the pull request's branch out (`gh pr checkout <number>`)
   only when asked to, in a clean working tree, and switch back afterwards (`git switch -`).
4. Review it. When your coding agent has its own review command that takes a pull request
   (Claude Code: `/code-review <number>`), use that; otherwise review it yourself. Either way the
   team's code review rules apply: findings ordered by harm, each with file and line, what goes
   wrong and when, and a proposed fix.
5. Read the comments already there (`gh pr view <number> --comments`) and drop what others have
   said.
6. Show the findings. Post them only when asked, as one review:
   `gh pr review <number> --comment --body-file <file>`. Approve or request changes only when
   asked for exactly that.
