# Day 37: OWASP Top 10 Threat Model

## Project overview
This is a threat-model exercise for a sample web application. It does not claim that a live application has been scanned.

## Assets
- User accounts and sessions
- User and application data
- Database credentials and API keys
- Administrative functionality
- Availability and security logs

## Threats and controls
| Risk area | Example threat | Defensive control |
|---|---|---|
| Broken Access Control | A user reads another user's records | Enforce server-side authorization on every request |
| Injection | Untrusted input changes a database query | Parameterized queries and input validation |
| Authentication Failures | Weak passwords or stolen sessions | Secure password hashing, MFA, session expiry |
| Security Misconfiguration | Debug mode or default credentials exposed | Disable debug mode; remove defaults; harden deployment |
| Cryptographic Failures | Sensitive data sent without protection | HTTPS and appropriate encryption |
| Vulnerable Components | A library contains a known CVE | Inventory, scan, update and retest dependencies |
| Logging/Monitoring Failures | Attacks are not noticed | Log relevant security events and alert on suspicious activity |

## Trust boundaries
1. Browser to web application
2. Web application to database
3. Application to external services
4. Developer workstation to source repository and CI/CD

## Secure coding principles
- Validate untrusted input on the server.
- Use parameterized queries.
- Apply least privilege and deny access by default.
- Keep secrets out of source code.
- Avoid exposing stack traces and sensitive information.
- Log security events without recording passwords or tokens.
- Keep dependencies and runtime images updated.

## Test plan
Review authorization, authentication, database access, debug configuration, dependencies and security logs. Test only systems I own or am authorized to assess.

## Limitations
This document is a planning exercise. Actual findings must be recorded only after testing.
