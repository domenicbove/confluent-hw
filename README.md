# Base Confluent Platform Infrastructure on AWS

### Requirements - Install these binaries locally:
Ansible

Terraform

### Steps
1. Save your AWS credentials to terraform/terraform.tfvars
```
access_key = "XXXXX"
secret_key = "XXXXX"
```

2. Review terraform/vars.tf - Note your public ssh key gets used

3. Run terraform apply to provision aws objects as well as an hosts.yml file
```
cd terraform
terraform init
terraform apply
```

3. Pull down MY cp-ansible code and run the installer (fips-take3 branch is my future branch rn, dont ask)
```
git clone https://github.com/domenicbove/cp-ansible
cd cp-ansible
git checkout fips-take3
ansible-playbook -i /path/to/confluent-hw/hosts.yml all.yml
```

4. Review the hosts.yml file and see the public dns for control plane and go it the browser:
http://ec2-52-52-248-22.us-west-1.compute.amazonaws.com:9021 or https://ec2-54-153-13-48.us-west-1.compute.amazonaws.com:9021

5. Run the component upgrade playbook:
```
ansible-playbook -i /path/to/confluent-hw/hosts.yml upgrade_zookeeper.yml
```

6. To connect to any hosts
```
ssh ec2-user@ec2-52-52-248-22.us-west-1.compute.amazonaws.com -o StrictHostKeyChecking=no -o IdentitiesOnly=yes -t 'sudo su -'
```

7. Or just save this in your ~/.bash_profile
```
sshe () {
  ssh ec2-user@$1 -o StrictHostKeyChecking=no -o IdentitiesOnly=yes -t 'sudo su -'
}
```

And run:
```
sshe ec2-52-52-248-22.us-west-1.compute.amazonaws.com
```

7. Finally to clean all the infrastructure up
```
cd terraform
terraform destroy
```
