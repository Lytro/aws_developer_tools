require 'chefspec'

Dir["./spec/support/**/*.rb"].sort.each {|f| require f}

RSpec.configure do |config|
  config.before(:each) do
    @runner = ChefSpec::ChefRunner.new

    Chef::Recipe.any_instance.stub(:load_recipe).and_return do |arg|
      @runner.node.run_state[:seen_recipes][arg] = true
    end
  end
end
