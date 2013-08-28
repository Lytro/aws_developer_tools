name             'aws_developer_tools'
maintainer       'Lytro'
maintainer_email 'cookbooks@lytro.com'
license          'Apache 2.0'
description      'Installs/Configures aws_developer_tools'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '3.1.2'

depends 'java', '>= 1.8.0'
depends 'chef_ruby', '>= 2.2.0'

recipe "aws_developer_tools::default", "Runs all recipes: ami, api, auto_scaling, cloudwatch, elb."
recipe "aws_developer_tools::ami", "Installs Amazon AMI Tools (requires Ruby)."
recipe "aws_developer_tools::api", "Installs Amazon API Tools (requires Java)."
recipe "aws_developer_tools::auto_scaling", "Installs Amazon Auto Scaling tools (requires Java)."
recipe "aws_developer_tools::cloudwatch", "Installs CloudWatch tools (requires Java)."
recipe "aws_developer_tools::elb", "Installs Elastic Load Balancing tools (requires Java)."
recipe "aws_developer_tools::aws_ha_release",  "Installs AWS HA Release. Third-party script that replaces old instances with new ones; used when deploying new code to ensure all active instances are using the fresh code. Since this is a third-party script, it is not a part of the default recipe."

replaces 'chef_ec2_cli_tools'
