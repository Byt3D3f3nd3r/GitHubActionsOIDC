# Landing Zone

Ready-made starter with:
- GitHub Actions OIDC smoke-test workflow
- Minimal Terraform stub under `infra/`

## Quick start
1) Create GitHub repo (e.g., `GitHubActionsOIDC`) and add repo secrets:
   - `AWS_ROLE_ARN` (e.g., arn:aws:iam::<ACCOUNT_ID>:role/GitHubActionsOIDCRole)
   - `AWS_REGION` (e.g., eu-west-1)
2) Push this folder as your repo root.
3) The workflow runs on push/PR. It assumes the AWS role via OIDC, prints identity,
   and (optionally) runs `terraform init/validate` if `infra/*.tf` exists.
