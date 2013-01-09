#
# Cookbook Name:: chef_ec2_cli_tools
# Definition:: ec2_tools
#

define :ec2_tools do
  filename = "ec2-#{params[:name]}-tools.zip"

  remote_file "/tmp/#{filename}" do
    source "http://s3.amazonaws.com/ec2-downloads/#{filename}"
  end
  
  bash "extract ec2 tools" do
    cwd "/tmp"
    code <<-EOH
      tar -xf ./#{filename} -C #{node["chef_ec2_cli_tools"]["install_root"]} --strip 1
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
