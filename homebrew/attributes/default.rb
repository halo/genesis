default[:homebrew][:root] = Workdir.path.join 'homebrew'

default[:homebrew][:formulae] = %w[
  autoconf
  autojump
  duti
  ffmpeg
  iterm2
  openssl
  rbenv
  telnet
  tldr
  youtube-dl
]

# ghostscript is needed for imagemagick to handle PDFs
if Console.profile?(:orange)
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
    yarn
  ]
end

default[:homebrew][:edge_formulae] = %w[
]
