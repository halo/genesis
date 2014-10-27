require 'pathname'

module Home
  def self.path
    home_path = ENV['HOME'] || '/dev/null'
    Pathname.new home_path
  end
end