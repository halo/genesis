default[:cask][:apps] = %w[
  alfred
  cyberduck
  font-inconsolata
  font-roboto
  font-roboto-condensed
  google-chrome
  iterm2
  omnidisksweeper
  signal
  tor-browser
  vienna
  visual-studio-code
]

if Console.profile? :orange, :blue
  default[:cask][:apps] += %w[
    1password
    firefox
    postico
  ]
end

if Console.profile? :blue
  default[:cask][:apps] += %w[
    docker
  ]
end
