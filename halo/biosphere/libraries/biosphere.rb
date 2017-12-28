require 'pathname'

module Biosphere
  def self.sphere_path
    Pathname.new ENV['BIOSPHERE_SPHERE_PATH']
  end

  def self.augmentations_path
    Pathname.new ENV['BIOSPHERE_SPHERE_AUGMENTATIONS_PATH']
  end

  def self.profile?(*names)
    names.map(&:to_s).include? ENV['BIOSPHERE_ENV_PROFILE']
  end
end
