# svn is needed for some google font casks
default[:homebrew][:formulae] = %w[
  autoconf
  autojump
  cmake
  duti
  ffmpeg
  mas
  mat2
  mkcert
  node
  openssl
  rbenv
  ruby-build
  svn
  telnet
  vips
  yarn
]

# Doesn't work for some reason (package not found)
# postgresql

default[:homebrew][:edge_formulae] = %w[
  tldr
]
