default[:homebrew][:root]     = File.join(ENV['BIOSPHERE_SPHERE_PATH'], 'homebrew')
default[:homebrew][:revision] = 'd1dfea223958d3f527b18017cfa76d6a47f7c20c'

# 'passenger', 
default[:homebrew][:formulae] = ['nginx --with-passenger']
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
