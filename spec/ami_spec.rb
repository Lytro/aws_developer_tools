require 'spec_helper'

describe 'aws_developer_tools::ami' do
  let(:chef_run) { runner.converge 'aws_developer_tools::ami' }

  it_behaves_like 'aws developer tools', 'ami'
end
