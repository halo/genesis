require 'pathname'

module Biosphere

  def self.sphere_path
    Pathname.new ENV['BIOSPHERE_SPHERE_PATH']
  end

  def self.augmentations_path
    Pathname.new ENV['BIOSPHERE_SPHERE_AUGMENTATIONS_PATH']
  end

end
