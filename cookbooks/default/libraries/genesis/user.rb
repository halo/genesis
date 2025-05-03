module Genesis
  class User
    attr_reader :id

    def initialize(id:)
      @id = id
    end

    def username
      Etc.getpwuid(id).name
    end

    def paths
      ::Genesis::Paths.new(home:)
    end

    def home
      Pathname.new(Etc.getpwuid(id).dir)
    end

    def orange?
      username == 'orange'
    end

    def green?
      username == 'green'
    end

    def purple?
      username == 'purple'
    end

    def silver
      username == 'silver'
    end

    def opinionated?
      orange? || green? || purple? || silver?
    end
  end
end
