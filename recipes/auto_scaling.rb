cli_tools 'auto_scaling' do
  source node['aws_developer_tools']['auto_scaling']['source']
end

include_recipe 'java' do
  only_if { node['aws_developer_tools']['install_java?'] }
end
