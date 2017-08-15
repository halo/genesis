default[:homebrew][:root]     = File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'homebrew')
# default[:homebrew][:revision] = '11d47e8325f50ab7993f3fca0432876da0ea1c11'

default[:homebrew][:formulae] = []
default[:homebrew][:formulae] += %w{
  autoconf
  duti
  git
  openssl
  rbenv
  ruby-build
}

if %w{ blue orange }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:homebrew][:formulae] += ['nginx --with-passenger']
  default[:homebrew][:formulae] += %w{
    dnsmasq
    homebrew/versions/qt55
    imagemagick
    memcached
    postgresql
    redis
  }
end

if %w{ orange }.include? ENV['BIOSPHERE_ENV_PROFILE']
  default[:homebrew][:formulae] += %w{
    ffmpeg
  }
  # homebrew/science/opencv
end

default[:homebrew][:edge_formulae] = %w{
  ruby-build
}

# openssl
#
