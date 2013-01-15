#
# Cookbook Name:: chef_ec2_cli_tools
# Definition:: ec2_tools
#

define :ec2_tools do
  require 'fileutils'

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

  ruby_block "copy ec2 tools to #{node['chef_ec2_cli_tools']['install_target']}" do
    block do
      filename = "ec2-#{params[:name]}-tools" # Chef ruby_blocks do not retain variables assigned outside of the block
      source = Dir["/tmp/#{filename}-*"]
      target = node["chef_ec2_cli_tools"]["install_target"]

      Chef::Log.info "Checking for tools in #{source}"

      unless source.empty?
        FileUtils.mkdir_p target

        FileUtils.cd(source.first) do
          Chef::Log.info "Attempting to copy files from #{FileUtils.pwd}"

          FileUtils.cp_r(".", target)
        end
      end
    end
  end

  template "/etc/profile.d/ec2_tools.sh" do
    source "ec2_tools.sh.erb"
    owner "root"
    group "root"
    mode 0755
  
    not_if { File.exists? "/etc/profile.d/ec2_tools.sh" }
  end
end
