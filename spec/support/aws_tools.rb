shared_examples_for 'aws tools' do |tool_name|
  it 'sets up the aws credentials and auto scaling home dir' do
    expect(chef_run).to create_file_with_content "#{runner.node['aws_developer_tools'][tool_name]['install_target']}/aws_credentials",
        "AWSAccessKeyId=#{runner.node['aws_developer_tools']['aws_access_key']}"

    expect(chef_run).to create_file_with_content "#{runner.node['aws_developer_tools'][tool_name]['install_target']}/aws_credentials",
        "AWSSecretKey=#{runner.node['aws_developer_tools']['aws_secret_key']}"

    expect(chef_run).to create_file_with_content "/etc/profile.d/aws_#{tool_name}.sh",
        "export AWS_CREDENTIAL_FILE=#{runner.node['aws_developer_tools']['install_target']}/aws_credentials"

    expect(chef_run).to create_file_with_content "/etc/profile.d/aws_#{tool_name}.sh",
        "export AWS_#{tool_name.upcase}_HOME=#{runner.node['aws_developer_tools'][tool_name]['install_target']}"
  end

  it 'installs java' do
    expect(chef_run).to include_recipe 'java'
  end
end
