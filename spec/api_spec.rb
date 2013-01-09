require 'spec_helper'

describe 'chef_ec2_cli_tools::api' do
  let(:chef_run) { @runner.converge 'chef_ec2_cli_tools::api' }

  it_behaves_like 'ec2 cli tools', 'api'

  it "installs java" do
    chef_run.should include_recipe 'java'
  end
end
