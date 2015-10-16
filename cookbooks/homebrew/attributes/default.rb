default[:homebrew][:root]     = File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'homebrew')
default[:homebrew][:revision] = '93cb258bccc9ff4def79210471a681ab36bced33'

default[:homebrew][:formulae] = []
default[:homebrew][:formulae] += %w{
  autoconf
  brew-cask
  dnsmasq
  git
  openssl
  rbenv
  ruby-build
  duti
}

if %w{ blue orange }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:homebrew][:formulae] += ['nginx --with-passenger']
end

if %w{ orange }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:homebrew][:formulae] += %w{
    ffmpeg
    imagemagick
    memcached
    postgresql
    redis
    qt5
  }
end

default[:homebrew][:edge_formulae] = %w{
  brew-cask
}

# openssl
# ruby-build
