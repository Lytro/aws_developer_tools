include_recipe 'chef_ruby' do
  only_if { node['aws_developer_tools']['install_ruby?'] }
end

aws_tools 'ami' do
  source node['aws_developer_tools']['ami']['source']
end
