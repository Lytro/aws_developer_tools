name             'aws_developer_tools'
maintainer       'Lytro'
maintainer_email 'cookbooks@lytro.com'
license          'Apache 2.0'
description      'Installs/Configures aws_developer_tools'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '3.1.2'

depends 'java', '>= 1.8.0'
depends 'chef_ruby', '>= 2.2.0'

recipe 'aws_developer_tools', 'runs all of the recipes in this cookbook'

replaces 'chef_ec2_cli_tools'
