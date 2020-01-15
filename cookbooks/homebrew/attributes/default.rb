
default[:homebrew][:taps] = %w[
  heroku/brew
  homebrew/cask-fonts
]

default[:homebrew][:formulae] = %w[
  autoconf
  autojump
  cmake
  duti
  ffmpeg
  mas
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
    heroku/brew/heroku
    imagemagick
    memcached
    nginx
    nmap
    node
    passenger
    postgresql
    redis
    vips
    yarn
  ]
end

default[:homebrew][:edge_formulae] = %w[
  youtube-dl
]
