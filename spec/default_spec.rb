require 'spec_helper'

describe 'aws_developer_tools::default' do
  let(:chef_run) { runner.converge 'aws_developer_tools::default' }

  %w(ami api auto_scaling cloudwatch).each do |recipe|
    it "includes the #{recipe} recipe" do
      expect(chef_run).to include_recipe "aws_developer_tools::#{recipe}"
    end
  end
end
