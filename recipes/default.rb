#
# Cookbook Name:: chef_ec2_cli_tools
# Recipe:: default
#

include_recipe 'chef_ec2_cli_tools::ami'
include_recipe 'chef_ec2_cli_tools::api'
include_recipe 'chef_ec2_cli_tools::as'
