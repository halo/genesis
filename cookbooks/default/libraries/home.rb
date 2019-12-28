require 'pathname'

module Home
  def self.path
    Pathname.new('~').expand_path
  end

  def self.projects
    path.join('Code')
  end
end
