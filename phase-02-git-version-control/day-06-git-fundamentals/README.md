# Day 06 — Git Fundamentals

## Objective

The objective of this module was to understand Git fundamentals and safely manage project history using version control.

---

## Topics Learned

- Git repository
- Commits
- Branches
- Merge
- Merge conflicts
- Rebase concept
- Tags
- `.gitignore`
- Git recovery

---

## Commands

| Command | Purpose | Why I Used It |
|---|---|---|
| `git init` | Creates a Git repository | To start version control |
| `git status` | Shows repository state | To inspect changes |
| `git add` | Stages changes | To prepare changes for commit |
| `git commit` | Creates a commit | To save project history |
| `git log` | Shows commit history | To review previous changes |
| `git branch` | Manages branches | To isolate development work |
| `git switch` | Changes branches | To move between branches |
| `git merge` | Combines branches | To integrate changes |
| `git diff` | Compares changes | To review modifications |
| `git tag` | Creates version tags | To mark releases |
| `git restore` | Restores files | To recover working changes |
| `git reflog` | Shows reference history | To recover lost commits |

---

## Practical Work

I practiced:

1. Creating a repository
2. Creating commits
3. Creating branches
4. Switching branches
5. Creating a merge conflict
6. Resolving a merge conflict
7. Creating a release tag
8. Recovering from an incorrect change

---

## Example Workflow

**Stage and commit changes**

```bash
git status
git add .
git commit -m "docs: update learning notes"
```

**Create a feature branch**

```bash
git switch -c feature/day-06-practice
```

**Return to main**

```bash
git switch main
```

**Merge**

```bash
git merge feature/day-06-practice
```

**View history**

```bash
git log --oneline
```

**Create a tag**

```bash
git tag v1.0.0
```

---

## Merge Conflict Practice

A controlled merge conflict was created and resolved to understand how Git handles competing changes.

The workflow was:

```
Create Branches
      ↓
Modify Same File
      ↓
Merge
      ↓
Conflict
      ↓
Resolve Conflict
      ↓
Commit Resolution
```

---

## Recovery

I practiced Git history inspection and recovery concepts using:

```bash
git reflog
```

This helped me understand how Git references previous repository states.

---

## Security Learning

I learned that `.gitignore` can help prevent unwanted files such as environment files, logs, and local secrets from being committed.

---

## Evidence

**Screenshots**

```
screenshots/
```

---

## Key Learning

I learned how Git tracks project history and how branches, merges, tags, and recovery mechanisms help manage changes safely without losing work.
