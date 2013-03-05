shared_examples_for 'cli tools' do |tool_name|
  it 'installs unzip' do
    expect(chef_run).to install_package 'unzip'
  end

  it 'downloads the tools' do
    expect(chef_run).to create_remote_file "/tmp/#{tool_name}.zip"
  end

  it 'extracts the tools' do
    expect(chef_run).to execute_ruby_block "copy aws tools to #{runner.node['aws_developer_tools']['install_target']}"
  end
end
