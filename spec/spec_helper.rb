require "bundler"
Bundler.setup

require "rspec"


require 'valideez/base'
require 'valideez/common'

Dir[File.expand_path(File.dirname(__FILE__) + "/../lib/**/*.rb")].each { |f| require f }