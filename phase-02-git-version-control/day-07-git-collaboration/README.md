# Day 07 — Git Collaboration

## Objective

The objective of this module was to understand professional Git collaboration workflows using feature branches, Pull Requests, reviews, and branch protection concepts.

---

## Topics Learned

- Feature branches
- Pull Requests
- Code review
- Review checklist
- Protected branches
- Professional commit practices

---

## Professional Workflow

```text
Feature Branch
      ↓
Development
      ↓
Commit
      ↓
Push
      ↓
Pull Request
      ↓
Review
      ↓
Approval
      ↓
Merge
```

---

## Example Branch

```bash
git switch -c feature/day-07-collaboration
```

---

## Example Commit

```bash
git add .
git commit -m "docs: improve collaboration documentation"
```

---

## Pull Request

A Pull Request was used to propose changes for review before merging them into the main branch.

---

## Review Checklist

Before merging a Pull Request, I reviewed:

- Is the change necessary?
- Is the documentation clear?
- Are there unnecessary files?
- Are secrets excluded?
- Is the commit message meaningful?
- Does the change follow the repository structure?

---

## Branch Protection

I studied the concept of protecting the main branch so that important changes can go through review before being merged.

---

## Key Learning

I learned how Git changes can be isolated, reviewed, approved, and integrated using a professional workflow.
