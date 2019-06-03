module Internet
  def self.online?
    @online ||= system('ping -c 1 www.example.com &> /dev/null')
  end

  def self.offline?
    !online?
  end
end
