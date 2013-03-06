shared_examples_for 'ec2 tools' do
  it 'sets the EC2_HOME environment variable and adds the tools to the path' do
    expect(chef_run).to create_file_with_content '/etc/profile.d/ec2_tools.sh',
                                                 'export EC2_HOME=/usr/local/share/ec2_tools'

    expect(chef_run).to create_file_with_content '/etc/profile.d/ec2_tools.sh',
                                                 'export PATH=$PATH:/usr/local/share/ec2_tools/bin'
  end
end
