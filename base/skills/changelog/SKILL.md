---
name: changelog
description: Write release notes for the next release from the commits since the last tag. Use when asked for release notes, a changelog entry or "what changed since the last release".
---

# Changelog

1. Run this skill's `scripts/changes.sh` from the root of the repository that is being released. It prints the last tag and one line per commit
   since then. With an argument it starts from that tag or commit instead.
2. Read the diff of a commit when its subject does not say what changed for a user.
3. Write the notes for the people who use the software, not for those who wrote it:
   - Group under **Added**, **Changed**, **Fixed** and **Removed**; leave out empty groups.
   - One line per change, starting with what the user can now do or what no longer goes wrong.
   - Leave out changes a user cannot notice (refactoring, tests, CI).
   - Put anything that needs an action from the user first, under **Before you update**.
4. Show the notes; do not create a tag or a release unless asked.
