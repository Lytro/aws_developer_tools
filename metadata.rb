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

attribute "aws_developer_tools/install_java?",
  :display_name => "AWS Developer Tools install java",
  :description => "Whether to automatically install Java with Amazon API Tools.",
  :required => "optional",
  :recipes => [ "aws_developer_tools:api" ],
  :choice => [ "true", "false" ],
  :default => "true"

attribute "aws_developer_tools/install_ruby?",
  :display_name => "AWS Developer Tools install ruby",
  :description => "Whether to automatically install Java with Amazon AMI Tools.",
  :required => "optional",
  :recipes => [ "aws_developer_tools:ami" ],
  :choice => [ "true", "false" ],
  :default => "true"

attribute "aws_developer_tools/deploy_key?",
  :display_name => "AWS Developer Tools install keys",
  :description => "Whether to automatically install the AWS keys.",
  :required => "optional",
  :recipes => [ "aws_developer_tools:api" ],
  :choice => [ "true", "false" ],
  :default => "false"

attribute "aws_developer_tools/aws_access_key",
  :display_name => "AWS Developer Tools access key",
  :description => "The AWS Access Key for use with AWS developer tools.",
  :required => "required"
  
attribute "aws_developer_tools/aws_secret_key",
  :display_name => "AWS Developer Tools secrete key",
  :description => "The AWS Secret Key for use with AWS developer tools.",
  :required => "required"

attribute "aws_developer_tools/ec2_tools_target",
  :display_name => "AWS Developer Tools EC2 tools target",
  :description => "The directory to install EC2 tools into.",
  :required => "optional",
  :default => "/usr/local/share/ec2_tools"
