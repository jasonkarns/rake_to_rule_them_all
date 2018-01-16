# RakeToRuleThemAll

Do you use GitHub's [Scripts To Rule Them All](https://github.com/github/scripts-to-rule-them-all/) (or have a directory of scripts you execute in your Ruby project)? Wish you could just invoke them from Rake like your muscle memory expects? Now you can!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rake_to_rule_them_all'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rake_to_rule_them_all

## Usage

If you follow GitHub's [Scripts To Rule Them All](https://github.com/github/scripts-to-rule-them-all/) convention, or otherwise your scripts are in `script/`, just require the tasks in your Rakefile:

    require 'rake_to_rule_them_all/tasks'
    
This will add a rake task for each script in `script/` named the same as the script itself. Typically, it will be desireable to namespace the scripts:

    namespace :app do
      require 'rake_to_rule_them_all/tasks'
    end
    
Of course, there are some other customizations. Are you scripts in a directory other than `script/`?

    require 'rake_to_rule_them_all'
    RakeToRuleThemAll.load_tasks 'other_dir/*`
    
`RakeToRuleThemAll.load_tasks` accepts 0-or-more glob patterns, which will be supplied to `Rake::FileList`, where each matched file in the file list is expected to be a script for which a task is created. You may also pass `Rake::FileList` instances directoy, if you wish.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jasonkarns/rake_to_rule_them_all. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RakeToRuleThemAll project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jasonkarns/rake_to_rule_them_all/blob/master/CODE_OF_CONDUCT.md).
