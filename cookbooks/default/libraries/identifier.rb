module Identifier
  def self.join(suffix)
    "io.github.halo.genesis.#{suffix}"
  end

  def self.organization
    'halo'
  end
end
