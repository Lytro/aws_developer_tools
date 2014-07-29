define :cli_tools, :extension => '.zip' do
  require 'fileutils'

  package 'unzip'

  remote_file "/tmp/#{params[:name] + params[:extension]}" do
    source params[:source]
    use_conditional_get !node['aws_developer_tools']['force_download?']
    use_etag true
    use_last_modified false
  end
  
  execute 'cleanup old installs' do
    cwd '/tmp'
    command "rm -rf #{params[:name]} && mkdir #{params[:name]}"
  end
  
  execute 'extract the aws tool' do
    cwd "/tmp/#{params[:name]}"
    command "unzip -o ../#{params[:name] + params[:extension]}"
  end

  ruby_block 'copy the tools to the target directory' do
    block do
      FileUtils.cd("/tmp/#{params[:name]}") do
        source = Dir['*'].detect { |file| File.directory? file }
        target = node['aws_developer_tools'][params[:name]]['install_target']

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

  if AwsDeveloperTools.type?(params[:name]) == :ec2
    template '/etc/profile.d/ec2_tools.sh' do
      mode 0755
    end
  else
    template "#{node['aws_developer_tools']['aws_tools_credentials']['location']}" do
      mode node['aws_developer_tools']['aws_tools_credentials']['permission']
    end

    template "/etc/profile.d/#{params[:name]}.sh" do
      mode 0755
    end

    template '/etc/profile.d/aws_tools.sh' do
      mode 0755
    end
  end
end
