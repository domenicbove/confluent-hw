all:
  vars:
    ansible_ssh_common_args: -o StrictHostKeyChecking=no -o IdentitiesOnly=yes
    ansible_connection: ssh
    ansible_ssh_user: centos
    ansible_become: true
    security_mode: plaintext
preflight:
  hosts:
    ${node1}:
    ${node2}:
    ${node3}:
zookeeper:
  hosts:
    ${node1}:
    ${node2}:
    ${node3}:
broker:
  hosts:
    ${node1}:
      kafka:
        broker:
          id: 1
    ${node2}:
      kafka:
        broker:
          id: 2
    ${node3}:
      kafka:
        broker:
          id: 3
schema-registry:
  hosts:
    ${node1}:
control-center:
  hosts:
    ${node2}:
      confluent:
        control:
          center:
            config:
              confluent.controlcenter.connect.cluster: ${node1}:8083
connect-distributed:
  hosts:
    ${node1}:
kafka-rest:
  hosts:
    ${node1}:
ksql:
  hosts:
    ${node2}:
