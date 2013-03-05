require 'spec_helper'

describe 'aws_developer_tools::auto_scaling' do
  let(:chef_run) { runner.converge 'aws_developer_tools::auto_scaling' }

  it_behaves_like 'aws developer tools', 'auto_scaling'

  it 'sets up the aws credentials and auto scaling home dir' do
    expect(chef_run).to create_file_with_content '/usr/local/share/aws_tools/aws_credentials',
        %Q{AWSAccessKeyId=#{runner.node['aws_developer_tools']['aws_access_key']}\nAWSSecretKey=#{runner.node['aws_developer_tools']['aws_secret_key']}\n}
    expect(chef_run).to create_file_with_content '/etc/profile.d/aws_auto_scaling.sh',
        %Q{export AWS_CREDENTIAL_FILE=#{runner.node['aws_developer_tools']['install_target']}/aws_credentials\nexport AWS_AUTO_SCALING_HOME=#{runner.node['aws_developer_tools']['install_target']}\n}
  end

  it 'installs java' do
    expect(chef_run).to include_recipe 'java'
  end
end
