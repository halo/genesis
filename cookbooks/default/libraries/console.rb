module Console
  # Currently logged in OS user (no matter whether it was changed using `su`)
  def self.user
    @user ||= Etc.getpwuid(::File.stat('/dev/console').uid).name
  end

  def self.profile?(*names)
    names.map(&:to_s).include? user
  end
end
