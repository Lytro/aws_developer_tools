require 'spec_helper'

describe 'aws_developer_tools::ami' do
  let(:chef_run) { runner.converge 'aws_developer_tools::ami' }

  it_behaves_like 'cli tools', 'ami'
  it_behaves_like 'ec2 tools'

  it 'requires ruby' do
    expect(chef_run).to include_recipe 'chef_ruby'
  end
end
