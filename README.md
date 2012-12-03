This is an iteration-0-ready generic Rails project.
You can create a fork, change some details, and have a fully-ready rails app to
start writing tests and code for.

You can even copy this project's Jenkins configuration, giving you a fully-functional
build-test server before you even start writing code.

Going by what was successful in previous projects, this project is using JRuby, Tomcat, and Postgres.

What you need
=============

* JRuby running in 1.9 mode.  You can do this in various ways:
  * `rvm install jruby --1.9` when you install JRuby is probably the easiest way
  * You can set `JRUBY_OPTS=--1.9` in your environment
  * You can set `compat.version=1.9` in your ~/.jrubyrc file
  * JRuby 1.7 is set to 1.9 by default
* postgres

**Note:** On Linux, we've had some "stack level too deep" errors when running Rake on JRuby 1.6.7.  Upgrading to 1.6.7**.2** fixed them.

### NOTE: We don't use SQLite

Using SQLite for development is not recommended, and thus this project does not support it.  Among the reasons:

* SQLite treats booleans differently, which can cause your code to act differently than with Postgres
* SQLite [doesn't allow you to delete/modify columns](http://www.sqlite.org/faq.html#q11) in a table
* There isn't really any good reason to use a different DB in dev than production
* Postgres isn't that hard to install! [(Mac help)](http://blog.private.connamara.com/2012/11/13/installing-postgresql-on-a-mac/) [(Jenkins help)](http://wiki.private.connamara.com/index.php?title=Jenkins#Shortcuts_for_upgrading_postgresql)


Set up and operation
====================

First thing:

* `rvm jruby`

Setup:

* `gem install bundler` if not already installed
* `bundle install`
* `bundle exec rake db:create` to create db
* `bundle exec rake db:migrate` to format db tables

Run tests:

* `bundle exec rake test:units` for unit tests (in test/unit)
* `bundle exec rake spec` for rspec tests (in spec/)
* `bundle exec cucumber` for cucumber tests

Run the web server:

* `bundle exec rails server`
* Point your browser at http://localhost:3000


Fork the project into a new Connamara Github repo
=================================================

Certainly you can fork into your personal Github account, but that's
not really appropriate for a customer project.  We want it under Connamara's
account, but Github doesn't really let us do a Connamara-to-Connamara fork.

* Have an admin create your new Connamara repo on Github (here we'll call it `new_rails_proj`)
* On your local dev machine:
  * `git clone git@github.com/connamara/generic_rails.git`
  * `cd generic_rails`
  * `git remote add foo git@github.com:connamara/new_rails_proj.git`
  * `git push foo master`
* Congratulations, your new repo is now a clone of GenericRails.  Confirm by having a look at Github.  Now you need to clean up our local repo, which still points its origin to GenericRails.
  * `cd ..`
  * `rm -Rf generic_rails` (yep, just blow it all away)
  * `git clone git@github.com/connamara/new_rails_proj.git`
* One more thing -- Rails still thinks your project is called "GenericRails".  Let's rename it:
  * `rename_generic_project.rb -c "NewRailsProj" -u "new_rails_proj"`
  * (You can delete that script from your new repo now.  You won't need it again.)

You're ready to start hacking!  But first, you should probably set up a Jenkins for your new project.


Set up a Jenkins builder
============================

* Make sure the "buildbot" user has access to your new repo (ask an admin)
* Go to http://jenkins.connamara.com
* On the left, click "New Job"
  * Select "Copy existing job", enter "generic_rails" in the "Copy from" field
  * Click "OK"
* In the configuration page for your new builder:
  * Change the GitHub project URL (near the top)
  * Change the Repository URL (under "Source Code Management")
  * Change the email recipients
  * Click "Save"

Force a build to make sure it works.
