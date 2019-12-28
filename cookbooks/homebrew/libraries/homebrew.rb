require 'pathname'

module Homebrew
  def self.path
    Pathname.new('/usr/local')
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

  def self.opt_path
    path.join 'opt'
  end
end
