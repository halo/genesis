default[:cask][:apps] = %w[
  cyberduck
  disk-inventory-x
  firefox
  google-chrome
  mumble
  torbrowser
  textmate
]

if Biosphere.profile? :orange, :green, :blue
  default[:cask][:apps] += %w[
    arrsync
    quicksilver
  ]
end

if Biosphere.profile? :orange, :blue
  default[:cask][:apps] += %w[
    postico
  ]
end

if Biosphere.profile? :blue
  default[:cask][:apps] += %w[
    adium
  ]
end
