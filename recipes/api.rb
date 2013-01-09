#
# Cookbook Name:: chef_ec2_cli_tools
# Recipe:: api
#
package "unzip"

template "/etc/profile.d/ec2_tools.sh" do
  source "ec2_tools.sh.erb"
  owner "root"
  group "root"
  mode 0755

  not_if { File.exists? "/etc/profile.d/ec2_tools.sh" }
end
