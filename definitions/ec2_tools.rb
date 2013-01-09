#
# Cookbook Name:: chef_ec2_cli_tools
# Definition:: ec2_tools
#

define :ec2_tools do
  filename = "ec2-#{params[:name]}-tools.zip"

  package "unzip"
  
  remote_file "/tmp/#{filename}" do
    source "http://s3.amazonaws.com/ec2-downloads/#{filename}"
  end
  
  bash "unzip ec2-api-tools" do
    cwd "/tmp"
    code <<-EOH
      unzip -od #{node["chef_ec2_cli_tools"]["install_root"]} ./#{filename}
    EOH
  end
  
  template "/etc/profile.d/ec2_tools.sh" do
    source "ec2_tools.sh.erb"
    owner "root"
    group "root"
    mode 0755
  
    not_if { File.exists? "/etc/profile.d/ec2_tools.sh" }
  end
end
