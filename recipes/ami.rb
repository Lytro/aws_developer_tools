#
# Cookbook Name:: chef_ec2_cli_tools
# Recipe:: ami
#

ec2_tools 'ami' do
  source node['chef_ec2_cli_tools']['ami_source']
end
