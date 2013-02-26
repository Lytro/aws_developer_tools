require 'spec_helper'

describe 'chef_ec2_cli_tools::default' do
  let(:chef_run) { runner.converge 'chef_ec2_cli_tools::default' }

  it "includes the ::ami recipe" do
    expect(chef_run).to include_recipe "chef_ec2_cli_tools::ami"
  end

  it "includes the ::api recipe" do
    expect(chef_run).to include_recipe "chef_ec2_cli_tools::api"
  end
end
