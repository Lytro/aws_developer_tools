require 'spec_helper'

describe 'chef_ec2_cli_tools::api' do
  let(:chef_run) { ChefSpec::ChefRunner.new.converge 'chef_ec2_cli_tools::api' }

  it_behaves_like "ec2 cli tools"

  it "downloads ec2-api-tools.zip" do
    chef_run.should create_remote_file "/tmp/ec2-api-tools.zip"
  end
end
