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
* sqlite3 for development environment
* postgres for postgres\_test environment

**Note:** On Linux, we've had some "stack level too deep" errors when running Rake on JRuby 1.6.7.  Upgrading to 1.6.7**.2** fixed them.


Set up and operation
====================

To use sqlite3: no action needed.  
To use postgres: set `RAILS_ENV=postgres_test` in your shell environment.

Setup:

* `gem install bundler` if not already installed
* `bundle install`
* `bundle exec rake db:create` to create db
* `bundle exec rake db:migrate` to format db tables

Run tests:

* `bundle exec rake test:units` for unit tests (in test/unit)
* `bundle exec rake spec` for rspec tests (in spec/)

Run the web server:

* `bundle exec rails server`
* Point your browser at http://localhost:3000


Fork the project into a new Connamara Github repo
=================================================

Certainly you can fork into your personal Github account, but that's
not really appropriate for a customer project.  We want it under Connamara's
account, but Github doesn't really let us do a Connamara-to-Connamara fork.

* Create your new Connamara repo on Github (here we'll call it `new_rails_proj`)
* On your local dev machine:
  * `git clone git@github.com/connamara/generic_rails.git`
  * `cd generic_rails`
  * `git remote add foo git@github.com:connamara/new_rails_proj.git`
  * `git push foo master`
* Congratulations, your new repo is now a clone of GenericRails.  Confirm by having a look at Github.  Now you need to clean up our local repo, which still points its origin to GenericRails.
  * `cd ..`
  * `rm -Rf generic_rails` (yep, just blow it all away)
  * `git clone git@github.com/connamara/new_rails_proj.git`

But wait, one more thing: Rails still thinks your project is called "GenericRails".  Let's rename it:

* `rename_generic_project.rb -c "NewRailsProj" -u "new_rails_proj"`

Now you're good to go.
