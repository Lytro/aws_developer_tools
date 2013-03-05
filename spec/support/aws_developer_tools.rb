shared_examples_for 'aws developer tools' do |tool_name|
  it 'installs unzip' do
    expect(chef_run).to install_package 'unzip'
  end

  it 'sets the EC2_HOME environment variable and adds the tools to the path' do
    expect(chef_run).to create_file_with_content '/etc/profile.d/aws_tools.sh',
                                             "export EC2_HOME=#{runner.node['aws_developer_tools']['install_target']}"
    expect(chef_run).to create_file_with_content '/etc/profile.d/aws_tools.sh',
                                             "export PATH=$PATH:#{runner.node['aws_developer_tools']['install_target']}/bin"
    expect(chef_run.template('/etc/profile.d/aws_tools.sh')).to be_owned_by('root', 'root')
  end

  it 'downloads the aws tools' do
    expect(chef_run).to create_remote_file "/tmp/#{tool_name}.zip"
  end

  it 'extracts the tools' do
    expect(chef_run).to execute_ruby_block "copy aws tools to #{runner.node['aws_developer_tools']['install_target']}"
  end
end
