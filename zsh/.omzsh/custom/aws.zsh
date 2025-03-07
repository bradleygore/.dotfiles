#### NOTE: When switching profiles, be sure to set *BOTH* AWS_DEFAULT_PROFILE *AND* AWS_PROFILE 
####  as varying ecosystems use different env vars....
alias aws.whoami="aws sts get-caller-identity"
## change profile like `aws.profile.set some_profile_name`
alias aws.profile.set="export AWS_DEFAULT_PROFILE=$1; export AWS_PROFILE=$1"
alias aws.adabraBradley="export AWS_DEFAULT_PROFILE=adabra_bradley"

## awslocal is for localstack usage; see also https://github.com/localstack/awscli-local?tab=readme-ov-file#alternative
alias awslocal="AWS_ACCESS_KEY_ID=test AWS_SECRET_ACCESS_KEY=test AWS_DEFAULT_REGION=${DEFAULT_REGION:-$AWS_DEFAULT_REGION} aws --endpoint-url=http://${LOCALSTACK_HOST:-localhost}:4566"
