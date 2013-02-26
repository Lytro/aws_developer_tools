#
# Cookbook Name:: chef_ec2_cli_tools
# Definition:: ec2_tools
#

define :ec2_tools, :extension => '.zip' do
  require 'fileutils'

  package 'unzip'

  remote_file "/tmp/#{params[:name] + params[:extension]}" do
    source params[:source]
  end
  
  execute 'extract ec2 tools' do
    cwd '/tmp'
    command "unzip -o ./#{params[:name] + params[:extension]}"
  end

  ruby_block "copy ec2 tools to #{node['chef_ec2_cli_tools']['install_target']}" do
    block do
      source = Dir["/tmp/#{params[:name]}"]
      target = node['chef_ec2_cli_tools']['install_target']

      Chef::Log.info "Checking for tools in #{source}"

      unless source.empty?
        FileUtils.mkdir_p target

        FileUtils.cd(source.first) do
          Chef::Log.info "Attempting to copy files from #{FileUtils.pwd}"

          FileUtils.cp_r('.', target)
        end
      end
    end
  end

  template '/etc/profile.d/ec2_tools.sh' do
    source 'ec2_tools.sh.erb'
    owner 'root'
    group 'root'
    mode 0755

    not_if { File.exists? '/etc/profile.d/ec2_tools.sh' }
  end
end
