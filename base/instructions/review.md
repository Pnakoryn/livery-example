---
description: What a code review checks, for every review command and reviewer agent
---

# Code review

These are the criteria for every review, whichever way it is started: the review command your
coding agent ships with, or the `reviewer` agent of this setup.

- Read the whole change before you comment.
- Order findings by harm: wrong behaviour and lost data first, then security, then missing tests,
  then names and style.
- Every finding names the file and line, says what goes wrong and when, and proposes a fix.
- Check that a behaviour change has a test that fails without it.
- Do not report what a formatter or linter already enforces.
- When nothing is wrong, say so in one line.
