shared_examples_for 'aws tools' do |tool_name|
  it 'sets up the aws credentials and home dir' do
    expect(chef_run).to create_file_with_content '/usr/local/share/aws_tools/credentials',
                                                 'AWSAccessKeyId=Your Access Key'

    expect(chef_run).to create_file_with_content '/usr/local/share/aws_tools/credentials',
                                                 'AWSSecretKey=Your Secret Key'

    expect(chef_run).to create_file_with_content '/etc/profile.d/aws_tools.sh',
                                                 'export AWS_CREDENTIAL_FILE=/usr/local/share/aws_tools/credentials'

    expect(chef_run).to create_file_with_content "/etc/profile.d/#{tool_name}.sh",
                                                 "export AWS_#{tool_name.upcase}_HOME=/usr/local/share/aws_tools/#{tool_name}"
  end

  it 'installs java' do
    expect(chef_run).to include_recipe 'java'
  end

  it 'adds the tools to the path' do
    expect(chef_run).to create_file_with_content "/etc/profile.d/#{tool_name}.sh",
                                                 "export PATH=$PATH:/usr/local/share/aws_tools/#{tool_name}/bin"
  end
end
