name             'aws_developer_tools'
maintainer       'Lytro'
maintainer_email 'cookbooks@lytro.com'
license          'Apache 2.0'
description      'Installs/Configures aws_developer_tools'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

depends 'java', '~> 1.8.0'

recipe 'aws_developer_tools', 'runs all of the recipes in this cookbook'
recipe 'aws_developer_tools::ami', 'only Amazon AMI tools'
recipe 'aws_developer_tools::api', 'only Amazon API tools.'

replaces 'chef_ec2_cli_tools'
