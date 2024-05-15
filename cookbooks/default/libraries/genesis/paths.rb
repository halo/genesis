module Genesis
  class Paths
    attr_reader :home

    def self.launch_daemons
      Pathname.new('/Library/LaunchDaemons')
    end

    def initialize(home:)
      @home = home
    end

    def applications
      home.join('Applications')
    end

    def library
      home.join('Library')
    end

    def public
      home.join('Public')
    end

    def ssh
      home.join('.ssh')
    end

    def by_host
      home.join('Library/Preferences/ByHost')
    end
  end
end
