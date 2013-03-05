shared_examples_for 'ec2 tools' do
  it 'sets the EC2_HOME environment variable and adds the tools to the path' do
    expect(chef_run).to create_file_with_content '/etc/profile.d/ec2_tools.sh',
                                             "export EC2_HOME=#{runner.node['aws_developer_tools']['install_target']}"
    expect(chef_run).to create_file_with_content '/etc/profile.d/ec2_tools.sh',
                                             "export PATH=$PATH:#{runner.node['aws_developer_tools']['install_target']}/bin"
  end
end
