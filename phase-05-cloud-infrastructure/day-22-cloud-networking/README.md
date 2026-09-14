# Day 22 — Cloud Networking

## 📚 What I Learned

* VPC and subnet concepts
* Public and private network architecture
* Route tables and routing
* Security Groups and firewall concepts
* Network traffic flow
* DNS resolution
* Port connectivity
* Basic network troubleshooting
* Least-exposure network architecture

## 🛠️ Tools Used

* Ubuntu Server
* Linux Networking Tools
* UFW Firewall
* Nginx / Reverse Proxy concepts
* `iproute2`
* `ss`
* `curl`
* `ping`
* `netcat`
* `nslookup` / `dig`

## 💻 Commands Used

| Command                       | Purpose                                  |
| ----------------------------- | ---------------------------------------- |
| `ip addr`                     | View IP addresses and network interfaces |
| `ip route`                    | View routing table and default gateway   |
| `ss -tuln`                    | Check listening TCP/UDP ports            |
| `nslookup example.com`        | Test DNS resolution                      |
| `dig example.com`             | Detailed DNS lookup                      |
| `curl -I https://example.com` | Check HTTP response headers              |
| `ping -c 4 8.8.8.8`           | Test basic network connectivity          |
| `nc -zv example.com 80`       | Test TCP port connectivity               |
| `sudo ufw status`             | Check firewall status                    |
| `sudo ufw status numbered`    | View firewall rules with numbers         |

## 🔑 Key Takeaways

* Learned how network traffic moves through interfaces and routing tables.
* Practiced DNS, HTTP and TCP connectivity testing.
* Learned how firewall rules control network access.
* Designed a public reverse-proxy and private application architecture.
* Understood why databases should remain in a restricted/private network.
