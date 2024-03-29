# Monolith

A quick way to spin up a [Monlithic Rails](https://rubymonolith.org) application. [Rocketship](https://rocketship.io/) uses Monolith when building new SaaS applications.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ gem install rubymonolith

## Usage

Run the CLI utility to create a monolith:

    $ monolith new my-rad-project

Monolith creates a new Rails project with the dependencies needed to be productive.

## Existing Rails applications

The gem may also be installed for existing Rails applications by executing:

    $ bundle add rubymonolith

Then run the following to see the available tasks:

    $ rails generate --help

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rubymonolith/monolith.
