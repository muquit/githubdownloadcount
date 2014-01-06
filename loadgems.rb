#!/usr/bin/env ruby 

# load all pure ruyby gems from libs directory
$: << File.expand_path(File.dirname(__FILE__))

# programatically add gems from ./lib
path = File.expand_path(__FILE__)
dir = File.dirname(path) + "/libs"
dirs = Dir.entries(dir)
dirs.each do |d|
  next if d == "."
  next if d == ".."
  gem_dir = dir + "/" + d + "/lib"

  if File.directory?(gem_dir)
    $:.unshift gem_dir
  end
end

if __FILE__ == $0
  puts $:
  puts "Libraries loaded"
end
