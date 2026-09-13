
---

# 📄 `architecture-diagram.md`

```markdown
# Architecture Diagram

```text
                         INTERNET
                             |
                             v
                    +----------------+
                    | Internet       |
                    | Gateway        |
                    +-------+--------+
                            |
                            v
                    +---------------+
                    | PUBLIC SUBNET |
                    | Reverse Proxy |
                    +-------+-------+
                            |
                            v
                    +----------------+
                    | PRIVATE SUBNET|
                    | Application    |
                    +-------+--------+
                            |
                            v
                    +----------------+
                    | PRIVATE DB     |
                    | Database       |
                    +----------------+

 IAM ---------------------> Resources
 Logging ------------------> Monitoring
 Backup -------------------> Storage
 Security Groups -----------> Traffic Control