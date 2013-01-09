require 'spec_helper'

describe 'chef_ec2_cli_tools::default' do
  let(:chef_run) { ChefSpec::ChefRunner.new.converge 'chef_ec2_cli_tools::default' }

  it "includes the ::ami recipe" do
    chef_run.should include_recipe "chef_ec2_cli_tools::ami"
  end

  it "includes the ::api recipe" do
    chef_run.should include_recipe "chef_ec2_cli_tools::api"
  end
end
