default[:cask][:apps] = %w[
  alfred
  cyberduck
  font-inconsolata
  font-roboto
  font-roboto-mono
  google-chrome
  iterm2
  tor-browser
  signal
  visual-studio-code
]
# font-roboto-condensed broken?

if Console.profile? :orange
  default[:cask][:apps] += %w[
    1password
    dash4
    postico
  ]
end
