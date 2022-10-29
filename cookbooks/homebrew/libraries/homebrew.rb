require 'pathname'

module Homebrew
  def self.path
    if RUBY_PLATFORM.include?('arm64')
      Pathname.new('/opt/homebrew')
    else
      Pathname.new('/usr/local')
    end
  end

  def self.bin_path
    path.join 'bin'
  end

  def self.brew_path
    bin_path.join 'brew'
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
