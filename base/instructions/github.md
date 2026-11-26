---
description: "How this team works with GitHub: issues, branches, pull requests and reviews"
---

# Working with GitHub

- Use the `gh` command line tool for issues, pull requests and checks when it is installed, and
  the GitHub MCP server otherwise. Do not scrape github.com.
- One pull request per logical change, from a branch named after what it does.
- The pull request description says what changes and why, how it was checked, and names the issue
  it belongs to (`Closes #123` when it resolves it).
- Open a pull request as a draft until its checks pass and it is ready to be read.
- After a review, answer every comment: change the code in a new commit, or say why not. Do not
  rewrite commits that were already reviewed.
- Push, open or merge a pull request, post a comment or a review, and close an issue only when the
  person you work for asks you to. Never force-push a branch other people use.
