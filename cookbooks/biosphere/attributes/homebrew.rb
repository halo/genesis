default[:biosphere][:homebrew][:root]     = File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'homebrew')
default[:biosphere][:homebrew][:revision] = '7947b538f0d293d786204a56135a71bce1c2f35d'

default[:biosphere][:homebrew][:formulae] = ['nginx --with-passenger']
default[:biosphere][:homebrew][:formulae] += %w{
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
