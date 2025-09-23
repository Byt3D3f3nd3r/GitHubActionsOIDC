# infra/

Minimal Terraform scaffold. Safe to run `terraform init` and `terraform validate`.

## Files
- `main.tf` — provider + region variable.

## Usage
```bash
terraform -chdir=infra init
terraform -chdir=infra validate
```
