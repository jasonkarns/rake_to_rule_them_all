
SCRIPTS = FileList['script/*']
SCRIPTS.each do |script|
  name = script.pathmap('%n')

  desc File.new(script).each_line
    .take_while { |line| line =~ /^(#|$)/ }
    .map { |line| line[/^# (.*)$/, 1] }
    .join("\n")

  task name do
    sh script
  end
end
