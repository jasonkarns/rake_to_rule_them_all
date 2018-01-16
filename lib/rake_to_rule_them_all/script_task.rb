require 'rake'
require 'rake/tasklib'
require 'rake/dsl_definition'

module RakeToRuleThemAll
  class ScriptTask < Rake::TaskLib
    include Rake::DSL

    attr_reader :script
    attr_accessor :script_opts

    def initialize(script, &task_block)
      @script = script
      @script_opts = []
      define(task_block)
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

    def define(task_block)
      desc description
      task name do |_, task_args|
        call task_block, task_args
        sh debug, script, *script_opts
      end
    end

    def call(task_block, task_args)
      task_block.call(self, task_args) if task_block
    end

    def debug
      Rake.application.options.trace ? "DEBUG=1" : ""
    end
  end
end
