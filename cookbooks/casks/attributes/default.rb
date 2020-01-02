default[:cask][:apps] = %w[
  alfred
  cyberduck
  font-inconsolata
  font-roboto
  font-roboto-condensed
  google-chrome
  iterm2
  omnidisksweeper
  tor-browser
  visual-studio-code
]

if Console.profile? :orange, :blue
  default[:cask][:apps] += %w[
    1password
    dash
    firefox
    postico
  ]
end

if Console.profile? :blue
  default[:cask][:apps] += %w[
    docker
    vienna
  ]
end

unless Console.profile? :blue
  default[:cask][:apps] += %w[
    signal
  ]
end
