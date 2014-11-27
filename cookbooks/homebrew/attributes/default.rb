default[:homebrew][:root]     = File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'homebrew')
default[:homebrew][:revision] = '84d37e70c2830d64d181b6267e051f16fb271d29'

default[:homebrew][:formulae] = ['nginx --with-passenger']
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
  default[:homebrew][:formulae] += %w{
    go
    bazaar
  }
end

if %w{ orange }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:homebrew][:formulae] += %w{
    ffmpeg
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
