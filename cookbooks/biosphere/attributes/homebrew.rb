default[:biosphere][:homebrew][:root]     = File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'homebrew')
default[:biosphere][:homebrew][:revision] = 'd1dfea223958d3f527b18017cfa76d6a47f7c20c'

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
