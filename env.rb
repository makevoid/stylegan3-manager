require "yaml"
require "open3"
# require "bundler"
# Bundler.require :default

PATH = File.expand_path "../", __FILE__

require_relative "config/config"
require_relative "lib/monkeypatches"
require_relative "lib/manager"

require_relative "stylegan3_manager"
