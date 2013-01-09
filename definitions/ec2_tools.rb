#
# Cookbook Name:: chef_ec2_cli_tools
# Definition:: ec2_tools
#

define :ec2_tools do
  filename = "ec2-#{params[:name]}-tools"
  extension = ".zip"

  package "unzip"
  
  remote_file "/tmp/#{filename + extension}" do
    source "http://s3.amazonaws.com/ec2-downloads/#{filename + extension}"
  end
  
  execute "extract ec2 tools" do
    cwd "/tmp"
    command "unzip -o ./#{filename + extension}"
  end

  execute "move ec2 tools to #{node['chef_ec2_cli_tools']['install_target']}" do
    cwd Dir["/tmp/#{filename}-*"].first
    command "mkdir -p #{node["chef_ec2_cli_tools"]["install_target"]} && mv -f * #{node["chef_ec2_cli_tools"]["install_target"]}"

    not_if { Dir["/tmp/#{filename}-*"].first.nil? }
  end

  template "/etc/profile.d/ec2_tools.sh" do
    source "ec2_tools.sh.erb"
    owner "root"
    group "root"
    mode 0755
  
    not_if { File.exists? "/etc/profile.d/ec2_tools.sh" }
  end
end
