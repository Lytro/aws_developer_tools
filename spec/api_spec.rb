require 'spec_helper'

describe 'aws_developer_tools::api' do
  let(:chef_run) { runner.converge 'aws_developer_tools::api' }

  it_behaves_like 'cli tools', 'api'
  it_behaves_like 'ec2 tools'

  it 'installs java' do
    expect(chef_run).to include_recipe 'java'
  end

  it 'exports the AWS_ACCESS_KEY and AWS_SECRET_KEY' do
    expect(chef_run).to create_file_with_content '/etc/profile.d/aws_keys.sh',
                                                 'export AWS_ACCESS_KEY=Your Access Key'
    expect(chef_run).to create_file_with_content '/etc/profile.d/aws_keys.sh',
                                                 'export AWS_SECRET_KEY=Your Secret Key'

    expect(chef_run.template('/etc/profile.d/aws_keys.sh')).to be_owned_by('root', 'root')
  end
end
