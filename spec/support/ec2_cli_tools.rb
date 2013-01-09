require 'spec_helper'

shared_examples_for "ec2 cli tools" do
  it "installs unzip" do
    chef_run.should install_package 'unzip'
  end

  it "sets the EC2_HOME environment variable" do
    install_target = chef_run.node['chef_ec2_cli_tools']['install_target']

    chef_run.should create_file_with_content '/etc/profile.d/ec2_tools.sh',
                                             %Q{export EC2_HOME=#{install_target}\nexport PATH=$PATH:#{install_target}/bin\n}
    chef_run.template('/etc/profile.d/ec2_tools.sh').should be_owned_by('root', 'root')
  end
end
