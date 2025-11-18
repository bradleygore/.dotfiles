#### NOTE: When switching profiles, be sure to set *BOTH* AWS_DEFAULT_PROFILE *AND* AWS_PROFILE 
####  as varying ecosystems use different env vars....
alias aws.whoami="aws sts get-caller-identity"

## awslocal is for localstack usage; see also https://github.com/localstack/awscli-local?tab=readme-ov-file#alternative
alias awslocal="AWS_ACCESS_KEY_ID=test AWS_SECRET_ACCESS_KEY=test AWS_DEFAULT_REGION=${DEFAULT_REGION:-$AWS_DEFAULT_REGION} aws --endpoint-url=http://${LOCALSTACK_HOST:-localhost}:4566"

# Fail closed: never silently fall back to [default]
unset AWS_PROFILE AWS_DEFAULT_PROFILE
export AWS_SDK_LOAD_CONFIG=1

# aws.p <profile>: set profile, auto SSO-login if needed, show identity
func aws.p() {
  local p="$1"
  if [ -z "$p" ]; then
    echo "Usage: aws.p <profile>"
    return 1
  fi
  export AWS_DEFAULT_PROFILE="$p"
  export AWS_PROFILE="$p"
  # Warm up SSO if needed
  if ! aws sts get-caller-identity >/dev/null 2>&1; then
    aws sso login --profile "$p" || { echo "SSO login failed for $p"; return 1; }
  fi
  echo "AWS_PROFILE=$AWS_PROFILE (acct: $(aws sts get-caller-identity --query 'Account' --output text 2>/dev/null))"
}

# aws.pselect: interactive profile selector (no extra deps)
func aws.pselect() {
  local profiles=("${(@f)$(aws configure list-profiles)}")
  if [ ${#profiles[@]} -eq 0 ]; then
    echo "No profiles found (aws configure list-profiles)."
    return 1
  fi
  echo "Select an AWS profile:"
  select p in "${profiles[@]}"; do
    [[ -n "$p" ]] || { echo "Invalid selection"; return 1; }
    aws.p "$p"
    break
  done
}

# aws.login [profile]: explicit SSO login
func aws.login() {
  local p="${1:-$AWS_PROFILE}"
  if [ -z "$p" ]; then echo "Usage: aws.login <profile>"; return 1; fi
  aws sso login --profile "$p"
}