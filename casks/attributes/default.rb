default[:cask][:apps] = %w[
  cyberduck
  font-inconsolata
  font-roboto
  font-roboto-condensed
  google-chrome
  iterm2
  mumble
  omnidisksweeper
  quicksilver
  signal
  textmate
  tor-browser
  vienna
]

if Console.profile? :orange, :blue
  default[:cask][:apps] += %w[
    firefox
    postico
  ]
end

if Console.profile? :blue
  default[:cask][:apps] += %w[
    docker
  ]
end
