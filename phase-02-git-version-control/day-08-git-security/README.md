# Day 08 — Git Security

## Objective

The objective of this module was to understand common Git repository security risks and how sensitive information should be detected, removed, and prevented.

---

## Topics Learned

- Secrets in Git
- Secret scanning concepts
- Signed commit concept
- Token hygiene
- Secret removal
- Credential rotation
- Prevention

---

## Security Workflow

```text
Dummy Secret
      ↓
Detection
      ↓
Removal
      ↓
History Review
      ↓
Credential Rotation
      ↓
Prevention
```

---

## Important Lesson

Deleting a secret from the current version of a file does not necessarily remove it from Git history.

Therefore, exposed credentials must be treated as compromised and should be rotated or revoked.

---

## Practical Work

In a controlled laboratory environment, I practiced using a dummy secret to understand:

1. Detection
2. Removal
3. History awareness
4. Rotation concept
5. Prevention

> No real credential was used.

---

## Security Practices

- Never commit real credentials.
- Use `.gitignore`.
- Use secret scanning.
- Review repository history.
- Rotate exposed credentials.
- Use dummy secrets only in controlled labs.

---

## Evidence

**Screenshots**

```
screenshots/
```

---

## Key Learning

I learned that repository security is not only about deleting sensitive data from a file. It also requires detection, history awareness, credential rotation, and preventive controls.
