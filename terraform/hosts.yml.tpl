all:
  vars:
    ansible_ssh_common_args: -o StrictHostKeyChecking=no -o IdentitiesOnly=yes
    ansible_connection: ssh
    ansible_ssh_user: ec2-user
    ansible_become: true

    # Installing 5.4 (Uncomment these vars for upgrade)
    # confluent_common_repository_redhat_main_baseurl: "http://jenkins-confluent-packages.s3-us-west-2.amazonaws.com/5.4.x/54/rpm/5.4"
    # confluent_common_repository_redhat_main_gpgkey: "http://jenkins-confluent-packages.s3-us-west-2.amazonaws.com/5.4.x/54/rpm/5.4/archive.key"
    # confluent_common_repository_redhat_dist_baseurl: "http://jenkins-confluent-packages.s3-us-west-2.amazonaws.com/5.4.x/54/rpm/5.4"
    # confluent_common_repository_redhat_dist_gpgkey: "http://jenkins-confluent-packages.s3-us-west-2.amazonaws.com/5.4.x/54/rpm/5.4/archive.key"
    # confluent_package_redhat_suffix: -5.4.0-0.1.SNAPSHOT
    # confluent_package_version: 5.4.0

    ssl_enabled: true
    sasl_protocol: scram

    kafka_broker_custom_listeners:
      super:
        name: SUPER
        port: 9093
        ssl_enabled: false
        ssl_mutual_auth_enabled: false
        sasl_protocol: none

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
      kafka_broker_custom_listeners:
        super:
          hostname: ${node1_public_dns}
    ${node2_private_dns}:
      kafka_broker_custom_listeners:
        super:
          hostname: ${node2_public_dns}
    ${node3_private_dns}:
      kafka_broker_custom_listeners:
        super:
          hostname: ${node3_public_dns}
schema_registry:
  hosts:
    ${node1_private_dns}:
kafka_rest:
  hosts:
    ${node1_private_dns}:
kafka_connect:
  hosts:
    ${node3_private_dns}:
ksql:
  hosts:
    ${node3_private_dns}:
control_center:
  hosts:
    ${node2_private_dns}:
      ansible_ssh_host: ${node2_public_dns}
