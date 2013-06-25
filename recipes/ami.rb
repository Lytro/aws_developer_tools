if node['aws_developer_tools']['install_ruby?']
   include_recipe 'chef_ruby'
end

cli_tools 'ami' do
  source node['aws_developer_tools']['ami']['source']
end
