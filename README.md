# Microservice for accounting mad scientists and their awesome inventions

This project is an implementation of microservice for test exam on back-end
ruby developer position. It provides CRUD operations on records of 
mad scientists and their inventions. The following technologies are used:

*   [PostgreSQL](https://www.postgresql.org/) as RDBMS;
*   [Ruby](https://www.ruby-lang.org/en/) as main programming language;
*   [Puma](https://github.com/puma/puma) as HTTP-server;
*   [Sinatra](https://github.com/sinatra/sinatra) as DSL for REST API
    definitions;
*   [Sequel](https://github.com/jeremyevans/sequel) as ORM;
*   [RSpec](https://github.com/rspec/rspec) as DSL for tests;
*   and also some other awesome libraries which names can be found in `Gemfile`
    of the project.

## Usage

Although it's not required, it's highly recommended to use the project in a
virtual machine. The project provides `Vagrantfile` to automatically deploy and
provision virtual machine with use of [VirtualBox](https://www.virtualbox.org/)
and [vagrant](https://www.vagrantup.com/) tool. One can use `vagrant up` in the
root directory of the cloned project to launch virtual machine and `vagrant
ssh` to enter it after boot. To run the script, which will install gems listed 
in *Gemfile*, create *testdb* and run a migrations, uncomment 40th line in 
*Vagrantfile* 