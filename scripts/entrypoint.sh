#!/bin/bash
cp -r /scripts ./scripts

if [ $GITHUB_EVENT_NAME = "pull_request" ]
then
    BRANCH_NAME=$GITHUB_BASE_REF
else
    BRANCH_NAME=$GITHUB_REF_NAME
fi

# Get Settings
SETTING=$(python3 -m scripts.env_setup --branch $BRANCH_NAME  --github_env_var branch_type --config_file ${10} --action_mode docker)
echo "branch_type=${SETTING}" >> "$GITHUB_OUTPUT"
SETTING=$(python3 -m scripts.env_setup --branch $BRANCH_NAME  --github_env_var github_environment --config_file ${10} --action_mode docker)
echo "github_environment=${SETTING}" >> "$GITHUB_OUTPUT"
SETTING=$(python3 -m scripts.env_setup --branch $BRANCH_NAME  --github_env_var github_secret_type --config_file ${10} --action_mode docker)
echo "github_secret_type=${SETTING}" >> "$GITHUB_OUTPUT"
SETTING=$(python3 -m scripts.env_setup --branch $BRANCH_NAME  --github_env_var policy_as_code_provider --config_file ${10} --action_mode docker)
echo "policy_as_code_provider=${SETTING}" >> "$GITHUB_OUTPUT"
SETTING=$(python3 -m scripts.env_setup --branch $BRANCH_NAME  --github_env_var aws_account_number --config_file ${10} --action_mode docker)
echo "aws_account_number=${SETTING}" >> "$GITHUB_OUTPUT"
SETTING=$(python3 -m scripts.env_setup --branch $BRANCH_NAME  --github_env_var account_number_secret_name --config_file ${10} --action_mode docker)
echo "account_number_secret_name=${SETTING}" >> "$GITHUB_OUTPUT"
SETTING=$(python3 -m scripts.env_setup --branch $BRANCH_NAME  --github_env_var github_assumed_role_name --config_file ${10} --action_mode docker)
echo "github_assumed_role_name=${SETTING}" >> "$GITHUB_OUTPUT"
SETTING=$(python3 -m scripts.env_setup --branch $BRANCH_NAME  --github_env_var change_set_before_deploy --config_file ${10} --action_mode docker)
echo "change_set_before_deploy=${SETTING}" >> "$GITHUB_OUTPUT"

echo $GITHUB_OUTPUT
cat $GITHUB_OUTPUT