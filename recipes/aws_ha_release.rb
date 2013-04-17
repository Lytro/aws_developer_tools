include_recipe 'aws_developer_tools::auto_scaling'
include_recipe 'aws_developer_tools::elb'

remote_file "#{node['aws_developer_tools']['auto_scaling']['install_target']}/bin/aws-ha-release.sh" do
  source 'https://raw.github.com/Lytro/aws-missing-tools/suspend_certain_processes/aws-ha-release/aws-ha-release.sh'
  mode 0755
end
