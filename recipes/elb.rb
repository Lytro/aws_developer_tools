include_recipe 'java' do
  only_if { node['aws_developer_tools']['install_java?'] }
end

cli_tools 'elb' do
  source node['aws_developer_tools']['elb']['source']
end
