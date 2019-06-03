require 'pathname'

module Workdir
  def self.path
    Pathname.new('~/.managed').expand_path
  end
end
