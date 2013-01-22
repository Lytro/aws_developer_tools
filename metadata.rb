name             "chef_ec2_cli_tools"
maintainer       "Lytro"
maintainer_email "webops@lytro.com"
license          "Apache 2.0"
description      "Installs/Configures chef_ec2_cli_tools"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.2"

depends 'java', '~> 1.8.0'

recipe "chef_ec2_cli_tools", "setup both Amazon AMI and API tools."
recipe "chef_ec2_cli_tools::ami", "only Amazon AMI tools"
recipe "chef_ec2_cli_tools::api", "only Amazon API tools."

replaces "ec2-ami-tools"
