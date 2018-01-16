require 'rake/file_list'
require 'rake_to_rule_them_all/script_task'

module RakeToRuleThemAll
  DEFAULT_PATTERN = 'script/*'

  module_function

  # Takes a Rake::FileList or 0-to-many patterns
  # Defaults to 'script/*'
  def load_tasks(*args, &task_block)
    file_list_from(args).each do |script|
      ScriptTask.new script, &task_block
    end
  end

  private

  def self.file_list_from(args)
    args.push DEFAULT_PATTERN if args.empty?
    Rake::FileList[*args]
  end
end
