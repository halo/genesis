default[:cask][:apps] = %w[
  alfred
  cyberduck
  font-inconsolata
  font-roboto
  font-roboto-mono
  google-chrome
  iterm2
  omnidisksweeper
  tor-browser
  visual-studio-code
]
# font-roboto-condensed broken?

if Console.profile? :orange, :blue
  default[:cask][:apps] += %w[
    1password
    dash4
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
