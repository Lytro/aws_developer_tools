default['chef_ec2_cli_tools']['install_root'] = "/usr/local/share"
default['chef_ec2_cli_tools']['install_target'] = "#{default['chef_ec2_cli_tools']['install_root']}/ec2-tools"

default['chef_ec2_cli_tools']['install_java?'] = true

default['chef_ec2_cli_tools']['aws_access_key'] = "Your Access Key"
default['chef_ec2_cli_tools']['aws_secret_key'] = "Your Secret Key"
