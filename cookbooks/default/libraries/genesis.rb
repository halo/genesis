module Genesis
  def self.users(&)
    Pathname.new('/Users')
            .children # [#<Pathname:/Users/.localized>, #<Pathname:/Users/admin>, #<Pathname:/Users/Shared>, #<Pathname:/Users/orange>]
            .map { ::File.stat(_1).uid } # [0, 501, 0, 502]
            .select(&:nonzero?) # [501, 502]
            .map { ::Genesis::User.new(id: _1) }
            .each(&)
  end

  def self.paths
    ::Genesis::Paths
  end
end
