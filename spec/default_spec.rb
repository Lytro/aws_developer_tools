require 'spec_helper'

describe 'chef_ec2_cli_tools::default' do
  let(:chef_run) { runner.converge 'chef_ec2_cli_tools::default' }

  %w(ami api as).each do |recipe|
    it "includes the #{recipe} recipe" do
      expect(chef_run).to include_recipe "chef_ec2_cli_tools::#{recipe}"
    end
  end
end
