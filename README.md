A chef-solo repository to handle my Mac.
Is invoked by Biosphere (see halo/biosphere).

General ENV variables:

SUDO=1

Biosphere Environment variables:

```bash
# Format:
# Highest precedence <- lower precedence <- default value

GITHUB_SSH_KEY_NAME <- SSH_KEY_NAME <- id_rsa
CHEF_SSH_KEY_NAME <- SSH_KEY_NAME <- id_rsa
GITHUB_SUBDOMAIN <- github.com
```
