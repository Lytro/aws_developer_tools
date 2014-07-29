include_recipe 'java' do
  only_if { node['aws_developer_tools']['install_java?'] }
end

cli_tools 'rds' do
  source node['aws_developer_tools']['rds']['source']
end
