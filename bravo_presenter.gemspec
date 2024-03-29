$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bravo_presenter/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bravo_presenter"
  s.version     = BravoPresenter::VERSION
  s.authors     = ["Your name"]
  s.email       = ["bravolimauk@gmail.com"]
  s.summary     = "Rails presenter"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  #s.add_dependency "rails", "~> 3.1.3"
  #s.add_development_dependency "sqlite3"
end
