include_recipe 'chef_ruby' unless (!node['aws_developer_tools']['install_ruby?'] || node['aws_developer_tools']['install_ruby?'] == 'false')

cli_tools 'ami' do
  source node['aws_developer_tools']['ami']['source']
end
