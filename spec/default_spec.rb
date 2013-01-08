require 'chefspec'

describe 'chef_ec2_cli_tools::default' do
  let(:chef_run) { ChefSpec::ChefRunner.new.converge 'chef_ec2_cli_tools::default' }

  it "does something" do
    pending "Write some specs!"
  end
end
