require 'spec_helper'

describe 'aws_developer_tools::aws_ha_release' do
  let(:chef_run) { runner.converge 'aws_developer_tools::aws_ha_release' }

  it 'includes the auto scaling and elb recipes' do
    expect(chef_run).to include_recipe 'aws_developer_tools::auto_scaling'
    expect(chef_run).to include_recipe 'aws_developer_tools::elb'
  end

  it 'downloads the script' do
    expect(chef_run).to create_remote_file '/usr/local/share/aws_tools/auto_scaling/bin/aws-ha-release.sh'
  end
end
