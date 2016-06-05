default[:homebrew][:root]     = File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'homebrew')
default[:homebrew][:revision] = '14657443ce4346254ede3df52670c5e641796cd4'

default[:homebrew][:formulae] = []
default[:homebrew][:formulae] += %w{
  autoconf
  dnsmasq
  git
  openssl
  rbenv
  ruby-build
  duti
  macosvpn
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
  ruby-build
}

# openssl
#
