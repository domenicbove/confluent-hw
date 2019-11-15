data "template_file" "hosts" {
  template = "${file("${path.module}/hosts.yml.tpl")}"
  vars = {
    node1_public_dns = "${aws_eip.eip_node1.public_dns}"
    node1_private_dns = "${aws_eip.eip_node1.private_dns}"
    node2_public_dns = "${aws_eip.eip_node2.public_dns}"
    node2_private_dns = "${aws_eip.eip_node2.private_dns}"
    node3_public_dns = "${aws_eip.eip_node3.public_dns}"
    node3_private_dns = "${aws_eip.eip_node3.private_dns}"
  }
}

resource "null_resource" "hosts_provisioner" {
  triggers = {
    template = "${data.template_file.hosts.rendered}"
  }

  provisioner "local-exec" {
    command = "echo \"${data.template_file.hosts.rendered}\" > ../hosts.yml"
  }
}

data "template_file" "kerberos_hosts" {
  template = "${file("${path.module}/kerberos-hosts.yml.tpl")}"
  vars = {
    node = "${aws_eip.eip_node4.public_dns}"
  }
}

resource "null_resource" "kerberos_hosts_provisioner" {
  triggers = {
    template = "${data.template_file.kerberos_hosts.rendered}"
  }

  provisioner "local-exec" {
    command = "echo \"${data.template_file.kerberos_hosts.rendered}\" > ../kerberos-hosts.yml"
  }
}
