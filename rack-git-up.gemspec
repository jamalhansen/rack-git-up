# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rack-git-up}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["rubyyot"]
  s.date = %q{2010-03-22}
  s.description = %q{Rack app to pull blobs from git and return them in the response, based on rack static}
  s.email = %q{jamal.hansen@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     ".gitmodules",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/rack-git-up.rb",
     "rack-git-up.gemspec",
     "test/helper.rb",
     "test/test_rack-git-up.rb"
  ]
  s.homepage = %q{http://github.com/rubyyot/rack-git-up}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{pulls blobs from git if they are found}
  s.test_files = [
    "test/test_rack-git-up.rb",
     "test/helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

