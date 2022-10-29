default[:homebrew][:taps] = %w[
  heroku/brew
  homebrew/cask-fonts
]

# svn is needed for some google font casks
default[:homebrew][:formulae] = %w[
  autoconf
  autojump
  cmake
  duti
  ffmpeg
  frum
  mas
  openssl
  svn
  telnet
]

if Console.profile?(:orange)
  default[:homebrew][:formulae] += %w[
    heroku/brew/heroku
    node
    postgresql@14
    redis
    vips
    yarn
  ]
end

default[:homebrew][:edge_formulae] = %w[
  tldr
  youtube-dl
]
