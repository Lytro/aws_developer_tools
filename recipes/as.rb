ec2_tools 'as' do
  source 'http://ec2-downloads.s3.amazonaws.com/AutoScaling-2011-01-01.zip'
end

include_recipe 'java' do
  only_if { node['chef_ec2_cli_tools']['install_java?'] }
end

cookbook_file "#{node['chef_ec2_cli_tools']['install_target']}/aws_credentials"
cookbook_file '/etc/profile.d/aws_as.sh'
