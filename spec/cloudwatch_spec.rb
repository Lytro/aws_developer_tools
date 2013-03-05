require 'spec_helper'

describe 'aws_developer_tools::cloudwatch' do
  let(:chef_run) { runner.converge 'aws_developer_tools::cloudwatch' }

  it_behaves_like 'aws developer tools', 'cloudwatch'
  it_behaves_like 'it uses aws credentials', 'cloudwatch'
end
