require 'trollop'

$old_name_cc = "GenericRails"
$old_name_u = "generic_rails"


opts = Trollop::options do
  banner <<-EOS
Renames this project from "#{$old_name_cc}" to whatever you specify (by doing in-place name substitutions in key files).

WARNING: This does not make backups of altered files.  Thus you should probably use this on a clean repo state, so you can undo it if you mess up.

Typical usage:
  rename_generic_project.rb -c "MyProjName" -u "my_proj_name"

Arguments:
EOS
  opt :camel_case_name, "(REQUIRED) New name of project in camel-case, e.g. MyProjName", :short=>"c", :type=>:string, :required=>true
  opt :underscore_name, "(REQUIRED) New name of project with underscores, e.g. my_proj_name", :short=>"u", :type=>:string, :required=>true
  opt :force, "Ignore name format checking", :short=>"f", :type=>:bool
end


def cc_check(name)
  name.match("[A-Z]") && name.match("[a-z]") && !name.match("[_-]")
end

def u_check(name)
  !name.match("[A-Z]") && !name.match("-")
end

unless opts.force
  puts
  puts "*** Checking formats of names (use --force to skip)"

  cc_ok = cc_check(opts.camel_case_name)
  puts "Red flag: Camel-case name '#{opts.camel_case_name}' doesn't look right." unless cc_ok

  u_ok = u_check(opts.underscore_name)
  puts "Red flag: Underscore name '#{opts.underscore_name}' doesn't look right." unless u_ok

  if cc_ok and u_ok
    puts "Your names look good."
  else
    Trollop::die "Name format checks failed.  If you are sure the names are correct, run it again and use --force to skip these checks"
  end
end


$camel_case_files = [
  "app/views/layouts/application.html.erb",
  "config/application.rb",
  "config/environment.rb",
  "config/environments/development.rb",
  "config/environments/production.rb",
  "config/environments/test.rb",
  "config/initializers/secret_token.rb",
  "config/initializers/session_store.rb",
  "config/routes.rb",
  "config.ru",
  "Rakefile",
]

$underscore_files = [
  "config/initializers/session_store.rb",
]


STDOUT.sync #flush io steam after every write/print/puts

puts
puts "*** Camel-case conversion - changing '#{$old_name_cc}' to '#{opts.camel_case_name}'"
$camel_case_files.each {|f|
  print "Altering #{f}... "
  text = File.read(f)
  text.gsub!($old_name_cc, opts.camel_case_name)
  File.open(f, 'w') { |f| f.write(text) }
  puts "done."
}

puts
puts "*** Underscore conversion - changing '#{$old_name_u}' to '#{opts.underscore_name}'"
$underscore_files.each {|f|
  print "Altering #{f}... "
  text = File.read(f)
  text.gsub!($old_name_u, opts.underscore_name)
  File.open(f, 'w') { |f| f.write(text) }
  puts "done."
}

puts
puts "Renamification complete."
