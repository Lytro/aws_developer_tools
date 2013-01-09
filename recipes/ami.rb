#
# Cookbook Name:: chef_ec2_cli_tools
# Recipe:: ami
#
package "unzip"

remote_file "/tmp/ec2-ami-tools.zip" do
  source "http://s3.amazonaws.com/ec2-downloads/ec2-ami-tools.zip"
end

bash "unzip ec2-ami-tools" do
  cwd "/tmp"
  code <<-EOH
    unzip -od #{node["chef_ec2_cli_tools"]["install_root"]} ./ec2-ami-tools.zip
  EOH
end

template "/etc/profile.d/ec2_tools.sh" do
  source "ec2_tools.sh.erb"
  owner "root"
  group "root"
  mode 0755

  not_if { File.exists? "/etc/profile.d/ec2_tools.sh" }
end