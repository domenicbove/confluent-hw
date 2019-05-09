# Base Confluent Platform Infrastructure on AWS

### To provision this is pretty basic infrastructure:
1. Save your AWS credentials to terraform/terraform.tfvars
```
access_key = "XXXXX"
secret_key = "XXXXX"
```

2. Run terraform apply!
```
cd terraform
terraform init
terraform apply
```

3. Pull down MY cp-ansible code and run the installer with the newly created hosts.yml file
```
git clone https://github.com/domenicbove/cp-ansible
cd cp-ansible
git checkout 5.1.x-dom
ansible-playbook -i /path/to/confluent-hw/hosts.yml all.yml
```

4. Finally to upgrade the confluent brokers to 5.2
```
cd cp-ansible
git checkout 5.2.x-dom
ansible-playbook -i /path/to/confluent-hw/hosts.yml upgrade.yml
```
