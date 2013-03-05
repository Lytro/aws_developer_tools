require 'spec_helper'

describe 'aws_developer_tools::auto_scaling' do
  let(:chef_run) { runner.converge 'aws_developer_tools::auto_scaling' }

  it_behaves_like 'aws developer tools', 'auto_scaling'
  it_behaves_like 'it uses aws credentials', 'auto_scaling'
end
