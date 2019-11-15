all:
  vars:
    ansible_ssh_common_args: -o StrictHostKeyChecking=no -o IdentitiesOnly=yes
    ansible_connection: ssh
    ansible_ssh_user: ec2-user
    ansible_become: true

    # Installing 5.4
    confluent_common_repository_redhat_main_baseurl: "http://jenkins-confluent-packages.s3-us-west-2.amazonaws.com/5.4.x/54/rpm/5.4"
    confluent_common_repository_redhat_main_gpgkey: "http://jenkins-confluent-packages.s3-us-west-2.amazonaws.com/5.4.x/54/rpm/5.4/archive.key"
    confluent_common_repository_redhat_dist_baseurl: "http://jenkins-confluent-packages.s3-us-west-2.amazonaws.com/5.4.x/54/rpm/5.4"
    confluent_common_repository_redhat_dist_gpgkey: "http://jenkins-confluent-packages.s3-us-west-2.amazonaws.com/5.4.x/54/rpm/5.4/archive.key"
    confluent_package_redhat_suffix: -5.4.0-0.1.SNAPSHOT
    confluent_package_version: 5.4.0
    #confluent_server_enabled: true

zookeeper:
  hosts:
    ${node1_private_dns}:
      ansible_ssh_host: ${node1_public_dns}
    ${node2_private_dns}:
      ansible_ssh_host: ${node2_public_dns}
    ${node3_private_dns}:
      ansible_ssh_host: ${node3_public_dns}
kafka_broker:
  hosts:
    ${node1_private_dns}:
    ${node2_private_dns}:
    ${node3_private_dns}:
control_center:
  hosts:
    ${node2_private_dns}:
