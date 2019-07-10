data "template_file" "hosts" {
  template = "${file("${path.module}/hosts.yml.tpl")}"
  vars = {
    node1 = "${aws_eip.eip-node1.public_dns}"
    node2 = "${aws_eip.eip-node2.public_dns}"
    node3 = "${aws_eip.eip-node3.public_dns}"
  }
}

resource "null_resource" "local" {
  triggers = {
    template = "${data.template_file.hosts.rendered}"
  }

  provisioner "local-exec" {
    command = "echo \"${data.template_file.hosts.rendered}\" > ../hosts.yml"
  }
}
