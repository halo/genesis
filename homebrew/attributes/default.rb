default[:homebrew][:root] = Workdir.path.join 'homebrew'

default[:homebrew][:formulae] = %w[
  autoconf
  duti
  openssl
  rbenv
  ruby-build
]

## ghostscript is needed for imagemagick to handle PDFs
#if Console.profile?(:orange, :blue)
#  default[:homebrew][:formulae] += %w[
#    ghostscript
#    imagemagick
#    memcached
#    nmap
#    node
#    postgresql
#    redis
#    telnet
#    ffmpeg
#  ]
#  default[:homebrew][:formulae] += ['nginx --with-passenger']
#end

default[:homebrew][:edge_formulae] = %w[
  ruby-build
]
