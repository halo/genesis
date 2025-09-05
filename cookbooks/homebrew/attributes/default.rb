ruby_build_dependencies = %w[openssl readline libyaml gmp autoconf]

# svn is needed for some google font casks
default[:homebrew][:formulae] = %w[
  autojump
  bash
  cmake
  duti
  ffmpeg
  mat2
  vips
] + ruby_build_dependencies

# Doesn't work for some reason (package not found)
# postgresql

default[:homebrew][:edge_formulae] = %w[
  tldr
]
