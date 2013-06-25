cli_tools 'api' do
  source node['aws_developer_tools']['api']['source']
end

include_recipe 'java' do
  only_if { node['aws_developer_tools']['install_java?'] }
end

template '/etc/profile.d/aws_keys.sh' do
  source 'aws_keys.sh.erb'
  owner 'root'
  group 'root'
  mode 0755
  only_if { node['aws_developer_tools']['deploy_key?'] }
end
