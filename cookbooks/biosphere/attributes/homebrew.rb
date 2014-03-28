default[:biosphere][:homebrew][:root]     = File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'homebrew')
default[:biosphere][:homebrew][:revision] = '68b1af06cd3702e369e1d63ef868f9503947dddb'

default[:biosphere][:homebrew][:formulae] = ['passenger', 'nginx --with-passenger']
default[:biosphere][:homebrew][:formulae] += %w{
  autoconf
  brew-cask
  dnsmasq
  git
  openssl
  rbenv
  ruby-build
}


if %w{ red blue }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:biosphere][:homebrew][:formulae] += %w{
    imagemagick
    elasticsearch
    ffmpeg
    imagemagick
    memcached
    phantomjs
    postgresql
    pwgen
    redis
    icu4c
    phantomjs
    mysql
  }
end

if %w{ blue }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:biosphere][:homebrew][:formulae] += %w{

  }
end

default[:biosphere][:homebrew][:edge_formulae] = %w{
  brew-cask
  ruby-build
}
