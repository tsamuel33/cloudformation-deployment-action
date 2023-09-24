#!/bin/bash
cp -r /scripts ./scripts

if [ $GITHUB_EVENT_NAME = "pull_request" ]
then
    BRANCH_NAME=$GITHUB_BASE_REF
else
    BRANCH_NAME=$GITHUB_REF_NAME
fi

# Get Settings
setting_num=1
for var in branch_type github_environment github_secret_type policy_as_code_provider aws_account_number account_number_secret_name github_assumed_role_name change_set_before_deploy
do
    setting_num=$(($setting_num + 1))
    if [ $1 == 'Setup '] || [ ${!setting_num} == '' ]
        then
            SETTING=$(python3 -m scripts.env_setup --branch $BRANCH_NAME  --github_env_var $var --config_file ${10} --action_mode docker)
            echo "$var=${SETTING}" >> "$GITHUB_OUTPUT"
    fi
done

echo $GITHUB_OUTPUT
cat $GITHUB_OUTPUT