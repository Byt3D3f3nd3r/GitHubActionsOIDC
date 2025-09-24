# Terraform Landing Zone 🚀

This repository contains a **Terraform Landing Zone scaffold** wired to **GitHub Actions OIDC** for secure, keyless authentication into AWS.

## Structure

```
terraform-landing-zone/
├── modules/
│   ├── bootstrap-backend/   # S3 bucket + DynamoDB table for state/locks
│   ├── logging/             # CloudTrail + centralized log bucket
│   ├── config/              # AWS Config recorder + delivery
│   ├── security-services/   # GuardDuty + SecurityHub
│   ├── network/             # Minimal VPC
│   └── iam-baseline/        # Example IAM policy (read-only + STS)
├── envs/
│   ├── dev/                 # Dev environment wiring
│   └── prod/                # Prod environment wiring
└── .github/workflows/
    ├── bootstrap-backend.yml # One-time bootstrap for state backend
    └── terraform-dev.yml     # Terraform plan/apply on dev branch
```

## Getting Started

1. **Bootstrap state backend**
   - Run the `bootstrap-backend.yml` workflow manually.
   - Input a globally unique S3 bucket name for Terraform state.

2. **Configure backend**
   - Update `envs/dev/backend.tf` with your S3 bucket, DynamoDB table, and region.

3. **Deploy dev**
   - Push changes to the `dev` branch.
   - GitHub Actions will authenticate to AWS via OIDC, init Terraform, and apply.

4. **Future: prod**
   - Create a separate IAM role `GitHubActionsOIDC-Prod` limited to `main`.
   - Add a `terraform-prod.yml` workflow restricted to `main`.

## Benefits

- ✅ No long-lived AWS keys  
- ✅ Secure, short-lived credentials via OIDC  
- ✅ Separation of environments (`dev` vs `prod`)  
- ✅ Ready for scaling with real Terraform modules

---

## Next Steps

- Add AWS Organizations + SCP modules  
- Expand VPC networking (subnets, NATs, endpoints)  
- Harden IAM policies per environment  
