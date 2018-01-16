require 'rake/file_list'
require 'rake_to_rule_them_all/script_task'

module RakeToRuleThemAll
  DEFAULT_PATTERN = 'script/*'

  module_function

  def define
    Rake::FileList[DEFAULT_PATTERN].each do |script|
      ScriptTask.new script
    end
  end
end
