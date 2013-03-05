class AwsDeveloperTools
  def self.type?(tool_name)
    if %w(ami api).include? tool_name
      :ec2
    else
      :aws
    end
  end
end
