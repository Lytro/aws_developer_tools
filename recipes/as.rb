aws_tools 'as' do
  source node['aws_developer_tools']['as_source']
end

include_recipe 'java' do
  only_if { node['aws_developer_tools']['install_java?'] }
end

template "#{node['aws_developer_tools']['install_target']}/aws_credentials" do
  mode 0755
end

template '/etc/profile.d/aws_as.sh' do
  mode 0755
end
