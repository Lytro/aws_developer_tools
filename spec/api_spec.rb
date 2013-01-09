require 'spec_helper'

describe 'chef_ec2_cli_tools::api' do
  let(:chef_run) { @runner.converge 'chef_ec2_cli_tools::api' }

  it_behaves_like 'ec2 cli tools', 'api'

  it "installs java" do
    chef_run.should include_recipe 'java'
  end

  it "exports the AWS_ACCESS_KEY and AWS_SECRET_KEY" do
    chef_run.should create_file_with_content '/etc/profile.d/aws_keys.sh',
                                             "export AWS_ACCESS_KEY=#{@runner.node['chef_ec2_cli_tools']['aws_access_key']}"
    chef_run.should create_file_with_content '/etc/profile.d/aws_keys.sh',
                                             "export AWS_SECRET_KEY=#{@runner.node['chef_ec2_cli_tools']['aws_secret_key']}"
    chef_run.template('/etc/profile.d/aws_keys.sh').should be_owned_by('root', 'root')
  end
end
