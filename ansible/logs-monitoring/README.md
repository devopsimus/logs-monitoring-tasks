# Logs & Monitoring using Ansible
------

I decided to create Logs & Monitoring with 2 ways using Ansible and using Kubernetes
Here you will need to update the inventory file with the required ansible hosts and run the pipeline that will deploy ElasticSearch on the es host and Grafana to the grafana server

For the local development use the below commands

Install
-------

Install dependency, example

```
ansible-galaxy install -r requirements.yml
```

Encrypt
-------

Create encrypt secret

```
ansible-vault encrypt_string "secret-string" --name zabbix_server_pass --vault-password-file ~/ansible_vault.txt
```

Playbook run
-------

Create file ~/ansible_vault.txt
Running playbook with encrypt secret

```
ansible-playbook -i inventory/deploy.ini playbooks/setup/{elasticsearch,grafana}.yml -Kb --vault-password-file=~/ansible_vault.txt
```
