cli_tools 'iam' do
  source node['aws_developer_tools']['iam']['source']
end

execute 'change_permissions_on_cmd_files' do
  command "chmod 444 #{node['aws_developer_tools']['iam']['install_target']}/bin/*.cmd"
end

include_recipe 'java' do
  only_if { node['aws_developer_tools']['install_java?'] }
end
