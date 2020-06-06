# ActiveAdmin::History

ActiveAdmin::History maintains a list of `create`, `update`, and `destroy` actions performed by AdminUsers in the ActiveAdmin interface. The account performing the action is logged, the parameters are stored, and a set of diffs is produced (in the case of an `update`).

If you would prefer to log all changes to a record instead of just the ones performed in ActiveAdmin, we recommend [PaperTrail](https://github.com/paper-trail-gem/paper_trail) which operates on the models themselves rather than on ActiveAdmin controllers.

This gem is in very early alpha and will likely change significantly. Right now it works well on a default installation of Rails 6 and ActiveAdmin. Feel free to open issues for any problems you find and suggestions for improvements are always welcome.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activeadmin-history'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install activeadmin-history

## Usage

Run the installer from the Rails project to create the needed files, then migrate.

    rails generate active_admin:history:install
    rails db:migrate

Include in any ActiveAdmin register file that you want to monitor.

    ActiveAdmin.register Task do
      include ActiveAdmin::History
  
      permit_params :name, :completed
    end


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/danielsellergren/activeadmin-history. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/danielsellergren/activeadmin-history/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ActiveAdmin::History project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/danielsellergren/activeadmin-history/blob/master/CODE_OF_CONDUCT.md).
