require 'spec_helper'

describe 'aws_developer_tools::iam' do
  let(:chef_run) { runner.converge 'aws_developer_tools::iam' }

  it_behaves_like 'cli tools', 'iam'
  it_behaves_like 'aws tools', 'iam'
end
