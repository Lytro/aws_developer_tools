require 'spec_helper'

describe 'chef_ec2_cli_tools::api' do
  let(:chef_run) { ChefSpec::ChefRunner.new.converge 'chef_ec2_cli_tools::api' }

  it_behaves_like 'ec2 cli tools', 'api'
end
