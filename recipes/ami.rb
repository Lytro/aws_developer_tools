#
# Cookbook Name:: chef_ec2_cli_tools
# Recipe:: ami
#

ec2_tools 'ami' do
  source 'http://s3.amazonaws.com/ec2-downloads/ec2-ami-tools.zip'
end
