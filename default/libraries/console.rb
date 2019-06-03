module Console
  def self.user
    @user ||= Etc.getpwuid(::File.stat('/dev/console').uid).name
  end

  def profile?(*names)
    names.map(&:to_s).include? user
  end
end
