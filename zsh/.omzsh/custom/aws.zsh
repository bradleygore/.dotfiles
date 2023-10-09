#### NOTE: When switching profiles, be sure to set *BOTH* AWS_DEFAULT_PROFILE *AND* AWS_PROFILE 
####  as varying ecosystems use different env vars....
alias aws.whoami="aws sts get-caller-identity"
## change profile like `aws.profile.set some_profile_name`
alias aws.profile.set="export AWS_DEFAULT_PROFILE=$1; export AWS_PROFILE=$1"

