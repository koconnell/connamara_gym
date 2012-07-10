This is to be a iteration-0 ready generic Rails project.
When complete, you should be able to create a fork, 
change some details, and have a fully-ready rails app to
start hacking on.

Going by what was successful in previous works, this project is using JRuby, Tomcat, and Postgres.

What you need
=============

* JRuby running in 1.9 mode.  You can do this in various ways:
  * `rvm install jruby --1.9` when you install JRuby is probably the easiest way
  * You can set `JRUBY_OPTS=--1.9` in your environment
  * You can set `compat.version=1.9` in your ~/.jrubyrc file
  * JRuby 1.7 is set to 1.9 by default
* sqlite3, which is used for development mode

**Note:** On Linux, we've had some "stack level too deep" errors when running Rake on JRuby 1.6.7.  Upgrading to 1.6.7**.2** fixed them.

Setup
=====

Gems:

* `gem install bundler` if not already installed
* `bundle install`

Rename the project (because you don't want it to be GenericRails):

* `rename_generic_project.rb -c "MyProjName" -u "my_proj_name"`
  * You can delete this script from your forked repo after this.

Create the database:

* `rake db:migrate`

To run tests
================
* `bundle exec rake test:units` for unit tests (in test/unit)
* `bundle exec rake spec` for rspec tests (in spec/)

To run the server
=================
* `bundle exec rails server`
* Point your browser at http://localhost:3000
