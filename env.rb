require "yaml"
require "open3"
# require "bundler"
# Bundler.require :default

PATH = File.expand_path "../", __FILE__

DIR = Dir.pwd

HOME_DIR = ENV["HOME"]
raise "Error - ENV HOME not exported - HOME=#{HOME_DIR.inspect}" if !HOME_DIR || HOME_DIR.empty?

RUN_ID = "" # TODO: detect run id

require_relative "config/config"
require_relative "lib/monkeypatches"
require_relative "lib/manager"
require_relative "lib/manager_local"
require_relative "lib/manager_ssh"
require_relative "stylegan3_manager"
