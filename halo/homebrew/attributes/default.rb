default[:homebrew][:root]     = File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'homebrew')
default[:homebrew][:revision] = '0123e04faed98c06dc395a2ec0d7fa0de2f56d5d'

default[:homebrew][:formulae] = []
default[:homebrew][:formulae] += %w{
  autoconf
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
  ruby-build
}

# openssl
#
