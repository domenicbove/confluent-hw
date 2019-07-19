aws:
  hosts:
    ec2-instance:
      ansible_host: ${node}
      ansible_user: ec2-user
      ansible_ssh_common_args: -o StrictHostKeyChecking=no -o IdentitiesOnly=yes
      ansible_connection: ssh
      ansible_become: true
