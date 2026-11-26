---
description: Accessibility rules for web front-end files
globs: ["**/*.html", "**/*.css", "**/*.jsx", "**/*.tsx", "**/*.vue", "**/*.svelte"]
---

# Accessibility

- Every interactive element is reachable and usable with the keyboard, and shows its focus.
- Use the native element (`button`, `a`, `label`, `input`) before ARIA roles.
- Every image has `alt` text; a decorative image has `alt=""`.
- Text and its background have a contrast ratio of at least 4.5 to 1.
- Do not convey a state by colour alone.
