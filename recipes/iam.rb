cli_tools 'iam' do
  source node['aws_developer_tools']['iam']['source']
end

include_recipe 'java' do
  only_if { node['aws_developer_tools']['install_java?'] }
end
