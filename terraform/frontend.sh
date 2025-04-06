#!/bin/bash
app_Version=$1
dnf install ansible -y
pip3.9 install botocore boto3
ansible-pull -i localhost, -U https://github.com/MEDASANI-CHARAN/expense-ansible-roles.git frontend.yaml -e app_version=$1
