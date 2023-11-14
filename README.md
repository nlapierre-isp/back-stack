# back-stack

Introducing the BACK Stack


![architecture diagram](./imgs/arch.png)

## Prerequisites
For a local install, you need kind installed and a bash-compatible shell.

## Getting started
- 
- Create a personal access token [link](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/xmanaging-your-personal-access-tokens#creating-a-personal-access-token-classic)
- Configure `./.env` with your personal access token, the repository url, the vault token, your provider-azure credentials [see here](https://marketplace.upbound.io/providers/upbound/provider-family-azure/v0.38.2/docs/configuration), and your provider-aws credentials [see here](https://marketplace.upbound.io/providers/upbound/provider-family-aws/v0.43.1/docs/configuration)
  
  ```properties
  GITHUB_TOKEN=<personal access token>
  REPOSITORY=https://github.com/<path to forked repo>
  VAULT_TOKEN=root # this is the default for 'dev' mode
  AWS_ACCESS_KEY_ID="xxx"
  AWS_SECRET_ACCESS_KEY="xxx"
  AWS_SESSION_TOKEN="xxx"
  ```
  
- Run the installer. This will install the asdf dependencies along with the
  crossplane-cli:
  ```sh
  make up
  ```
- When you're done, run the following to remove the local resources:
  ```
  make clean
  ```
  Note that this will NOT resources created in AWS.
