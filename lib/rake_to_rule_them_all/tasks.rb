require 'rake'
require 'rake/tasklib'

module RakeToRuleThemAll
  class RakeTask < ::Rake::TaskLib
    include ::Rake::DSL if defined?(::Rake::DSL)

    attr_reader :script

    def initialize(script)
      @script = script
      define
    end

    def name
      File.basename script
    end

    def description
      File.new(script).each_line
        .take_while { |line| line =~ /^(#|$)/ }
        .map { |line| line[/^# (.*)$/, 1] }
        .join("\n")
    end

    private

    def define
      desc description
      task name do
        sh script
      end
    end

  end
end

SCRIPTS = FileList['script/*']
SCRIPTS.each do |script|
  RakeToRuleThemAll::RakeTask.new script
end
