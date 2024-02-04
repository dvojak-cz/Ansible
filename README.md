# Anible setup
Simple ansible setup for my peronal unvironment.

## How to use
1. Install ansible
```bash
apt update
apt install -y --no-install-recommends gnupg ca-certificates git ansible sudo
echo "${USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${USER}
```

2. Clone the repository
```bash
git clone https://github.com/dvojak-cz/ansible.git
```

3. Run the playbook
```bash
ansible-playbook local.yml
```

## Available roles
```yaml
#grep -rohP 'tags:.*\[\K[^]]+' . --exclude README.md | tr -d '"' | tr ',' '\n' | tr -d ' ' | sort -u | jq -R '[inputs]'
[
  "bs",
  "discord",
  "dotfiles",
  "files",
  "folder-structure",
  "gui",
  "install",
  "iptables",
  "productivity",
  "secret-files",
  "slack",
  "ssh",
  "zsh"
]
```

## Todo
- [ ] GUI
