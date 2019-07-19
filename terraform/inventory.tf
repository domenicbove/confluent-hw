data "template_file" "hosts" {
  template = "${file("${path.module}/hosts.yml.tpl")}"
  vars = {
    node1 = "${aws_eip.eip_node1.public_dns}"
    node2 = "${aws_eip.eip_node2.public_dns}"
    node3 = "${aws_eip.eip_node3.public_dns}"
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
