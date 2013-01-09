#
# Cookbook Name:: chef_ec2_cli_tools
# Recipe:: api
#

ec2_tools "api"

include_recipe "java" do
  only_if { node['chef_ec2_cli_tools']['install_java?'] }
end
