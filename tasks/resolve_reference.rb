#!/usr/bin/env ruby

require_relative "../../ruby_task_helper/files/task_helper.rb"
require 'yaml'

class YAMLReference < TaskHelper
  def task(**opts)
    path = opts[:path]
    boltdir = opts[:_boltdir]
    if boltdir
      full_path = File.expand_path(path, boltdir)
    else
      boltdir = File.expand_path(path)
    end
    data = YAML.load(File.read(full_path))
    { value:  data }
  end
end

if __FILE__ == $0
  YAMLReference.run
end
