require 'spec_helper'

describe 'aws_developer_tools::auto_scaling' do
  let(:chef_run) { runner.converge 'aws_developer_tools::auto_scaling' }

  it_behaves_like 'cli tools', 'auto_scaling'
  it_behaves_like 'aws tools', 'auto_scaling'
end
