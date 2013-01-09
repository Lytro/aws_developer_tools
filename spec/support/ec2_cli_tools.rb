require 'spec_helper'

shared_examples_for "ec2 cli tools" do |ami_or_api|
  it "sets the EC2_HOME environment variable and adds the tools to the path" do
    chef_run.should create_file_with_content '/etc/profile.d/ec2_tools.sh',
                                             "export EC2_HOME=#{@runner.node['chef_ec2_cli_tools']['install_target']}"
    chef_run.should create_file_with_content '/etc/profile.d/ec2_tools.sh',
                                             "export PATH=$PATH:#{@runner.node['chef_ec2_cli_tools']['install_target']}/bin"
    chef_run.template('/etc/profile.d/ec2_tools.sh').should be_owned_by('root', 'root')
  end

  it "downloads the ec2 tools" do
    chef_run.should create_remote_file "/tmp/ec2-#{ami_or_api}-tools.zip"
  end
end
