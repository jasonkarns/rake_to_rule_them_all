require 'rake_to_rule_them_all/task'

module RakeToRuleThemAll
  PATTERN = 'script/*'

  module_function

  def define
    FileList[PATTERN].each do |script|
      RakeTask.new script
    end
  end
end
