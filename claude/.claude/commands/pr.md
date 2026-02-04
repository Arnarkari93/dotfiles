---
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git log:*), Bash(git branch:*), Bash(gh pr create:*)
description: Create a pull request for current branch
---

## Context

- Current branch: !`git branch --show-current`
- Git status: !`git status`
- Parent branch: !`git-town parent 2>/dev/null || echo "main"`
- Commits since parent: !`git log $(git-town parent 2>/dev/null || echo "main")..HEAD --oneline`
- Full diff from parent: !`git-town diff-parent 2>/dev/null || git diff $(git-town parent 2>/dev/null || echo "main")...HEAD`
- Remote tracking: !`git branch -vv | grep '^\*'`
- PR template (if exists): !`cat .github/pull_request_template.md 2>/dev/null || echo "No template"`

## Your task

Create a PR for the current branch.

1. If branch not pushed to remote, push with `git push -u origin <branch>`
2. Analyze ALL commits since parent branch (not just latest) to understand full scope
3. Create PR using `git-town propose`:
   - If branch starts with `NAGLINN-`, prefix title with ticket number (e.g. `NAGLINN-123: title`)
   - Use PR template format if one exists
   - Write concise summary bullets based on actual changes
   - Add test plan checklist

Use HEREDOC for PR body:
```
git-town propose --title "title" --body "$(cat <<'EOF'
body here
EOF
)"
```

Execute all steps in a single message. Return the PR URL when done.
