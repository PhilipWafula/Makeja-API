<img src="https://storage.googleapis.com/makeja_temps/makeja_temp_logo.png.png" width="40%" height="20%"></img>

[![CircleCI](https://circleci.com/gh/PhilipWafula/Makeja-API.svg?style=svg)](https://circleci.com/gh/PhilipWafula/Makeja-API)
[![Maintainability](https://api.codeclimate.com/v1/badges/9daaa0f7265e49ed9a33/maintainability)](https://codeclimate.com/github/PhilipWafula/Makeja-API/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/9daaa0f7265e49ed9a33/test_coverage)](https://codeclimate.com/github/PhilipWafula/Makeja-API/test_coverage)

# Makeja
By [SpaceMonkeys](https://github.com/space-monkeys)

Makeja a Rails API application that enables property owners to upload information about their properties
and lease them out on the platform. On the other end, it enables users to lease and manage the properties
they get on the platform. This platform creates an ecosystem that eases the process of accessing and leasing
property.


## Getting Started
To get a working development environment setup:

* Get the resource
```
$ git clone git@github.com:PhilipWafula/Makeja-API.git
```

* Configuration
```
$ cd sarafu_network
$ cp config/database.sample.yml config/database.yml
$ cp config/secrets.sample.yml config/secrets.yml
```

Open `config/database.yml` and change the username and password for the development environment to match your 
PostgreSQL setup. Open `secrets.yml` and edit the admin email and password. This is used as the initial admin,
username and password.

### Prerequisites

Makeja requires:
* Ruby 2.5.7 
* Rails 6.0.0
* PostgreSQL
* Redis


### Installing

* Prepare system

```
$ sudo apt-get update
$ sudo apt-get install build-essential curl tcl libcurl4-openssl-dev nodejs redis-server
```

* Install RVM
```
$ curl -sSL https://get.rvm.io -o rvm.sh
$ source ~/.rvm/scripts/rvm
$ rvm requirements
$ rvm install 2.5.7
$ rvm rubygems current
```

* Install bundler
```
$ gem install bundler
```

* Setup database
```
$ bundle exec rake db:setup
```

* Start server
```
$ rails s
```
* Run sidekiq workers
```
$ bundle exec sidekiq -C config/sidekiq.yml -e development
```

## Running the tests

Run entire test suite with:

```
rspec
```

Run individual tests with:

```
rspec path/to/individual_spec.rb
```

## Deployment

```ruby

```

## Built With

* [Ruby on Rails](https://rubyonrails.org/) - The web framework used

## Contributing

Please read [CONTRIBUTING](https://github.com/PhilipWafula/Makeja-API/blob/master/CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Philip Wafula** - *Initial work* - [SpaceMonkeys](https://github.com/space-monkeys)

See also the list of [contributors](https://github.com/PhilipWafula/Makeja-API/contributors) who participated in this project.

## License

This project is licensed under the GNU AFFERO GENERAL PUBLIC LICENSE License - see the [LICENSE](https://github.com/PhilipWafula/Makeja-API/blob/master/LICENSE.md) file for details

## Acknowledgments
The Makeja team appreciates the work done by the following parties as sources of inspiration for code quality, documentation or setting standards:

* **Billie Thompson** - *Documentation* - [PurpleBooth](https://github.com/PurpleBooth)

