require 'spec_helper'

describe 'aws_developer_tools::ec2_metadata' do
  it 'downloads the script' do
    expect(runner.converge('aws_developer_tools::ec2_metadata')).to create_remote_file '/usr/local/bin/ec2-metadata'
  end

  it 'lets you customize the install location' do
    chef_run = runner({
      aws_developer_tools: {
        ec2_metadata: {
          install_target: '/foo/bar'
        }
      }
    }).converge 'aws_developer_tools::ec2_metadata'

    expect(chef_run).to create_remote_file '/foo/bar/ec2-metadata'
  end
end
