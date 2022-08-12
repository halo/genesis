
default[:homebrew][:taps] = %w[
  heroku/brew
  homebrew/cask-fonts
  homebrew/cask-versions
]

# svn is needed for some google font casks
default[:homebrew][:formulae] = %w[
  autoconf
  autojump
  cmake
  duti
  ffmpeg
  mas
  openssl
  svn
  telnet
  tldr
  youtube-dl
]

if Console.profile?(:orange)
  default[:homebrew][:formulae] += %w[
    frum
    heroku/brew/heroku
    memcached
    nmap
    node
    postgresql
    redis
    vips
    yarn
  ]
end

default[:homebrew][:edge_formulae] = %w[
  youtube-dl
]
