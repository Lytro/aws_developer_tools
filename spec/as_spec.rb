require 'spec_helper'

describe 'chef_ec2_cli_tools::as' do
  let(:chef_run) { runner.converge 'chef_ec2_cli_tools::as' }

  it_behaves_like 'ec2 cli tools', 'as'

  it 'sets up the aws credentials and auto scaling home dir' do
    expect(chef_run).to create_file_with_content '/usr/local/share/ec2_tools/aws_credentials', %Q{AWSAccessKeyId=$AWS_ACCESS_KEY\nAWSSecretKey=$AWS_SECRET_KEY\n}
    expect(chef_run).to create_file_with_content '/etc/profile.d/aws_as.sh', %Q{export AWS_CREDENTIAL_FILE=$EC2_HOME/aws_credentials\nexport AWS_AUTO_SCALING_HOME=$EC2_HOME\n}
  end
end
