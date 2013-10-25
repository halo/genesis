default[:biosphere][:homebrew][:root]     = File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'homebrew')
default[:biosphere][:homebrew][:revision] = 'a012d0bcc1fa353eed823072d75d3cc80aa3fe25'

default[:biosphere][:homebrew][:formulae] = %w{
  autoconf
  git
  rbenv
  ruby-build
  brew-cask
}

if %w{ red blue }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:biosphere][:homebrew][:formulae] += %w{
    imagemagick
    elasticsearch
    memcached
    redis
    icu4c
    phantomjs
    mysql
  }
end

if %w{ blue }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:biosphere][:homebrew][:formulae] += %w{
    postgresql
    phantomjs
  }
end
