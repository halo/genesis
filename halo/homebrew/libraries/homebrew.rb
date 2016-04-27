require 'pathname'

module Homebrew
  @@node = nil

  def self.node=(new_node)
    @@node = new_node
  end

  def self.path
    Pathname.new @@node[:homebrew][:root]
  end

  def self.bin_path
    path.join 'bin'
  end

  def self.sbin_path
    path.join 'sbin'
  end

  def self.etc_path
    path.join 'etc'
  end

  def self.var_path
    path.join 'var'
  end

  def self.cellar_path
    path.join 'Cellar'
  end

  def self.executable_path
    bin_path.join 'brew'
  end
end
