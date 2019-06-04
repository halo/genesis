default[:homebrew][:root] = Workdir.path.join 'homebrew'

default[:homebrew][:formulae] = %w[
  autoconf
  duti
  ffmpeg
  openssl
  rbenv
  ruby-build
  telnet
]

# ghostscript is needed for imagemagick to handle PDFs
if Console.profile?(:orange, :blue)
  default[:homebrew][:formulae] += %w[
    ghostscript
    imagemagick
    memcached
    nginx
    nmap
    node
    passenger
    postgresql
    redis
  ]
end

default[:homebrew][:edge_formulae] = %w[
  ruby-build
]
