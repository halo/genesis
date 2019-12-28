module Identifier
  def self.join(suffix)
    "io.github.halo.spheres.#{suffix}"
  end

  def self.organization
    'halo'
  end
end
