default[:homebrew][:root]     = File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'homebrew')
default[:homebrew][:revision] = 'c5cf0844324b76e990cd4eeb77d091e72445f2d4'

default[:homebrew][:formulae] = []
#default[:homebrew][:formulae] = ['nginx --with-passenger']
default[:homebrew][:formulae] += %w{
  autoconf
  brew-cask
  dnsmasq
  git
  openssl
  rbenv
  ruby-build
}


if %w{ orange }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:homebrew][:formulae] += %w{
    ffmpeg
    icu4c
    imagemagick
    memcached
    phantomjs
    postgresql
    pwgen
    redis
  }
end

default[:homebrew][:edge_formulae] = %w{
  brew-cask
  ruby-build
}
