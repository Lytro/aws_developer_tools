include_recipe 'chef_ruby' do
  only_if { node['aws_developer_tools']['install_ruby?'] && node['aws_developer_tools']['install_ruby?'] != 'false' }
end

cli_tools 'ami' do
  source node['aws_developer_tools']['ami']['source']
end
