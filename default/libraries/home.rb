require 'pathname'

module Home
  def self.path
    Pathname.new('~').expand_path
  end
end
