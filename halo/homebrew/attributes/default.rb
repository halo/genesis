default[:homebrew][:root] = Biosphere.sphere_path.join 'homebrew'

default[:homebrew][:formulae] = []
default[:homebrew][:formulae] += %w[
  autoconf
  duti
  git
  openssl
  rbenv
  ruby-build
]

if Biosphere.profile? :orange, :blue
  default[:homebrew][:formulae] += %w[
    dnsmasq
    imagemagick
    memcached
    postgresql
    redis
  ]
end

default[:homebrew][:formulae] += ['nginx --with-passenger'] if Biosphere.profile? :orange, :red, :blue

if Biosphere.profile? :orange
  default[:homebrew][:formulae] += %w[
    ffmpeg
  ]
  # homebrew/science/opencv
end

default[:homebrew][:edge_formulae] = %w[
  ruby-build
]
# openssl
