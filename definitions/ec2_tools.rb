define :ec2_tools, :extension => '.zip' do
  require 'fileutils'

  package 'unzip'

  remote_file "/tmp/#{params[:name] + params[:extension]}" do
    source params[:source]
  end
  
  execute 'cleanup old installs and extract ec2 tools' do
    cwd '/tmp'
    command "rm -rf #{params[:name]} && mkdir #{params[:name]} && mv #{params[:name] + params[:extension]} #{params[:name]}/ && cd #{params[:name]} && unzip -o ./#{params[:name] + params[:extension]}"
  end

  ruby_block "copy ec2 tools to #{node['chef_ec2_cli_tools']['install_target']}" do
    block do
      FileUtils.cd("/tmp/#{params[:name]}") do
        source = Dir['*'].detect { |file| File.directory? file }
        target = node['chef_ec2_cli_tools']['install_target']

        Chef::Log.info "Checking for tools in #{source}"

        if source
          FileUtils.mkdir_p target

          FileUtils.cd(source) do
            Chef::Log.info "Attempting to copy files from #{FileUtils.pwd}"

            FileUtils.cp_r('.', target)
          end
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
