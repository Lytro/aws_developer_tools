default['aws_developer_tools']['install_java?'] = true
default['aws_developer_tools']['install_ruby?'] = true
default['aws_developer_tools']['deploy_key?']  = false

default['aws_developer_tools']['aws_access_key'] = 'Your Access Key'
default['aws_developer_tools']['aws_secret_key'] = 'Your Secret Key'

## EC2 Tools ##
default['aws_developer_tools']['ec2_tools_target'] = '/usr/local/share/ec2_tools'

default['aws_developer_tools']['api']['source'] = 'http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip'
default['aws_developer_tools']['api']['install_target'] = default['aws_developer_tools']['ec2_tools_target']

default['aws_developer_tools']['ami']['source'] = 'http://s3.amazonaws.com/ec2-downloads/ec2-ami-tools.zip'
default['aws_developer_tools']['ami']['install_target'] = default['aws_developer_tools']['ec2_tools_target']
###############

## AWS Tools ##
default['aws_developer_tools']['aws_tools_target'] = '/usr/local/share/aws_tools'

default['aws_developer_tools']['auto_scaling']['source'] = 'http://ec2-downloads.s3.amazonaws.com/AutoScaling-2011-01-01.zip'
default['aws_developer_tools']['auto_scaling']['install_target'] = "#{default['aws_developer_tools']['aws_tools_target']}/auto_scaling"

default['aws_developer_tools']['elb']['source'] = 'http://ec2-downloads.s3.amazonaws.com/ElasticLoadBalancing.zip'
default['aws_developer_tools']['elb']['install_target'] = "#{default['aws_developer_tools']['aws_tools_target']}/elb"

default['aws_developer_tools']['cloudwatch']['source'] = 'http://ec2-downloads.s3.amazonaws.com/CloudWatch-2010-08-01.zip'
default['aws_developer_tools']['cloudwatch']['install_target'] = "#{default['aws_developer_tools']['aws_tools_target']}/cloudwatch"
###############
