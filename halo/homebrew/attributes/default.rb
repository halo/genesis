default[:homebrew][:root]     = File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'homebrew')
default[:homebrew][:revision] = '11bd3cbdb3e354e5b42eda892be976b988c200ec'

default[:homebrew][:formulae] = []
default[:homebrew][:formulae] += %w{
  autoconf
  caskroom/cask/brew-cask
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
  caskroom/cask/brew-cask
}

# openssl
# ruby-build
