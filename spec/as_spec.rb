require 'spec_helper'

describe 'chef_ec2_cli_tools::as' do
  let(:chef_run) { runner.converge 'chef_ec2_cli_tools::as' }

  it_behaves_like 'ec2 cli tools', 'as'

  it 'sets up the aws credentials and auto scaling home dir' do
    expect(chef_run).to create_file_with_content '/usr/local/share/ec2_tools/aws_credentials',
        %Q{AWSAccessKeyId=#{runner.node['chef_ec2_cli_tools']['aws_access_key']}\nAWSSecretKey=#{runner.node['chef_ec2_cli_tools']['aws_secret_key']}\n}
    expect(chef_run).to create_file_with_content '/etc/profile.d/aws_as.sh',
        %Q{export AWS_CREDENTIAL_FILE=#{runner.node['chef_ec2_cli_tools']['install_target']}/aws_credentials\nexport AWS_AUTO_SCALING_HOME=#{runner.node['chef_ec2_cli_tools']['install_target']}\n}
  end
end
