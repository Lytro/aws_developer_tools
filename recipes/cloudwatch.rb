cli_tools 'cloudwatch' do
  source node['aws_developer_tools']['cloudwatch']['source']
end

include_recipe 'java' do
  only_if { node['aws_developer_tools']['install_java?'] }
end

template "#{node['aws_developer_tools']['install_target']}/aws_credentials" do
  mode 0755
end

template '/etc/profile.d/aws_cloudwatch.sh' do
  mode 0755
end
