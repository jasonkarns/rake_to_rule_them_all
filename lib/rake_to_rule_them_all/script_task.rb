require 'rake/tasklib'
require 'rake/dsl_definition'

module RakeToRuleThemAll
  class ScriptTask < Rake::TaskLib
    include Rake::DSL

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
        #TODO enable debug mode when trace
        #Rake.application.options.trace == true
        sh script
      end
    end

  end
end
