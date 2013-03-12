require 'spec_helper'

describe 'aws_developer_tools::elb' do
  let(:chef_run) { runner.converge 'aws_developer_tools::elb' }

  it_behaves_like 'cli tools', 'elb'
  it_behaves_like 'aws tools', 'elb'
end
