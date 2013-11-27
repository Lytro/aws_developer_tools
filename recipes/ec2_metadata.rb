remote_file "#{node['aws_developer_tools']['ec2_metadata']['install_target']}/ec2-metadata" do
  source 'http://s3.amazonaws.com/ec2metadata/ec2-metadata'
  checksum node['aws_developer_tools']['ec2_metadata']['checksum']
end
