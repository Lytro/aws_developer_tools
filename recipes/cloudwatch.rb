cli_tools 'cloudwatch' do
  source node['aws_developer_tools']['cloudwatch']['source']
end

include_recipe 'java' do
  only_if { node['aws_developer_tools']['install_java?'] }
end
